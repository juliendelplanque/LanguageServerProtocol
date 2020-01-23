Class {
	#name : #LSPMessageProcessor,
	#superclass : #JRPCMessageProcessor,
	#instVars : [
		'defaultNotificationHandler',
		'defaultRequestHandler'
	],
	#category : #'LanguageServerProtocol-Protocol'
}

{ #category : #accessing }
LSPMessageProcessor >> defaultNotificationHandler [
	^ defaultNotificationHandler
]

{ #category : #accessing }
LSPMessageProcessor >> defaultNotificationHandler: anObject [
	defaultNotificationHandler := anObject
]

{ #category : #accessing }
LSPMessageProcessor >> defaultRequestHandler [
	^ defaultRequestHandler
]

{ #category : #accessing }
LSPMessageProcessor >> defaultRequestHandler: anObject [
	defaultRequestHandler := anObject
]

{ #category : #'handling - json' }
LSPMessageProcessor >> handleJSON: aJSONString [
	"Additionally to JRPC protocol data, we add headers required by the
	 Language Server Protocol Spec.
	"
	| returnedJRPCJSON |
	returnedJRPCJSON := super handleJSON: aJSONString.
	^ String streamContents: [ :writeStream |
		writeStream nextPutAll: 'Content-Length: '.
		writeStream print: returnedJRPCJSON size.
		writeStream nextPut: Character cr; nextPut: Character lf.
		writeStream nextPutAll: 'Content-Type: application/vscode-jsonrpc; charset=utf-8'.
		writeStream nextPut: Character cr; nextPut: Character lf.
		writeStream nextPut: Character cr; nextPut: Character lf.
		writeStream nextPutAll: returnedJRPCJSON ]
]

{ #category : #accessing }
LSPMessageProcessor >> handlerFor: aRequestOrNotification [
	^ [
		super handlerFor: aRequestOrNotification
	] on: JRPCNonExistentHandler
	do: [ :error |
		(aRequestOrNotification isRequest and: [ self defaultRequestHandler isNotNil ])
			ifTrue: [ self defaultRequestHandler ]
			ifFalse: [ 
				(aRequestOrNotification isNotification and: [ self defaultNotificationHandler isNotNil ])
					ifTrue: [ self defaultNotificationHandler ]
					ifFalse: [ error pass ] ] ]
]
