Class {
	#name : #LSPMessageProcessor,
	#superclass : #JRPCMessageProcessor,
	#category : #'LanguageServerProtocol-Protocol'
}

{ #category : #'handling - json' }
LSPMessageProcessor >> handleJSON: aJSONString [
	"Additionally to JRPC protocol data, we add headers required by the
	 Language Server Protocol Spec.
	"
	| returnedJRPCJSON |
	returnedJRPCJSON := super handleJSON: aJSONString.
	^ String streamContents: [ :writeStream |
		writeStream nextPutAll: 'Content-Length: '.
		writeStream print: returnedJRPCJSON size.
		writeStream nextPut: Character cr; nextPut: Character lf.
		writeStream nextPutAll: 'Content-Type: application/vscode-jsonrpc; charset=utf-8'.
		writeStream nextPut: Character cr; nextPut: Character lf.
		writeStream nextPut: Character cr; nextPut: Character lf.
		writeStream nextPutAll: returnedJRPCJSON ]
]
