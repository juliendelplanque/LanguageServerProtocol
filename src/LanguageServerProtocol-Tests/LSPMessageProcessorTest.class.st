"
A LSPMessageProcessorTest is a test class for testing the behavior of LSPMessageProcessor
"
Class {
	#name : #LSPMessageProcessorTest,
	#superclass : #TestCase,
	#category : #'LanguageServerProtocol-Tests-Protocol'
}

{ #category : #test }
LSPMessageProcessorTest >> testDefaultNotificationHandler [
	| processor response executed |
	processor := LSPMessageProcessor new.
	executed := false.
	
	processor defaultNotificationHandler: (JRPCBlockHandler new
													block: [ executed := true ];
													yourself).
													
	response := processor handleJRPCNotificationObject: (JRPCNotificationObject method: 'doesnotexists').
	
	self assert: response class equals: JRPCEmptyResponseObject.
	self assert: executed
]

{ #category : #test }
LSPMessageProcessorTest >> testDefaultRequestHandler [
	| processor response |
	processor := LSPMessageProcessor new.
	
	processor defaultRequestHandler: (JRPCBlockHandler new
													block: [ 42 ];
													yourself).
													
	response := processor handleJRPCRequestObject: (JRPCRequestObject id: 1 method: 'doesnotexists').
	
	self assert: response class equals: JRPCSuccessResponseObject.
	self assert: response result equals: 42
]

{ #category : #test }
LSPMessageProcessorTest >> testDefaultRequestHandlerRaiseError [
	| processor response |
	processor := LSPMessageProcessor new.
	
	"Default request handler can be used to raise custom error instead of handler not found."
	processor defaultRequestHandler: (JRPCBlockHandler new
													block: [ LSPServerUninitialized signal ];
													yourself).
													
	response := processor handleJRPCRequestObject: (JRPCRequestObject id: 1 method: 'doesnotexists').
	
	self assert: response class equals: JRPCErrorResponseObject.
	self assert: response error code equals: LSPServerUninitialized errorObject code.
	self assert: response error message equals: LSPServerUninitialized errorObject message.
]

{ #category : #test }
LSPMessageProcessorTest >> testHandleJSON [
	| processor result |
	processor := LSPMessageProcessor new.
	processor debugMode: true.
	
	processor addHandlerNamed: 'sqrt' block: [ :x | x sqrt ].
	
	result := processor handleJSON: (STONJSON toString: (JRPCRequestObject  id: 1 method: 'sqrt' params: #(4)) asJRPCJSON).
	
	self assert: result equals: 'Content-Length: 35
Content-Type: application/vscode-jsonrpc; charset=utf-8

{"jsonrpc":"2.0","result":2,"id":1}'
]
