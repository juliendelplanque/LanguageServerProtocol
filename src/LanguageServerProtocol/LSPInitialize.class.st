"
The initialize request is sent as the first request from the client to the server.
If the server receives a request or notification before the initialize request it
should act as follows:

For a request the response should be an error with code: -32002. The message can
be picked by the server.
Notifications should be dropped, except for the exit notification. This will allow
the exit of a server without an initialize request.
Until the server has responded to the initialize request with an InitializeResult,
the client must not send any additional requests or notifications to the server.
In addition the server is not allowed to send any requests or notifications to the
client until it has responded with an InitializeResult, with the exception that during
the initialize request the server is allowed to send the notifications window/showMessage,
window/logMessage and telemetry/event as well as the window/showMessageRequest request
to the client.

The initialize request may only be sent once.
"
Class {
	#name : #LSPInitialize,
	#superclass : #LSPHandler,
	#category : #'LanguageServerProtocol-Handlers'
}

{ #category : #accessing }
LSPInitialize class >> defaultMethodName [
	^ 'initialize'
]

{ #category : #initialization }
LSPInitialize >> initialize [
	super initialize.
	self methodName: 'initialize'
]
