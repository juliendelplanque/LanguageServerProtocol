Class {
	#name : #LSPServer,
	#superclass : #Object,
	#instVars : [
		'jsonRpcServer',
		'state'
	],
	#category : #'LanguageServerProtocol-Model'
}

{ #category : #'handling - jrpc' }
LSPServer >> handleJRPCNotificationObject: aJRPCNotificationObject [
	^ self state handleJRPCNotificationObject: aJRPCNotificationObject
]

{ #category : #'handling - jrpc' }
LSPServer >> handleJRPCRequestObject: aJRPCRequestObject [
	^ self state handleJRPCRequestObject: aJRPCRequestObject
]

{ #category : #initialization }
LSPServer >> initialize [
	super initialize.
	self state: LSPUninitializedServer new
]

{ #category : #accessing }
LSPServer >> jsonRpcServer [
	^ jsonRpcServer
]

{ #category : #accessing }
LSPServer >> jsonRpcServer: anObject [
	jsonRpcServer := anObject
]

{ #category : #'state transitions' }
LSPServer >> lspExit [
	self shouldBeImplemented
]

{ #category : #'state transitions' }
LSPServer >> lspInitializeWithParameters: initializeParams [
	self flag: #TODO. "Handle initializeParams"
	
	self state: LSPRunningServer new
]

{ #category : #'state transitions' }
LSPServer >> lspShutdown [
	self shouldBeImplemented
]

{ #category : #accessing }
LSPServer >> state [
	^ state
]

{ #category : #accessing }
LSPServer >> state: aServerState [
	state := aServerState.
	state server: self
]
