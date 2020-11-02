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

!TerniLapilliTest methodsFor: 'tests' stamp: 'CR 11/2/2020 05:21:55'!
test03verifyPointIsInValidRange

	| aJustStartedMatch |
	aJustStartedMatch := TerniLapilli newGame.
	
	self should: [aJustStartedMatch setXAt: -1@0.] 
	raise: Error   
	withMessageText: TerniLapilli errorOutOfRangePosition.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'CR 11/2/2020 05:22:04'!
test04XPlaysAndGameChangesTurnToO

	| aJustStartedMatch |
	aJustStartedMatch := TerniLapilli newGame.
	aJustStartedMatch setXAt: 1@1.
	
	self deny: aJustStartedMatch isPlayingX.
	self assert: aJustStartedMatch isPlayingO.
	self deny: aJustStartedMatch isOver.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'CR 11/2/2020 05:22:11'!
test05verifyPointIsInValidRange

	| aJustStartedMatch |
	aJustStartedMatch := TerniLapilli newGame.
	
	self should: [aJustStartedMatch setXAt: 1@1. aJustStartedMatch setXAt: 2@1.] 
	raise: Error   
	withMessageText: TerniLapilli errorInvalidPlayer.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'CR 11/2/2020 05:22:17'!
test06raisesErrorWhenOStarts

	| aJustStartedMatch |
	aJustStartedMatch := TerniLapilli newGame.
	
	self should: [aJustStartedMatch setOAt: 1@1.] 
	raise: Error   
	withMessageText: TerniLapilli errorInvalidPlayer.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'CR 11/2/2020 05:22:23'!
test07setYOnAlreadyOccupiedPositionRaisesError

	| aJustStartedMatch |
	aJustStartedMatch := TerniLapilli newGame.
	aJustStartedMatch setXAt: 1@1.
	
	self should: [aJustStartedMatch setOAt: 1@1.] 
	raise: Error   
	withMessageText: TerniLapilli errorAlreadyOccupiedPosition.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'CR 11/2/2020 05:54:53'!
test08setPositionToPlayerWorksCorrectly

	| aMatch |
	aMatch := TerniLapilli newGame.
	aMatch setXAt: 1@1.
	aMatch setOAt: 2@1.
	self assert: (aMatch doesPositionBelongToX: 1@1).
	self assert: (aMatch doesPositionBelongToO: 2@1).
	self deny: aMatch isOver.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'CR 11/2/2020 05:22:55'!
test09cantAddMoreThanSixGamePieces

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'CR 11/2/2020 05:47:01'!
test10horizontalVictoryWorksCorrectly

	| aMatch |
	aMatch := TerniLapilli newGame.
	aMatch setXAt: 1@1.
	aMatch setOAt: 3@1.
	aMatch setXAt: 1@3.
	aMatch setOAt: 2@2.
	aMatch setXAt: 1@2.
	self assert: aMatch isOver.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'CR 11/2/2020 05:46:52'!
test11verticalVictoryWorksCorrectly

	| aMatch |
	aMatch := TerniLapilli newGame.
	aMatch setXAt: 1@1.
	aMatch setOAt: 3@3.
	aMatch setXAt: 2@1.
	aMatch setOAt: 2@2.
	aMatch setXAt: 3@1.
	self assert: aMatch isOver.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'CR 11/2/2020 05:46:43'!
test12diagonalVictoryWorksCorrectly

	| aMatch |
	aMatch := TerniLapilli newGame.
	aMatch setXAt: 2@1.
	aMatch setOAt: 3@1.
	aMatch setXAt: 1@2.
	aMatch setOAt: 2@2.
	aMatch setXAt: 3@2.
	aMatch setOAt: 1@3.
	self assert: aMatch isOver.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'CR 11/2/2020 06:39:03'!
test13moveOfNonOwnedPositionRaisesError

	| aMatch |
	aMatch := TerniLapilli newGame.
	aMatch setXAt: 2@1.
	aMatch setOAt: 3@1.
	aMatch setXAt: 1@2.
	aMatch setOAt: 2@2.
	aMatch setXAt: 3@2.
	aMatch setOAt: 2@3.
	self deny: aMatch isOver.
	self should: [aMatch moveXFrom: 2@3 to: 1@3.] 
	raise: Error   
	withMessageText: TerniLapilli errorCurrentPlayerDoesntOwnPosition. 
	
	
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'CR 11/2/2020 06:40:49'!
test14moveToOccupiedPositionRaisesError

	| aMatch |
	aMatch := TerniLapilli newGame.
	aMatch setXAt: 2@1.
	aMatch setOAt: 3@1.
	aMatch setXAt: 1@2.
	aMatch setOAt: 2@2.
	aMatch setXAt: 3@2.
	aMatch setOAt: 2@3.
	self deny: aMatch isOver.
	self should: [aMatch moveXFrom: 2@1 to: 2@2.] 
	raise: Error   
	withMessageText: TerniLapilli errorAlreadyOccupiedPosition. 
	
	
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'CR 11/2/2020 05:56:03'!
test20afterVictoryWeCantMoveAnything

	| aMatch |
	aMatch := TerniLapilli newGame.
	aMatch setXAt: 1@1.
	aMatch setOAt: 3@3.
	aMatch setXAt: 2@1.
	aMatch setOAt: 2@2.
	aMatch setXAt: 3@1.
	self assert: aMatch isOver. 
	self should: [aMatch setOAt: 1@2.] 
	raise: Error   
	withMessageText: TerniLapilli errorGameOver. 
	
	
	! !


!classDefinition: #TLPlayer category: 'Ejercicio - TerniLapilli'!
Object subclass: #TLPlayer
	instanceVariableNames: 'terniLapilliGame'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio - TerniLapilli'!

!TLPlayer methodsFor: 'initialization' stamp: 'CR 11/2/2020 03:39:14'!
initializeWithGame: aTLGameToBeAttachedTo

	terniLapilliGame := aTLGameToBeAttachedTo.! !


!TLPlayer methodsFor: 'accessing' stamp: 'CR 11/2/2020 03:45:27'!
isO
	self subclassResponsibility ! !

!TLPlayer methodsFor: 'accessing' stamp: 'CR 11/2/2020 03:46:07'!
isSomebody
	self subclassResponsibility ! !


!TLPlayer methodsFor: 'testing' stamp: 'CR 11/2/2020 03:45:47'!
ifItsSomebodyThenFail: aPositionOwnedByMe
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TLPlayer class' category: 'Ejercicio - TerniLapilli'!
TLPlayer class
	instanceVariableNames: ''!

!TLPlayer class methodsFor: 'instance creation' stamp: 'CR 11/2/2020 03:38:53'!
ofGame: aTLGameToBeAttachedTo
	^self new initializeWithGame: aTLGameToBeAttachedTo.! !


!classDefinition: #Nobody category: 'Ejercicio - TerniLapilli'!
TLPlayer subclass: #Nobody
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio - TerniLapilli'!

!Nobody methodsFor: 'accessing' stamp: 'CR 11/2/2020 02:59:42'!
isO
	^false.! !

!Nobody methodsFor: 'accessing' stamp: 'CR 11/2/2020 03:33:38'!
isSomebody
	^false.! !


!Nobody methodsFor: 'testing' stamp: 'CR 11/2/2020 06:31:49'!
failIfNotOwnedByO: aPositionOwnedByMe
	aPositionOwnedByMe failBecauseOnlyMyOwnerCanMoveMe. ! !

!Nobody methodsFor: 'testing' stamp: 'CR 11/2/2020 06:31:46'!
failIfNotOwnedByX: aPositionOwnedByMe
	aPositionOwnedByMe failBecauseOnlyMyOwnerCanMoveMe. ! !

!Nobody methodsFor: 'testing' stamp: 'CR 11/2/2020 03:44:22'!
ifItsSomebodyThenFail: aPositionOwnedByMe! !


!classDefinition: #O category: 'Ejercicio - TerniLapilli'!
TLPlayer subclass: #O
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio - TerniLapilli'!

!O methodsFor: 'accessing' stamp: 'CR 11/2/2020 02:41:40'!
isO
	^true.! !

!O methodsFor: 'accessing' stamp: 'CR 11/2/2020 03:33:27'!
isSomebody
	^true.! !


!O methodsFor: 'testing' stamp: 'CR 11/2/2020 03:52:44'!
changePlayer
	terniLapilliGame changeTurnToX.! !

!O methodsFor: 'testing' stamp: 'CR 11/2/2020 04:01:49'!
checkAndPlayOnOsTurn! !

!O methodsFor: 'testing' stamp: 'CR 11/2/2020 03:59:30'!
checkAndPlayOnXsTurn
	terniLapilliGame failBecauseItsNotMyTurn.! !

!O methodsFor: 'testing' stamp: 'CR 11/2/2020 06:29:48'!
failIfNotOwnedByO: aPositionOwnedByMe! !

!O methodsFor: 'testing' stamp: 'CR 11/2/2020 06:29:39'!
failIfNotOwnedByX: aPositionOwnedByMe
	aPositionOwnedByMe failBecauseOnlyMyOwnerCanMoveMe. ! !

!O methodsFor: 'testing' stamp: 'CR 11/2/2020 03:44:01'!
ifItsSomebodyThenFail: aPositionOwnedByMe
	aPositionOwnedByMe failBecauseItsAlreadyOccupied.! !


!classDefinition: #X category: 'Ejercicio - TerniLapilli'!
TLPlayer subclass: #X
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio - TerniLapilli'!

!X methodsFor: 'accessing' stamp: 'CR 11/2/2020 03:09:03'!
isO
	^false.! !

!X methodsFor: 'accessing' stamp: 'CR 11/2/2020 03:33:20'!
isSomebody
	^true.! !


!X methodsFor: 'testing' stamp: 'CR 11/2/2020 03:52:54'!
changePlayer
	terniLapilliGame changeTurnToO.! !

!X methodsFor: 'testing' stamp: 'CR 11/2/2020 04:01:57'!
checkAndPlayOnOsTurn
	terniLapilliGame failBecauseItsNotMyTurn.! !

!X methodsFor: 'testing' stamp: 'CR 11/2/2020 03:58:25'!
checkAndPlayOnXsTurn! !

!X methodsFor: 'testing' stamp: 'CR 11/2/2020 06:29:26'!
failIfNotOwnedByO: aPositionOwnedByMe
	aPositionOwnedByMe failBecauseOnlyMyOwnerCanMoveMe. ! !

!X methodsFor: 'testing' stamp: 'CR 11/2/2020 06:30:03'!
failIfNotOwnedByX: aPositionOwnedByMe! !

!X methodsFor: 'testing' stamp: 'CR 11/2/2020 03:44:11'!
ifItsSomebodyThenFail: aPositionOwnedByMe
	aPositionOwnedByMe failBecauseItsAlreadyOccupied.! !


!classDefinition: #TLPosition category: 'Ejercicio - TerniLapilli'!
Object subclass: #TLPosition
	instanceVariableNames: 'terniLapilliGame owner row column'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio - TerniLapilli'!

!TLPosition methodsFor: 'game interaction' stamp: 'CR 11/2/2020 06:12:21'!
free
	owner := Nobody ofGame: terniLapilliGame.! !

!TLPosition methodsFor: 'game interaction' stamp: 'CR 11/2/2020 04:07:36'!
setOwnerTo: aPlayerToBeAttachedTo
	owner  := aPlayerToBeAttachedTo.! !


!TLPosition methodsFor: 'testing' stamp: 'CR 11/2/2020 03:45:00'!
failBecauseItsAlreadyOccupied
	terniLapilliGame signalPositionAlreadyOccupied. ! !

!TLPosition methodsFor: 'testing' stamp: 'CR 11/2/2020 06:34:31'!
failBecauseOnlyMyOwnerCanMoveMe
	terniLapilliGame signalCurrentPlayerDoesntOwnPosition.! !

!TLPosition methodsFor: 'testing' stamp: 'CR 11/2/2020 06:38:42'!
failIfNotOwnedByO
	^owner failIfNotOwnedByO: self.! !

!TLPosition methodsFor: 'testing' stamp: 'CR 11/2/2020 06:38:20'!
failIfNotOwnedByX
	^owner failIfNotOwnedByX: self.! !

!TLPosition methodsFor: 'testing' stamp: 'CR 11/2/2020 03:41:28'!
failIfOccupied
	^owner ifItsSomebodyThenFail: self.! !


!TLPosition methodsFor: 'initialization' stamp: 'CR 11/2/2020 04:08:13'!
initializeWithRow: aTLPositionRow andColumn: aTLPositionColumn ofGame: aTLGameToBeAttachedTo
	row := aTLPositionRow.
	column := aTLPositionColumn.
	terniLapilliGame := aTLGameToBeAttachedTo.
	owner := Nobody ofGame: terniLapilliGame.! !


!TLPosition methodsFor: 'accessing' stamp: 'CR 11/2/2020 03:34:01'!
isOccupied
	^owner isSomebody.! !

!TLPosition methodsFor: 'accessing' stamp: 'CR 11/2/2020 03:46:59'!
itsOwnerIsO
	^owner isO.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TLPosition class' category: 'Ejercicio - TerniLapilli'!
TLPosition class
	instanceVariableNames: ''!

!TLPosition class methodsFor: 'as yet unclassified' stamp: 'CR 11/2/2020 03:49:19'!
onRow: row onColumn: column ofGame: aTLGameToBeAttachedTo
	^self new initializeWithRow: row andColumn: column ofGame: aTLGameToBeAttachedTo.! !


!classDefinition: #TerniLapilli category: 'Ejercicio - TerniLapilli'!
Object subclass: #TerniLapilli
	instanceVariableNames: 'currentPlayer gameBoard piecesInTheGame XPlayer OPlayer gameOver'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio - TerniLapilli'!

!TerniLapilli methodsFor: 'signals' stamp: 'CR 11/2/2020 04:00:15'!
failBecauseItsNotMyTurn
	self signalInvalidPlayer.! !

!TerniLapilli methodsFor: 'signals' stamp: 'CR 11/2/2020 02:05:22'!
signalCantAddMoreThanSixGamePieces

	^ self error: self class errorCantAddMoreThanSixGamePieces.! !

!TerniLapilli methodsFor: 'signals' stamp: 'CR 11/2/2020 06:34:20'!
signalCurrentPlayerDoesntOwnPosition

	^ self error: self class errorCurrentPlayerDoesntOwnPosition! !

!TerniLapilli methodsFor: 'signals' stamp: 'CR 11/2/2020 00:46:26'!
signalInvalidPlayer

	^ self error: self class errorInvalidPlayer.! !

!TerniLapilli methodsFor: 'signals' stamp: 'CR 11/2/2020 00:46:32'!
signalPointOutOfRange

	^ self error: self class errorOutOfRangePosition.! !

!TerniLapilli methodsFor: 'signals' stamp: 'CR 11/2/2020 01:34:39'!
signalPositionAlreadyOccupied

	^ self error: self class errorAlreadyOccupiedPosition.! !

!TerniLapilli methodsFor: 'signals' stamp: 'CR 11/2/2020 04:19:18'!
signalTheGameIsOver

	^ self error: self class errorGameOver.! !


!TerniLapilli methodsFor: 'testing' stamp: 'CR 11/2/2020 04:13:10'!
isOver
	^ gameOver.! !

!TerniLapilli methodsFor: 'testing' stamp: 'CR 11/2/2020 04:05:28'!
isPlayingO
	^ currentPlayer isO.! !

!TerniLapilli methodsFor: 'testing' stamp: 'CR 11/2/2020 04:05:44'!
isPlayingX
	^ self isPlayingO not.! !

!TerniLapilli methodsFor: 'testing' stamp: 'CR 11/2/2020 05:16:13'!
itsOccupied: firstPosition and: secondPosition and: thirdPosition

	^ firstPosition isOccupied and: [ secondPosition isOccupied and: [thirdPosition isOccupied]].! !

!TerniLapilli methodsFor: 'testing' stamp: 'CR 11/2/2020 05:20:09'!
sameOwner: firstPosition and: secondPosition and: thirdPosition
	| isOwnerO |
	isOwnerO := firstPosition itsOwnerIsO.
	
	^ (secondPosition itsOwnerIsO = thirdPosition itsOwnerIsO) and: [ secondPosition itsOwnerIsO = isOwnerO].! !

!TerniLapilli methodsFor: 'testing' stamp: 'CR 11/2/2020 04:01:40'!
verifyCurrentPlayerO
	currentPlayer checkAndPlayOnOsTurn.! !

!TerniLapilli methodsFor: 'testing' stamp: 'CR 11/2/2020 03:58:14'!
verifyCurrentPlayerX
	currentPlayer checkAndPlayOnXsTurn.! !

!TerniLapilli methodsFor: 'testing' stamp: 'CR 11/2/2020 05:46:15'!
verifyIfItsAVictory: lastPosition
	self checkHorizontally: lastPosition.
	self checkVertically: lastPosition.
	self checkDiagonals.! !

!TerniLapilli methodsFor: 'testing' stamp: 'CR 11/2/2020 00:45:12'!
verifyItIsAValidPoint: aPointToCheckRange
	
	^((aPointToCheckRange x between: 1 and: 3) and: [aPointToCheckRange y between: 1 and: 3]) ifFalse: [self signalPointOutOfRange].

	! !

!TerniLapilli methodsFor: 'testing' stamp: 'CR 11/2/2020 02:04:52'!
verifyNotAllPiecesInTheGame
	(piecesInTheGame < 6) ifFalse: [self signalCantAddMoreThanSixGamePieces].! !

!TerniLapilli methodsFor: 'testing' stamp: 'CR 11/2/2020 06:25:17'!
verifyPositionIsOwnedByO: aPositionToBeChecked
	(gameBoard at: aPositionToBeChecked) failIfNotOwnedByO. 
	
! !

!TerniLapilli methodsFor: 'testing' stamp: 'CR 11/2/2020 06:25:07'!
verifyPositionIsOwnedByX: aPositionToBeChecked
	(gameBoard at: aPositionToBeChecked) failIfNotOwnedByX. 
	
! !


!TerniLapilli methodsFor: 'game - actions' stamp: 'CR 11/2/2020 06:10:48'!
moveOFrom: anInitialPosition to: aDestinationPosition
	(gameOver) 
		ifTrue:[self signalTheGameIsOver]
		ifFalse: [
			self verifyItIsAValidPoint: anInitialPosition.
			self verifyItIsAValidPoint: aDestinationPosition.
			self verifyCurrentPlayerO.
			self occupyPositionIfPossible: aDestinationPosition By: currentPlayer.
			self freePreviousPosition: anInitialPosition.
			self verifyIfItsAVictory: aDestinationPosition.
			self changeCurrentPlayer.	
			
			]
! !

!TerniLapilli methodsFor: 'game - actions' stamp: 'CR 11/2/2020 06:22:34'!
moveXFrom: anInitialPosition to: aDestinationPosition
	(gameOver) 
		ifTrue:[self signalTheGameIsOver]
		ifFalse: [
			self verifyItIsAValidPoint: anInitialPosition.
			self verifyItIsAValidPoint: aDestinationPosition.
			self verifyCurrentPlayerX.
			self verifyPositionIsOwnedByX: anInitialPosition.
			self occupyPositionIfPossible: aDestinationPosition By: currentPlayer.
			self freePreviousPosition: anInitialPosition.
			self verifyIfItsAVictory: aDestinationPosition.
			self changeCurrentPlayer.	
			
			]
! !

!TerniLapilli methodsFor: 'game - actions' stamp: 'CR 11/2/2020 06:10:21'!
setOAt: aDestinationPosition 
	(gameOver) 
		ifTrue:[self signalTheGameIsOver]
		ifFalse: [
			self verifyNotAllPiecesInTheGame.
			self verifyCurrentPlayerO.
			self verifyItIsAValidPoint: aDestinationPosition.
			self occupyPositionIfPossible: aDestinationPosition By: currentPlayer.
			self verifyIfItsAVictory: aDestinationPosition.
			self changeCurrentPlayer.	
			
			]
! !

!TerniLapilli methodsFor: 'game - actions' stamp: 'CR 11/2/2020 06:10:11'!
setXAt: aDestinationPosition
	(gameOver) 
		ifTrue:[self signalTheGameIsOver]
		ifFalse: [
			self verifyNotAllPiecesInTheGame.
			self verifyCurrentPlayerX.
			self verifyItIsAValidPoint: aDestinationPosition.
			self occupyPositionIfPossible: aDestinationPosition By: currentPlayer.
			self verifyIfItsAVictory: aDestinationPosition.
			self changeCurrentPlayer.	
			]! !


!TerniLapilli methodsFor: 'initialization' stamp: 'CR 11/2/2020 03:37:42'!
initializeBoard
	gameBoard := Dictionary new.
	1 to: 3 do: [ :row |
		1 to: 3 do: [ :column |
			gameBoard at: row@column put: (TLPosition onRow: row onColumn: column ofGame: self). 	
			]
		]
	! !

!TerniLapilli methodsFor: 'initialization' stamp: 'CR 11/2/2020 04:13:00'!
initializeGame
	piecesInTheGame := 0.
	XPlayer := X ofGame: self.
	OPlayer := O ofGame: self.
	currentPlayer := XPlayer.
	gameOver := false.
	self initializeBoard.! !


!TerniLapilli methodsFor: 'private' stamp: 'CR 11/2/2020 03:51:55'!
changeCurrentPlayer
	currentPlayer changePlayer.! !

!TerniLapilli methodsFor: 'private' stamp: 'CR 11/2/2020 03:53:26'!
changeTurnToO
	currentPlayer := OPlayer.! !

!TerniLapilli methodsFor: 'private' stamp: 'CR 11/2/2020 03:53:17'!
changeTurnToX
	currentPlayer := XPlayer.! !

!TerniLapilli methodsFor: 'private' stamp: 'CR 11/2/2020 05:46:27'!
checkDiagonals
	| firstPosition secondPosition thirdPosition|
	
	firstPosition := gameBoard at: 1@1.
	secondPosition := gameBoard at: 2@2.
	thirdPosition := gameBoard at: 3@3.
	self ifPositionsHaveTheSameOwnerThenItsVictory: firstPosition and: secondPosition and: thirdPosition.
	
	firstPosition := gameBoard at: 1@3.
	secondPosition := gameBoard at: 2@2.
	thirdPosition := gameBoard at: 3@1.
	self ifPositionsHaveTheSameOwnerThenItsVictory: firstPosition and: secondPosition and: thirdPosition.! !

!TerniLapilli methodsFor: 'private' stamp: 'CR 11/2/2020 05:44:43'!
checkHorizontally: lastPosition
	| lastPositionRow firstPosition secondPosition thirdPosition|
	lastPositionRow := lastPosition x.
	firstPosition := gameBoard at: lastPositionRow@1.
	secondPosition := gameBoard at: lastPositionRow@2.
	thirdPosition := gameBoard at: lastPositionRow@3.
	
	self ifPositionsHaveTheSameOwnerThenItsVictory: firstPosition and: secondPosition and: thirdPosition.! !

!TerniLapilli methodsFor: 'private' stamp: 'CR 11/2/2020 05:44:28'!
checkVertically: lastPosition
	| lastPositionColumn firstPosition secondPosition thirdPosition|
	lastPositionColumn := lastPosition y.
	firstPosition := gameBoard at: 1@lastPositionColumn.
	secondPosition := gameBoard at: 2@lastPositionColumn.
	thirdPosition := gameBoard at: 3@lastPositionColumn.
	
	self ifPositionsHaveTheSameOwnerThenItsVictory: firstPosition and: secondPosition and: thirdPosition.! !

!TerniLapilli methodsFor: 'private' stamp: 'CR 11/2/2020 06:23:17'!
freePreviousPosition: aPositionToRelease
	(gameBoard at: aPositionToRelease) free.
! !

!TerniLapilli methodsFor: 'private' stamp: 'CR 11/2/2020 05:44:13'!
ifPositionsHaveTheSameOwnerThenItsVictory: firstPosition and: secondPosition and: thirdPosition.

	^ (self itsOccupied: firstPosition and: secondPosition and: thirdPosition)
	ifTrue: [
		(self sameOwner: firstPosition and: secondPosition and: thirdPosition)
			ifTrue: [gameOver := true]
		]! !

!TerniLapilli methodsFor: 'private' stamp: 'CR 11/2/2020 03:27:38'!
occupyPosition: aPosition By: aPlayer
	(gameBoard at: aPosition) setOwnerTo: aPlayer. 
	piecesInTheGame := piecesInTheGame + 1.! !

!TerniLapilli methodsFor: 'private' stamp: 'CR 11/2/2020 03:27:11'!
occupyPositionIfPossible: aPosition By: aPlayer
	(gameBoard at: aPosition) failIfOccupied.
	self occupyPosition: aPosition By: aPlayer.! !


!TerniLapilli methodsFor: 'accessing' stamp: 'CR 11/2/2020 03:47:05'!
doesPositionBelongToO: aPoint 
	^ (gameBoard at: aPoint) itsOwnerIsO.! !

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


!TerniLapilli class methodsFor: 'error messages' stamp: 'CR 11/2/2020 06:35:37'!
errorAlreadyOccupiedPosition
	^ 'This position is already occupied!!'! !

!TerniLapilli class methodsFor: 'error messages' stamp: 'CR 11/2/2020 02:05:38'!
errorCantAddMoreThanSixGamePieces
	^ 'Error!! Cant add more than more than 6 game pieces'! !

!TerniLapilli class methodsFor: 'error messages' stamp: 'CR 11/2/2020 06:35:17'!
errorCurrentPlayerDoesntOwnPosition
	^ 'This position doesnt belong to current player!!'! !

!TerniLapilli class methodsFor: 'error messages' stamp: 'CR 11/2/2020 04:19:40'!
errorGameOver
	^ 'Error!! The game has already ended'! !

!TerniLapilli class methodsFor: 'error messages' stamp: 'BT 11/2/2020 00:19:28'!
errorInvalidPlayer
	^ 'Wrong turn, unexpected player is playing!!'.! !

!TerniLapilli class methodsFor: 'error messages' stamp: 'BT 11/2/2020 00:32:34'!
errorOutOfRangePosition
	^ 'Out of range position!!'.! !
