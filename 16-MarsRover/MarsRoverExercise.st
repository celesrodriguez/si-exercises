!classDefinition: #MarsRoverTest category: 'MarsRoverExercise'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

!MarsRoverTest methodsFor: 'actions' stamp: 'CR 10/26/2020 00:08:10'!
test01xxx
	| aMarsRover |
	aMarsRover := MarsRover withPosition: 0@0 andDirection: 'N'.
	self 
		should: [aMarsRover performInstructions: '']
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: MarsRover cantPerformInvalidAction ].
	
	! !

!MarsRoverTest methodsFor: 'actions' stamp: 'CR 10/26/2020 00:40:49'!
test02xxx
	| aMarsRover |
	aMarsRover := MarsRover withPosition: 0@0 andDirection: 'N'.
	aMarsRover performInstructions: 'f'.
	self assert: aMarsRover position equals: 0@1.
	
	! !

!MarsRoverTest methodsFor: 'actions' stamp: 'CR 10/26/2020 00:19:15'!
test03xxx
	| aMarsRover |
	aMarsRover := MarsRover withPosition: 0@0 andDirection: 'N'.
	aMarsRover performInstructions: 'b'.
	self assert: aMarsRover position equals: 0@(-1).
	
	! !

!MarsRoverTest methodsFor: 'actions' stamp: 'CR 10/26/2020 01:35:34'!
test04xxx
	| aMarsRover |
	aMarsRover := MarsRover withPosition: 0@0 andDirection: 'N'.
	aMarsRover performInstructions: 'l'.
	self assert: (aMarsRover direction isKindOf: West).
	
	! !

!MarsRoverTest methodsFor: 'actions' stamp: 'CR 10/26/2020 01:26:06'!
test05xxx
	| aMarsRover |
	aMarsRover := MarsRover withPosition: 0@0 andDirection: 'N'.
	aMarsRover performInstructions: 'r'.
	self assert: (aMarsRover direction isKindOf: East).
	
	! !

!MarsRoverTest methodsFor: 'actions' stamp: 'CR 10/26/2020 00:40:59'!
test06xxx
	| aMarsRover |
	aMarsRover := MarsRover withPosition: 0@0 andDirection: 'E'.
	aMarsRover performInstructions: 'f'.
	self assert: aMarsRover position equals: 1@0.
	
	! !

!MarsRoverTest methodsFor: 'actions' stamp: 'CR 10/26/2020 01:20:06'!
test07xxx
	| aMarsRover |
	aMarsRover := MarsRover withPosition: 0@0 andDirection: 'E'.
	aMarsRover performInstructions: 'b'.
	self assert: aMarsRover position equals: -1@0.
	
	! !

!MarsRoverTest methodsFor: 'actions' stamp: 'CR 10/26/2020 01:27:56'!
test08xxx
	| aMarsRover |
	aMarsRover := MarsRover withPosition: 0@0 andDirection: 'E'.
	aMarsRover performInstructions: 'l'.
	self assert: (aMarsRover direction isKindOf: North).
	
	! !

!MarsRoverTest methodsFor: 'actions' stamp: 'CR 10/26/2020 01:28:38'!
test09xxx
	| aMarsRover |
	aMarsRover := MarsRover withPosition: 0@0 andDirection: 'E'.
	aMarsRover performInstructions: 'r'.
	self assert: (aMarsRover direction isKindOf: South).
	
	! !

!MarsRoverTest methodsFor: 'actions' stamp: 'CR 10/26/2020 02:01:39'!
test10xxx
	| aMarsRover |
	aMarsRover := MarsRover withPosition: 0@0 andDirection: 'S'.
	aMarsRover performInstructions: 'rr'.
	self assert: (aMarsRover direction isKindOf: North).
	
	! !


!classDefinition: #Direction category: 'MarsRoverExercise'!
Object subclass: #Direction
	instanceVariableNames: 'marsRoverAttachedTo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

!Direction methodsFor: 'as yet unclassified' stamp: 'CR 10/26/2020 01:07:36'!
initializeWith: aMarsRoverToBeAttachedTo
	
	marsRoverAttachedTo := aMarsRoverToBeAttachedTo.! !

!Direction methodsFor: 'as yet unclassified' stamp: 'CR 10/26/2020 01:16:35'!
moveBackward
	self subclassResponsibility.! !

!Direction methodsFor: 'as yet unclassified' stamp: 'CR 10/26/2020 01:16:31'!
moveForward
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Direction class' category: 'MarsRoverExercise'!
Direction class
	instanceVariableNames: ''!

!Direction class methodsFor: 'as yet unclassified' stamp: 'CR 10/26/2020 01:06:26'!
for: aMarsRoverToBeAttachedTo
	
	^self new initializeWith: aMarsRoverToBeAttachedTo. ! !


!classDefinition: #East category: 'MarsRoverExercise'!
Direction subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

!East methodsFor: 'as yet unclassified' stamp: 'CR 10/26/2020 01:18:33'!
moveBackward
	marsRoverAttachedTo moveWest.! !

!East methodsFor: 'as yet unclassified' stamp: 'CR 10/26/2020 01:17:04'!
moveForward
	marsRoverAttachedTo moveEast.! !

!East methodsFor: 'as yet unclassified' stamp: 'CR 10/26/2020 01:36:22'!
rotateLeft
	marsRoverAttachedTo pointToNorth.! !

!East methodsFor: 'as yet unclassified' stamp: 'CR 10/26/2020 01:36:30'!
rotateRight
	marsRoverAttachedTo pointToSouth.! !


!classDefinition: #North category: 'MarsRoverExercise'!
Direction subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

!North methodsFor: 'as yet unclassified' stamp: 'CR 10/26/2020 01:19:00'!
moveBackward
	marsRoverAttachedTo moveSouth.! !

!North methodsFor: 'as yet unclassified' stamp: 'CR 10/26/2020 01:18:51'!
moveForward
	marsRoverAttachedTo moveNorth.! !

!North methodsFor: 'as yet unclassified' stamp: 'CR 10/26/2020 01:37:22'!
rotateLeft
	marsRoverAttachedTo pointToWest. ! !

!North methodsFor: 'as yet unclassified' stamp: 'CR 10/26/2020 01:37:35'!
rotateRight
	marsRoverAttachedTo pointToEast. ! !


!classDefinition: #South category: 'MarsRoverExercise'!
Direction subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!


!classDefinition: #West category: 'MarsRoverExercise'!
Direction subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!


!classDefinition: #MarsRover category: 'MarsRoverExercise'!
Object subclass: #MarsRover
	instanceVariableNames: 'currentPosition currentDirection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

!MarsRover methodsFor: 'initialization' stamp: 'CR 10/26/2020 01:43:08'!
initializeWithPosition: aCardinalPointToStartOn andDirection: aCardinalOrientationToPointTo 
	(aCardinalOrientationToPointTo isEqualTo: 'N') ifTrue: [self pointToNorth].
	(aCardinalOrientationToPointTo isEqualTo: 'E') ifTrue: [self pointToEast].
	(aCardinalOrientationToPointTo isEqualTo: 'S') ifTrue: [self pointToSouth].
	currentPosition := aCardinalPointToStartOn.
	! !


!MarsRover methodsFor: 'instruction' stamp: 'CR 10/26/2020 01:20:46'!
moveEast

	currentPosition := (currentPosition x + 1 )@ currentPosition y! !

!MarsRover methodsFor: 'instruction' stamp: 'CR 10/26/2020 01:20:50'!
moveNorth

	currentPosition := currentPosition x @ (currentPosition y + 1)! !

!MarsRover methodsFor: 'instruction' stamp: 'CR 10/26/2020 01:20:53'!
moveSouth

	currentPosition := currentPosition x @ (currentPosition y - 1 )! !

!MarsRover methodsFor: 'instruction' stamp: 'CR 10/26/2020 01:21:19'!
moveWest

	currentPosition := (currentPosition x - 1 ) @ currentPosition y! !

!MarsRover methodsFor: 'instruction' stamp: 'CR 10/26/2020 02:01:04'!
performInstructions: instructionSequenceToPerform

	(instructionSequenceToPerform isEmpty) ifTrue: [self class signalInvalidInstruction].
	
	instructionSequenceToPerform do: [ : anInstructionToPerform |
		 ( 'fbrl' includes: anInstructionToPerform) ifTrue: [
			(anInstructionToPerform isEqualTo: $f) ifTrue: [
			currentDirection moveForward.		].
			(anInstructionToPerform isEqualTo: $b) ifTrue: [
		currentDirection moveBackward. ].
			(anInstructionToPerform isEqualTo: $l) ifTrue: [currentDirection rotateLeft].
			(anInstructionToPerform isEqualTo: $r) ifTrue: [currentDirection rotateRight].		
			] ifFalse:[
			self signalInvalidInstruction.		
			]
		
		].
	"
	(instructionSequenceToPerform isEqualTo: 'f') ifTrue: [
		currentDirection moveForward.
		].
	(instructionSequenceToPerform isEqualTo: 'b') ifTrue: [
		currentDirection moveBackward.
		].
	
	(instructionSequenceToPerform isEqualTo: 'l') ifTrue: [currentDirection rotateLeft].
	(instructionSequenceToPerform isEqualTo: 'r') ifTrue: [currentDirection rotateRight].
	"
	 ! !

!MarsRover methodsFor: 'instruction' stamp: 'CR 10/26/2020 01:37:57'!
pointToEast
	
	currentDirection := East for: self.! !

!MarsRover methodsFor: 'instruction' stamp: 'CR 10/26/2020 01:36:41'!
pointToNorth
	
	currentDirection := North for: self.! !

!MarsRover methodsFor: 'instruction' stamp: 'CR 10/26/2020 01:34:40'!
pointToSouth
	
	currentDirection := South for: self.! !

!MarsRover methodsFor: 'instruction' stamp: 'CR 10/26/2020 01:37:50'!
pointToWest
	
	currentDirection := West for: self.! !


!MarsRover methodsFor: 'accessing' stamp: 'CR 10/26/2020 00:22:43'!
direction
	^currentDirection.! !

!MarsRover methodsFor: 'accessing' stamp: 'CR 10/26/2020 00:17:45'!
position
	^currentPosition.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRoverExercise'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'CR 10/25/2020 23:51:59'!
withPosition: aCardinalPointToStartOn andDirection: aCardinalOrientationToPointTo
	
	^self new initializeWithPosition: aCardinalPointToStartOn andDirection: aCardinalOrientationToPointTo.! !


!MarsRover class methodsFor: 'error messages' stamp: 'CR 10/26/2020 00:01:33'!
signalInvalidInstruction
	self error: MarsRover cantPerformInvalidAction.! !


!MarsRover class methodsFor: 'as yet unclassified' stamp: 'CR 10/26/2020 00:02:31'!
cantPerformInvalidAction
	
	^'Cant perform invalid instruction'! !
