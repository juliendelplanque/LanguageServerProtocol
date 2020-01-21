"
The base protocol offers support for request cancellation.
To cancel a request, a notification message is sent.
"
Class {
	#name : #LSPCancelRequest,
	#superclass : #LSPHandler,
	#category : #'LanguageServerProtocol-Handlers'
}

{ #category : #initialization }
LSPCancelRequest >> initialize [
	super initialize.
	self methodName: '$/cancelRequest'
]
