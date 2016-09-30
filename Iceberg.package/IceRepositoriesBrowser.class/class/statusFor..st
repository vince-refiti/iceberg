utilities
statusFor: entity
	"entity could be a repository or a package"
	
	| status incomming outgoing | 
	entity isLoaded ifFalse: [ ^ 'Not loaded.' ].
	
	status := OrderedCollection new.
	entity isModified ifTrue: [ status add: 'Uncommited changes' ].
	
	incomming := entity incommingCommits size.
	incomming > 0 ifTrue: [ status add: ('{1} incomming' format: { incomming })].
	
	outgoing := entity outgoingCommits size.
	outgoing > 0 ifTrue: [ status add: ('{1} not published' format: { outgoing })].

	^ status ifEmpty: 'Up to date' ifNotEmpty: [ ', ' join: status ]
