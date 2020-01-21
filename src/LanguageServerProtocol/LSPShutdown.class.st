"
The shutdown request is sent from the client to the server. It asks the
server to shut down, but to not exit (otherwise the response might not be
delivered correctly to the client). There is a separate exit notification
that asks the server to exit. Clients must not send any notifications other
than exit or requests to a server to which they have sent a shutdown requests.
If a server receives requests after a shutdown request those requests should
be errored with InvalidRequest.
"
Class {
	#name : #LSPShutdown,
	#superclass : #LSPHandler,
	#category : #'LanguageServerProtocol-Handlers'
}

{ #category : #initialization }
LSPShutdown >> initialize [
	super initialize.
	self methodName: 'shutdown'
]
