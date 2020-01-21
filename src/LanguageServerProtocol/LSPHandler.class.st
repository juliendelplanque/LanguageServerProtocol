Class {
	#name : #LSPHandler,
	#superclass : #JRPCAbstractHandler,
	#category : #'LanguageServerProtocol-Handlers'
}

{ #category : #testing }
LSPHandler >> expectNotification [
	"Returns true if the handler expects a notification.
	 Else, returns false which means the handler expectes a request.
	 To be defined by concrete subclasses.
	"
	^ self expectRequest not
]

{ #category : #testing }
LSPHandler >> expectRequest [
	"Returns true if the handler expects a request.
	 Else, returns false which means the handler expectes a notification.
	 To be defined by concrete subclasses.
	"
	^ self subclassResponsibility
]
