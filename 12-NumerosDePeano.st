!classDefinition: #I category: #Peano!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #Peano!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'operations' stamp: 'CR 9/17/2020 03:52:58'!
* unNumeroPeano
	^ unNumeroPeano.! !

!I class methodsFor: 'operations' stamp: 'CR 9/17/2020 02:31:17'!
+ unNumeroPeano 
	^unNumeroPeano next.! !

!I class methodsFor: 'operations' stamp: 'CR 9/17/2020 04:16:48'!
- unNumeroPeano
 	^self error:'El I no admite la resta!!'! !

!I class methodsFor: 'operations' stamp: 'CR 9/17/2020 04:49:56'!
/ unNumeroPeano
	^ (unNumeroPeano isEqualTo: I) ifTrue: [^I] ifFalse: [^self error: self name, ' no es divisible por ', unNumeroPeano name.].! !

!I class methodsFor: 'operations' stamp: 'CR 9/17/2020 03:00:53'!
next
	^self createChildNamed: self name,'I'. ! !

!I class methodsFor: 'operations' stamp: 'CR 9/17/2020 04:17:09'!
previous
 	^self error:'El I no tiene previo!!'! !


!classDefinition: #II category: #Peano!
I subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #Peano!
II class
	instanceVariableNames: ''!

!II class methodsFor: 'operations' stamp: 'CR 9/17/2020 04:07:36'!
* unNumeroPeano
	^ (unNumeroPeano isEqualTo: I) ifTrue: [self] ifFalse: [self + (self * unNumeroPeano previous)].! !

!II class methodsFor: 'operations' stamp: 'CR 9/17/2020 03:10:59'!
+ unNumeroPeano
	^ (self previous + unNumeroPeano) next.! !

!II class methodsFor: 'operations' stamp: 'CR 9/17/2020 03:43:42'!
- unNumeroPeano
	^ (unNumeroPeano isEqualTo: I) ifTrue: [self previous] ifFalse: [self previous - unNumeroPeano previous].! !

!II class methodsFor: 'operations' stamp: 'CR 9/17/2020 04:47:03'!
/ unNumeroPeano
	|cocientePeano|
	cocientePeano := I.
	[cocientePeano isNotEqualTo: self next] whileTrue:
	 [(cocientePeano * unNumeroPeano isEqualTo: self ) ifTrue: [^cocientePeano.].
		cocientePeano := cocientePeano next.].
	^self error: self name, ' no es divisible por ', unNumeroPeano name.
	! !

!II class methodsFor: 'operations' stamp: 'CR 9/17/2020 03:01:02'!
next
	^self createChildNamed: self name, 'I'.! !

!II class methodsFor: 'operations' stamp: 'CR 9/17/2020 03:07:41'!
previous
	^self parent.! !


!classDefinition: #TestsNumerosPeano category: #Peano!
DenotativeObject subclass: #TestsNumerosPeano
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TestsNumerosPeano class' category: #Peano!
TestsNumerosPeano class
	instanceVariableNames: ''!

!TestsNumerosPeano class methodsFor: 'as yet unclassified' stamp: 'CR 9/17/2020 02:25:34'!
test01nextDeIEsII
	Assert that: I next isEqualTo: II.! !

!TestsNumerosPeano class methodsFor: 'as yet unclassified' stamp: 'CR 9/17/2020 02:25:52'!
test02previousDeIIEsI
	Assert that: II previous isEqualTo: I.! !

!TestsNumerosPeano class methodsFor: 'as yet unclassified' stamp: 'CR 9/17/2020 02:30:41'!
test03sumaDeIyunNumeroEsNext
	Assert that: I+I isEqualTo: I next.! !

!TestsNumerosPeano class methodsFor: 'as yet unclassified' stamp: 'CR 9/17/2020 03:50:00'!
test04sumaDeIIIyIIesIIIII
	|cincoPeano|
	cincoPeano := II next next next. 
	Assert that: II + II next isEqualTo: cincoPeano.! !

!TestsNumerosPeano class methodsFor: 'as yet unclassified' stamp: 'CR 9/17/2020 03:49:43'!
test05restaDePeanoYIesPeanoPrevious
	|cincoPeano|
	cincoPeano := II next next next. 
	Assert that: cincoPeano - I isEqualTo: cincoPeano previous.! !

!TestsNumerosPeano class methodsFor: 'as yet unclassified' stamp: 'CR 9/17/2020 04:13:52'!
test06restaDeIIIYIIesI
	Assert that: II next - II isEqualTo: I.! !

!TestsNumerosPeano class methodsFor: 'as yet unclassified' stamp: 'CR 9/17/2020 04:10:52'!
test07PeanoPorIesPeano
	|cincoPeano|
	cincoPeano := II next next next. 
	Assert that: cincoPeano isEqualTo: cincoPeano * I.
	Assert that: cincoPeano isEqualTo: I * cincoPeano.! !

!TestsNumerosPeano class methodsFor: 'as yet unclassified' stamp: 'CR 9/17/2020 04:14:07'!
test08IIIIPorIIesIIIIIIII
	|cuatroPeano ochoPeano|
	cuatroPeano := II next next.
	ochoPeano := cuatroPeano next next next next.
	Assert that: ochoPeano isEqualTo: cuatroPeano * II.
	Assert that: ochoPeano isEqualTo: II * cuatroPeano.! !
