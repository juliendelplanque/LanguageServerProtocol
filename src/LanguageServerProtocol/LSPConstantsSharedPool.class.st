Class {
	#name : #LSPConstantsSharedPool,
	#superclass : #SharedPool,
	#classVars : [
		'UninitializedServerError'
	],
	#category : #'LanguageServerProtocol-Protocol'
}

{ #category : #'class initialization' }
LSPConstantsSharedPool class >> initialize [
	self initializeErrorCodes.
]

{ #category : #initialization }
LSPConstantsSharedPool class >> initializeErrorCodes [
	UninitializedServerError := -32002
]
