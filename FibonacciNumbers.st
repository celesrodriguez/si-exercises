!classDefinition: #FibonacciTest category: #'Actividad Fibonacci '!
TestCase subclass: #FibonacciTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actividad Fibonacci '!

!FibonacciTest methodsFor: 'as yet unclassified' stamp: 'CR 9/17/2020 19:55:51'!
test01primeros5
	self assert: (FibonacciNumbers new primeros: 5) asArray = #(0 1 1 2 3).! !


!classDefinition: #FibonacciNumbers category: #'Actividad Fibonacci '!
Object subclass: #FibonacciNumbers
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actividad Fibonacci '!

!FibonacciNumbers methodsFor: 'as yet unclassified' stamp: 'CR 9/17/2020 19:45:43'!
primeros20numeros
	| fibAnterior fibAnteriorAnterior currentNumero primeros20 index|
	fibAnterior := 0.
	fibAnteriorAnterior := 1.
	currentNumero := 0 .
	index := 0.
	primeros20 := OrderedCollection  new.
	[index <= 20] whileTrue: [
		primeros20 add: currentNumero.
		currentNumero := fibAnterior  + fibAnteriorAnterior.
		fibAnteriorAnterior := fibAnterior.
		fibAnterior := currentNumero.
		index := index + 1].
	^ primeros20.! !

!FibonacciNumbers methodsFor: 'as yet unclassified' stamp: 'CR 9/17/2020 19:57:26'!
primeros: tope
	| fibAnterior fibAnteriorAnterior currentNumero primerosNumeros index|
	fibAnterior := 0.
	fibAnteriorAnterior := 1.
	currentNumero := 0 .
	index := 1.
	primerosNumeros := OrderedCollection  new.
	[index <= tope] whileTrue: [
		primerosNumeros add: currentNumero.
		currentNumero := fibAnterior  + fibAnteriorAnterior.
		fibAnteriorAnterior := fibAnterior.
		fibAnterior := currentNumero.
		index := index + 1].
	^ primerosNumeros.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FibonacciNumbers class' category: #'Actividad Fibonacci '!
FibonacciNumbers class
	instanceVariableNames: ''!

!FibonacciNumbers class methodsFor: 'as yet unclassified' stamp: 'CR 9/17/2020 19:44:10'!
new
	^super new.! !
