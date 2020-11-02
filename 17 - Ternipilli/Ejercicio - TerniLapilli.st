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

!TerniLapilliTest methodsFor: 'tests' stamp: 'BT 11/2/2020 00:02:29'!
test03X

	| aJustStartedMatch |
	aJustStartedMatch := TerniLapilli newGame.
	aJustStartedMatch setXAt: 0@0.
	
	self deny: aJustStartedMatch isPlayingX.
	self assert: aJustStartedMatch isPlayingO.
	self deny: aJustStartedMatch isOver.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BT 11/2/2020 00:32:50'!
test03verifyPointIsInValidRange

	| aJustStartedMatch |
	aJustStartedMatch := TerniLapilli newGame.
	
	self should: [aJustStartedMatch setXAt: -1@0.] 
	raise: Error   
	withMessageText: TerniLapilli errorOutOfRangePosition.! !


!classDefinition: #TerniLapilli category: 'Ejercicio - TerniLapilli'!
Object subclass: #TerniLapilli
	instanceVariableNames: 'isXsTurn'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio - TerniLapilli'!

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'BT 11/1/2020 23:48:47'!
isOver
	^ false.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'BT 11/2/2020 00:17:40'!
signalInvalidPlayer

	^ self signal: self class errorInvalidPlayer.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'BT 11/2/2020 00:17:34'!
verifyCurrentPlayerX
	isXsTurn ifFalse: [self signalInvalidPlayer]. ! !


!TerniLapilli methodsFor: 'testing' stamp: 'BT 11/2/2020 00:27:10'!
isPlayingO
	^ isXsTurn not .! !

!TerniLapilli methodsFor: 'testing' stamp: 'BT 11/2/2020 00:26:58'!
isPlayingX
	^ isXsTurn .! !


!TerniLapilli methodsFor: 'game - actions' stamp: 'BT 11/2/2020 00:33:38'!
setXAt: aPoint 
	self verifyCurrentPlayerX.
	self verifyItIsAValidPoint: aPoint.
	self changeCurrentPlayer.! !

!TerniLapilli methodsFor: 'game - actions' stamp: 'BT 11/2/2020 00:35:44'!
verifyItIsAValidPoint:: a! !


!TerniLapilli methodsFor: 'initialization' stamp: 'BT 11/2/2020 00:21:02'!
initializeGame
	isXsTurn := true.! !


!TerniLapilli methodsFor: 'private' stamp: 'BT 11/2/2020 00:23:24'!
changeCurrentPlayer
	isXsTurn := isXsTurn not.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: 'Ejercicio - TerniLapilli'!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'BT 11/2/2020 00:19:28'!
errorInvalidPlayer
	^ 'Wrong turn, unexpected player is playing!!'.! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'BT 11/2/2020 00:22:16'!
newGame
	^ self new initializeGame.! !


!TerniLapilli class methodsFor: 'error messages' stamp: 'BT 11/2/2020 00:32:34'!
errorOutOfRangePosition
	^ 'Out of range position!!'.! !
