"
I am the initial state of a LSP server.

If the server receives a request or notification in this state, it should act as follows:

For a request the response should be an error with code: -32002. The message can be picked by the server.
Notifications should be dropped, except for the exit notification. This will allow the exit of a server without an initialize request.

The server is not allowed to send any requests or notifications to the client until it has been initialized, with the exception that during the initialize request the server is allowed to send the notifications window/showMessage, window/logMessage and telemetry/event as well as the window/showMessageRequest request to the client.
"
Class {
	#name : #LSPUninitializedServer,
	#superclass : #LSPServerState,
	#category : #'LanguageServerProtocol-Model'
}

{ #category : #'as yet unclassified' }
LSPUninitializedServer >> enterState [
	self server
		addHandler: LSPInitialize new;
		defaultHandler: (JRPCBlockHandler new
								methodName: '*';
								block: [ LSPServerUninitialized signal ];
								yourself )
]

{ #category : #extracting }
LSPUninitializedServer >> extractInitializeParamsFrom: aJRPCRequestObject [
	^ self shouldBeImplemented
]

{ #category : #'handling - jrpc' }
LSPUninitializedServer >> handleJRPCNotificationObject: aJRPCNotificationObject [
	aJRPCNotificationObject method = 'exit'
		ifTrue: [ 
			^ self server lspExit ]

	"Do nothing, all other notifications are dropped according to LSP spec."
]

{ #category : #'handling - jrpc' }
LSPUninitializedServer >> handleJRPCRequestObject: aJRPCRequestObject [
	aJRPCRequestObject method = 'initialize'
		ifTrue: [ 
			^ self server lspInitializeWithParameters: (self extractInitializeParamsFrom: aJRPCRequestObject) ].
		
	LSPServerUninitialized signal
]
