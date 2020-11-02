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

!TerniLapilliTest methodsFor: 'tests' stamp: 'CR 11/2/2020 03:09:56'!
test09setPositionToPlayerWorksCorrectly

	| aMatch |
	aMatch := TerniLapilli newGame.
	aMatch setXAt: 1@1.
	"aMatch setOAt: 2@1."
	self assert: (aMatch doesPositionBelongToX: 1@1).
	"self assert: (aMatch doesPositionBelongToO: 2@1)."
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


!O methodsFor: 'testing' stamp: 'CR 11/2/2020 03:44:01'!
ifItsSomebodyThenFail: aPositionOwnedByMe
	aPositionOwnedByMe failBecauseItsAlreadyOccupied.! !


!O methodsFor: 'as yet unclassified' stamp: 'CR 11/2/2020 03:52:44'!
changePlayer
	terniLapilliGame changeTurnToX.! !

!O methodsFor: 'as yet unclassified' stamp: 'CR 11/2/2020 04:01:49'!
checkAndPlayOnOsTurn! !

!O methodsFor: 'as yet unclassified' stamp: 'CR 11/2/2020 03:59:30'!
checkAndPlayOnXsTurn
	terniLapilliGame failBecauseItsNotMyTurn.! !


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


!X methodsFor: 'testing' stamp: 'CR 11/2/2020 03:44:11'!
ifItsSomebodyThenFail: aPositionOwnedByMe
	aPositionOwnedByMe failBecauseItsAlreadyOccupied.! !


!X methodsFor: 'as yet unclassified' stamp: 'CR 11/2/2020 03:52:54'!
changePlayer
	terniLapilliGame changeTurnToO.! !

!X methodsFor: 'as yet unclassified' stamp: 'CR 11/2/2020 04:01:57'!
checkAndPlayOnOsTurn
	terniLapilliGame failBecauseItsNotMyTurn.! !

!X methodsFor: 'as yet unclassified' stamp: 'CR 11/2/2020 03:58:25'!
checkAndPlayOnXsTurn! !


!classDefinition: #TLPosition category: 'Ejercicio - TerniLapilli'!
Object subclass: #TLPosition
	instanceVariableNames: 'terniLapilliGame owner row column'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio - TerniLapilli'!

!TLPosition methodsFor: 'owner interface' stamp: 'CR 11/2/2020 03:45:00'!
failBecauseItsAlreadyOccupied
	terniLapilliGame signalPositionAlreadyOccupied. ! !

!TLPosition methodsFor: 'owner interface' stamp: 'CR 11/2/2020 03:41:28'!
failIfOccupied
	^owner ifItsSomebodyThenFail: self.! !

!TLPosition methodsFor: 'owner interface' stamp: 'CR 11/2/2020 04:07:36'!
setOwnerTo: aPlayerToBeAttachedTo
	owner  := aPlayerToBeAttachedTo.! !


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
	instanceVariableNames: 'currentPlayer gameBoard piecesInTheGame XPlayer OPlayer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio - TerniLapilli'!

!TerniLapilli methodsFor: 'signals' stamp: 'CR 11/2/2020 04:00:15'!
failBecauseItsNotMyTurn
	self signalInvalidPlayer.! !

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

!TerniLapilli methodsFor: 'testing' stamp: 'CR 11/2/2020 04:05:28'!
isPlayingO
	^ currentPlayer isO.! !

!TerniLapilli methodsFor: 'testing' stamp: 'CR 11/2/2020 04:05:44'!
isPlayingX
	^ self isPlayingO not.! !

!TerniLapilli methodsFor: 'testing' stamp: 'CR 11/2/2020 04:01:40'!
verifyCurrentPlayerO
	currentPlayer checkAndPlayOnOsTurn.! !

!TerniLapilli methodsFor: 'testing' stamp: 'CR 11/2/2020 03:58:14'!
verifyCurrentPlayerX
	currentPlayer checkAndPlayOnXsTurn.! !


!TerniLapilli methodsFor: 'game - actions' stamp: 'CR 11/2/2020 03:27:38'!
occupyPosition: aPosition By: aPlayer
	(gameBoard at: aPosition) setOwnerTo: aPlayer. 
	piecesInTheGame := piecesInTheGame + 1.! !

!TerniLapilli methodsFor: 'game - actions' stamp: 'CR 11/2/2020 03:27:11'!
occupyPositionIfPossible: aPosition By: aPlayer
	(gameBoard at: aPosition) failIfOccupied.
	self occupyPosition: aPosition By: aPlayer.! !

!TerniLapilli methodsFor: 'game - actions' stamp: 'CR 11/2/2020 03:23:27'!
setOAt: aPoint 
	self verifyNotAllPiecesInTheGame.
	self verifyCurrentPlayerO.
	self verifyItIsAValidPoint: aPoint.
	self occupyPositionIfPossible: aPoint By: OPlayer.
	self changeCurrentPlayer.
! !

!TerniLapilli methodsFor: 'game - actions' stamp: 'CR 11/2/2020 02:50:15'!
setXAt: aPoint 
	self verifyNotAllPiecesInTheGame.
	self verifyCurrentPlayerX.
	self verifyItIsAValidPoint: aPoint.
	self occupyPositionIfPossible: aPoint By: XPlayer.
	self changeCurrentPlayer.! !

!TerniLapilli methodsFor: 'game - actions' stamp: 'CR 11/2/2020 00:45:12'!
verifyItIsAValidPoint: aPointToCheckRange
	
	^((aPointToCheckRange x between: 1 and: 3) and: [aPointToCheckRange y between: 1 and: 3]) ifFalse: [self signalPointOutOfRange].

	! !

!TerniLapilli methodsFor: 'game - actions' stamp: 'CR 11/2/2020 02:04:52'!
verifyNotAllPiecesInTheGame
	(piecesInTheGame < 6) ifFalse: [self signalCantAddMoreThanSixGamePieces].! !


!TerniLapilli methodsFor: 'initialization' stamp: 'CR 11/2/2020 03:37:42'!
initializeBoard
	gameBoard := Dictionary new.
	1 to: 3 do: [ :row |
		1 to: 3 do: [ :column |
			gameBoard at: row@column put: (TLPosition onRow: row onColumn: column ofGame: self). 	
			]
		]
	! !

!TerniLapilli methodsFor: 'initialization' stamp: 'CR 11/2/2020 04:02:33'!
initializeGame
	piecesInTheGame := 0.
	XPlayer := X ofGame: self.
	OPlayer := O ofGame: self.
	currentPlayer := XPlayer.
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
