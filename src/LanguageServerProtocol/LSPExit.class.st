"
A notification to ask the server to exit its process. The server should
exit with success code 0 if the shutdown request has been received before;
otherwise with error code 1.
"
Class {
	#name : #LSPExit,
	#superclass : #LSPHandler,
	#category : #'LanguageServerProtocol-Handlers'
}

{ #category : #initialization }
LSPExit >> initialize [
	super initialize.
	self methodName: 'exit'
]
