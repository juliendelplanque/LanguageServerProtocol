"
The initialized notification is sent from the client to the server after the
client received the result of the initialize request but before the client is
sending any other request or notification to the server. The server can use the
initialized notification for example to dynamically register capabilities. The
initialized notification may only be sent once.
"
Class {
	#name : #LSPInitialized,
	#superclass : #LSPHandler,
	#category : #'LanguageServerProtocol-Handlers'
}

{ #category : #initialization }
LSPInitialized >> initialize [
	super initialize.
	self methodName: 'initialized'
]
