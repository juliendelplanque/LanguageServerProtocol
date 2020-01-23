"
I am an abstract class to model the state of a server.

My subclasses model concrete states.
"
Class {
	#name : #LSPServerState,
	#superclass : #Object,
	#instVars : [
		'server'
	],
	#category : #'LanguageServerProtocol-Model'
}

{ #category : #'instance creation' }
LSPServerState class >> server: server [
	^ self new
		server: server;
		yourself
]

{ #category : #'state transitions' }
LSPServerState >> enterState [
	"Perform actions required when the server starts using myself as internal state."
	^ self subclassResponsibility
]

{ #category : #'state transitions' }
LSPServerState >> exitState [
	"Perform actions required when the server stops using myself as internal state."
	^ self subclassResponsibility
]

{ #category : #'handling - jrpc' }
LSPServerState >> handleJRPCNotificationObject: aJRPCNotificationObject [
	^ self subclassResponsibility
]

{ #category : #'handling - jrpc' }
LSPServerState >> handleJRPCRequestObject: aJRPCRequestObject [
	^ self subclassResponsibility
]

{ #category : #accessing }
LSPServerState >> server [
	^ server
]

{ #category : #accessing }
LSPServerState >> server: anObject [
	server := anObject
]
