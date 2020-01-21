"
I am the error raised when one attempt to make a request on an uninitialized server.
"
Class {
	#name : #LSPServerUninitialized,
	#superclass : #JRPCError,
	#category : #'LanguageServerProtocol-Errors'
}

{ #category : #accessing }
LSPServerUninitialized class >> errorCode [
	"As specified by LSP."
	^ -32002
]

{ #category : #factory }
LSPServerUninitialized class >> errorObject [
	^ JRPCErrorObject
		code: self errorCode
		message: 'The server is not initialized. The only possible method is "initialize".'
]

{ #category : #converting }
LSPServerUninitialized >> asJRPCResponseWithId: anInteger [
	^ JRPCErrorResponseObject id: anInteger error: self class errorObject
]
