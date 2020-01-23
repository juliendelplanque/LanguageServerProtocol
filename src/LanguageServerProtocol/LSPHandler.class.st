Class {
	#name : #LSPHandler,
	#superclass : #JRPCAbstractHandler,
	#instVars : [
		'lspServer'
	],
	#category : #'LanguageServerProtocol-Handlers'
}

{ #category : #accessing }
LSPHandler >> lspServer [
	^ lspServer
]

{ #category : #accessing }
LSPHandler >> lspServer: anObject [
	lspServer := anObject
]
