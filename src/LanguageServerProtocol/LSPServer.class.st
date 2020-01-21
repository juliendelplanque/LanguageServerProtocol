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

{ #category : #'changing state' }
LSPServer >> lspExit [
	self shouldBeImplemented
]

{ #category : #'changing state' }
LSPServer >> lspInitializeWithParameters: initializeParams [
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
