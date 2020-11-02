!classDefinition: #TerniLapilliTest category: 'Ejercicio - TerniLapilli'!
TestCase subclass: #TerniLapilliTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio - TerniLapilli'!

!TerniLapilliTest methodsFor: 'tests' stamp: 'BT 11/1/2020 23:59:26'!
test01aNewGameIsNotOver

	| aJustStartedMatch |
	aJustStartedMatch := TerniLapilli newGame.
	self deny: aJustStartedMatch isOver.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BT 11/1/2020 23:59:07'!
test02XstartsPlaying

	| aJustStartedMatch |
	aJustStartedMatch := TerniLapilli newGame.
	self assert: aJustStartedMatch isPlayingX.
	self deny: aJustStartedMatch isPlayingO.
	self deny: aJustStartedMatch isOver.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'CR 11/2/2020 00:51:17'!
test04verifyPointIsInValidRange

	| aJustStartedMatch |
	aJustStartedMatch := TerniLapilli newGame.
	
	self should: [aJustStartedMatch setXAt: -1@0.] 
	raise: Error   
	withMessageText: TerniLapilli errorOutOfRangePosition.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'CR 11/2/2020 00:51:24'!
test05XPlaysAndGameChangesTurnToO

	| aJustStartedMatch |
	aJustStartedMatch := TerniLapilli newGame.
	aJustStartedMatch setXAt: 1@1.
	
	self deny: aJustStartedMatch isPlayingX.
	self assert: aJustStartedMatch isPlayingO.
	self deny: aJustStartedMatch isOver.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'CR 11/2/2020 00:53:58'!
test06verifyPointIsInValidRange

	| aJustStartedMatch |
	aJustStartedMatch := TerniLapilli newGame.
	
	self should: [aJustStartedMatch setXAt: 1@1. aJustStartedMatch setXAt: 2@1.] 
	raise: Error   
	withMessageText: TerniLapilli errorInvalidPlayer.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'CR 11/2/2020 00:57:52'!
test07raisesErrorWhenOStarts

	| aJustStartedMatch |
	aJustStartedMatch := TerniLapilli newGame.
	
	self should: [aJustStartedMatch setOAt: 1@1.] 
	raise: Error   
	withMessageText: TerniLapilli errorInvalidPlayer.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'CR 11/2/2020 01:40:52'!
test08setYOnAlreadyOccupiedPositionRaisesError

	| aJustStartedMatch |
	aJustStartedMatch := TerniLapilli newGame.
	aJustStartedMatch setXAt: 1@1.
	
	self should: [aJustStartedMatch setOAt: 1@1.] 
	raise: Error   
	withMessageText: TerniLapilli errorAlreadyOccupiedPosition.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'CR 11/2/2020 01:53:07'!
test09setPositionToPlayerWorksCorrectly

	| aMatch |
	aMatch := TerniLapilli newGame.
	aMatch setXAt: 1@1.
	aMatch setOAt: 2@1.
	self assert: (aMatch doesPositionBelongToX: 1@1).
	self assert: (aMatch doesPositionBelongToO: 2@1).
	self deny: aMatch isOver.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'CR 11/2/2020 02:19:44'!
test10cantAddMoreThanSixGamePieces

	| aMatch |
	aMatch := TerniLapilli newGame.
	aMatch setXAt: 1@1.
	aMatch setOAt: 3@1.
	aMatch setXAt: 1@3.
	aMatch setOAt: 1@2.
	aMatch setXAt: 3@2.
	aMatch setOAt: 3@3.
	self deny: aMatch isOver.
	self should: [aMatch setXAt: 2@3.] 
	raise: Error   
	withMessageText: TerniLapilli errorCantAddMoreThanSixGamePieces.

	
	! !


!classDefinition: #TLPosition category: 'Ejercicio - TerniLapilli'!
Object subclass: #TLPosition
	instanceVariableNames: 'terniLapilliGame owner row column'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio - TerniLapilli'!

!TLPosition methodsFor: 'as yet unclassified' stamp: 'CR 11/2/2020 01:29:22'!
initializeWithRow: aRowToSetPosition andColumn: aColumnToSetPosition
	row := aRowToSetPosition.
	column := aColumnToSetPosition.! !

!TLPosition methodsFor: 'as yet unclassified' stamp: 'CR 11/2/2020 01:37:20'!
setOwnerTo: aPlayer
	owner  := aPlayer.! !


!TLPosition methodsFor: 'accessing' stamp: 'CR 11/2/2020 01:39:22'!
isOccupied
	(owner = nil ) ifTrue: [^false] ifFalse: [^true].! !

!TLPosition methodsFor: 'accessing' stamp: 'CR 11/2/2020 01:47:57'!
isOwnerO
	^owner = 'O'.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TLPosition class' category: 'Ejercicio - TerniLapilli'!
TLPosition class
	instanceVariableNames: ''!

!TLPosition class methodsFor: 'as yet unclassified' stamp: 'CR 11/2/2020 01:28:23'!
onRow: row onColumn: column
	^self new initializeWithRow: row andColumn: column.! !


!classDefinition: #TerniLapilli category: 'Ejercicio - TerniLapilli'!
Object subclass: #TerniLapilli
	instanceVariableNames: 'isXsTurn gameBoard piecesInTheGame'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio - TerniLapilli'!

!TerniLapilli methodsFor: 'signals' stamp: 'CR 11/2/2020 02:05:22'!
signalCantAddMoreThanSixGamePieces

	^ self error: self class errorCantAddMoreThanSixGamePieces.! !

!TerniLapilli methodsFor: 'signals' stamp: 'CR 11/2/2020 00:46:26'!
signalInvalidPlayer

	^ self error: self class errorInvalidPlayer.! !

!TerniLapilli methodsFor: 'signals' stamp: 'CR 11/2/2020 00:46:32'!
signalPointOutOfRange

	^ self error: self class errorOutOfRangePosition.! !

!TerniLapilli methodsFor: 'signals' stamp: 'CR 11/2/2020 01:34:39'!
signalPositionAlreadyOccupied

	^ self error: self class errorAlreadyOccupiedPosition.! !


!TerniLapilli methodsFor: 'testing' stamp: 'BT 11/1/2020 23:48:47'!
isOver
	^ false.! !

!TerniLapilli methodsFor: 'testing' stamp: 'BT 11/2/2020 00:27:10'!
isPlayingO
	^ isXsTurn not .! !

!TerniLapilli methodsFor: 'testing' stamp: 'BT 11/2/2020 00:26:58'!
isPlayingX
	^ isXsTurn .! !

!TerniLapilli methodsFor: 'testing' stamp: 'CR 11/2/2020 02:26:49'!
verifyCurrentPlayerO
	isXsTurn ifTrue: [self signalInvalidPlayer]. ! !

!TerniLapilli methodsFor: 'testing' stamp: 'BT 11/2/2020 00:17:34'!
verifyCurrentPlayerX
	isXsTurn ifFalse: [self signalInvalidPlayer]. ! !


!TerniLapilli methodsFor: 'game - actions' stamp: 'CR 11/2/2020 02:06:41'!
occupyPosition: aPosition By: aPlayer

	(gameBoard at: aPosition) setOwnerTo: aPlayer. 
	piecesInTheGame := piecesInTheGame + 1.! !

!TerniLapilli methodsFor: 'game - actions' stamp: 'CR 11/2/2020 01:37:57'!
occupyPositionIfPossible: aPosition By: aPlayer
	((gameBoard at: aPosition) isOccupied) 
		ifTrue: [self signalPositionAlreadyOccupied]
		ifFalse: [self occupyPosition: aPosition By: aPlayer]! !

!TerniLapilli methodsFor: 'game - actions' stamp: 'CR 11/2/2020 01:11:39'!
setOAt: aPoint 
	self verifyCurrentPlayerO.
	self verifyItIsAValidPoint: aPoint.
	self occupyPositionIfPossible: aPoint By: 'O'.
	self changeCurrentPlayer.
! !

!TerniLapilli methodsFor: 'game - actions' stamp: 'CR 11/2/2020 02:02:53'!
setXAt: aPoint 
	self verifyNotAllPiecesInTheGame.
	self verifyCurrentPlayerX.
	self verifyItIsAValidPoint: aPoint.
	self occupyPositionIfPossible: aPoint By: 'X'.
	self changeCurrentPlayer.! !

!TerniLapilli methodsFor: 'game - actions' stamp: 'CR 11/2/2020 00:45:12'!
verifyItIsAValidPoint: aPointToCheckRange
	
	^((aPointToCheckRange x between: 1 and: 3) and: [aPointToCheckRange y between: 1 and: 3]) ifFalse: [self signalPointOutOfRange].

	! !

!TerniLapilli methodsFor: 'game - actions' stamp: 'CR 11/2/2020 02:04:52'!
verifyNotAllPiecesInTheGame
	(piecesInTheGame < 6) ifFalse: [self signalCantAddMoreThanSixGamePieces].! !


!TerniLapilli methodsFor: 'initialization' stamp: 'CR 11/2/2020 01:31:40'!
initializeBoard
	gameBoard := Dictionary new.
	1 to: 3 do: [ :row |
		1 to: 3 do: [ :column | |aNewBoardPosition |
			aNewBoardPosition := TLPosition onRow: row onColumn: column.
			gameBoard at: row@column put: aNewBoardPosition. 	
			]
		]
	! !

!TerniLapilli methodsFor: 'initialization' stamp: 'CR 11/2/2020 02:06:25'!
initializeGame
	isXsTurn := true.
	piecesInTheGame := 0.
	self initializeBoard.! !


!TerniLapilli methodsFor: 'private' stamp: 'BT 11/2/2020 00:23:24'!
changeCurrentPlayer
	isXsTurn := isXsTurn not.! !


!TerniLapilli methodsFor: 'accessing' stamp: 'CR 11/2/2020 01:47:11'!
doesPositionBelongToO: aPoint 
	^ (gameBoard at: aPoint) isOwnerO.! !

!TerniLapilli methodsFor: 'accessing' stamp: 'CR 11/2/2020 01:46:29'!
doesPositionBelongToX: aPoint 
	^ (self doesPositionBelongToO: aPoint) not. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: 'Ejercicio - TerniLapilli'!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'instance creation' stamp: 'BT 11/2/2020 00:22:16'!
newGame
	^ self new initializeGame.! !


!TerniLapilli class methodsFor: 'error messages' stamp: 'CR 11/2/2020 01:07:01'!
errorAlreadyOccupiedPosition
	^ 'This positions is already occupied by another!!'! !

!TerniLapilli class methodsFor: 'error messages' stamp: 'CR 11/2/2020 02:05:38'!
errorCantAddMoreThanSixGamePieces
	^ 'Error!! Cant add more than more than 6 game pieces'! !

!TerniLapilli class methodsFor: 'error messages' stamp: 'BT 11/2/2020 00:19:28'!
errorInvalidPlayer
	^ 'Wrong turn, unexpected player is playing!!'.! !

!TerniLapilli class methodsFor: 'error messages' stamp: 'BT 11/2/2020 00:32:34'!
errorOutOfRangePosition
	^ 'Out of range position!!'.! !
