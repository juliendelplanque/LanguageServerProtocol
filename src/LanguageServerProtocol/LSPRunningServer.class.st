Class {
	#name : #LSPRunningServer,
	#superclass : #LSPServerState,
	#instVars : [
		'wasInitialized'
	],
	#category : #'LanguageServerProtocol-Model'
}

{ #category : #'handling - jrpc' }
LSPRunningServer >> handleJRPCRequestObject: aJRPCRequestObject [
	aJRPCRequestObject method = 'initialized'
		ifTrue: [ ^ self handleInitializedRequest: aJRPCRequestObject ].
		
	aJRPCRequestObject method = 'shutdown'
		ifTrue: [ ^ self server lspShutdown ].
	
	"Else we need to actually perform what the client asked."
	^ self shouldBeImplemented
]

{ #category : #initialization }
LSPRunningServer >> initialize [
	super initialize.
	wasInitialized := false.
]

{ #category : #accessing }
LSPRunningServer >> wasInitialized [
	^ wasInitialized
]
