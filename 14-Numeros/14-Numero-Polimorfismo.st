!classDefinition: #NumeroTest category: #'Numero-Exercise-Polimorfismo'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise-Polimorfismo'!

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:11'!
test01isCeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:12'!
test02isCeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 5/7/2020 17:46:14'!
test27EnteroSubstractsEnteroCorrectly

	self assert: three - one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:41'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:00'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:05'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:08'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:48'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:01'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:14'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:23'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:32'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:39'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:47'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:55'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:03'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: #'Numero-Exercise-Polimorfismo'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise-Polimorfismo'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !


!Numero methodsFor: 'private-arithmetic-operations' stamp: 'CR 9/29/2020 00:45:10'!
divisionSiendoUnDividendoEntero: unDividendoEntero

	self subclassResponsibility ! !

!Numero methodsFor: 'private-arithmetic-operations' stamp: 'CR 9/29/2020 00:45:34'!
divisionSiendoUnDividendoFraccionario: unDividendoFraccionario

	self subclassResponsibility ! !

!Numero methodsFor: 'private-arithmetic-operations' stamp: 'CR 9/29/2020 00:32:24'!
multiplicacionSiendoUnEntero: unMultiplicadorEntero

	self subclassResponsibility ! !

!Numero methodsFor: 'private-arithmetic-operations' stamp: 'CR 9/29/2020 00:32:38'!
multiplicacionSiendoUnaFraccion: unMultiplicadorFraccionario

	self subclassResponsibility ! !

!Numero methodsFor: 'private-arithmetic-operations' stamp: 'CR 9/29/2020 00:56:43'!
restaSiendoUnMinuendoEntero: unMinuendoEntero
	self subclassResponsibility ! !

!Numero methodsFor: 'private-arithmetic-operations' stamp: 'CR 9/29/2020 00:56:59'!
restaSiendoUnMinuendoFraccionario: unMinuendoFraccionario
	self subclassResponsibility ! !

!Numero methodsFor: 'private-arithmetic-operations' stamp: 'CR 9/28/2020 21:54:09'!
sumaSiendoUnEntero: unSumandoEntero
	self subclassResponsibility ! !

!Numero methodsFor: 'private-arithmetic-operations' stamp: 'CR 9/28/2020 22:03:38'!
sumaSiendoUnaFraccion: unSumandoFraccionario
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: #'Numero-Exercise-Polimorfismo'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 9/24/2020 17:28:15'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero!!'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 9/24/2020 04:33:41'!
invalidNumberTypeErrorDescription
	
	^ 'Tipo de n�mero inv�lido!!'! !


!classDefinition: #Entero category: #'Numero-Exercise-Polimorfismo'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise-Polimorfismo'!

!Entero methodsFor: 'arithmetic operations' stamp: 'CR 9/29/2020 00:59:59'!
* aMultiplier

	^ aMultiplier multiplicacionSiendoUnEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'CR 9/29/2020 01:00:11'!
+ anAdder 

	^ anAdder sumaSiendoUnEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'CR 9/29/2020 01:00:16'!
- aSubtrahend 
	
	^ aSubtrahend restaSiendoUnMinuendoEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'CR 9/29/2020 01:00:20'!
/ aDivisor 
	
	^ aDivisor divisionSiendoUnDividendoEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:55'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HAW 9/24/2018 08:47:50'!
fibonacci

	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	self isNegative ifTrue: [self error: Entero negativeFibonacciErrorDescription ].	
	(self isZero or: [self isOne]) ifTrue: [^one].
	
	^ (self - one) fibonacci + (self - two) fibonacci
		! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:00'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 20:09'!
initalizeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'value' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'NR 9/23/2018 22:17:55'!
isNegative
	
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:14'!
isOne
	
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:12'!
isZero
	
	^value = 0! !


!Entero methodsFor: 'private-arithmetic-operations' stamp: 'CR 9/29/2020 00:48:14'!
divisionSiendoUnDividendoEntero: unDividendoEntero

	^Fraccion with: unDividendoEntero over: self.! !

!Entero methodsFor: 'private-arithmetic-operations' stamp: 'CR 9/29/2020 00:49:50'!
divisionSiendoUnDividendoFraccionario: unDividendoFraccionario
	
	| newDenominator |
	newDenominator := self * unDividendoFraccionario denominator .
	^(unDividendoFraccionario numerator / newDenominator). 
	! !

!Entero methodsFor: 'private-arithmetic-operations' stamp: 'CR 9/29/2020 00:31:58'!
multiplicacionSiendoUnEntero: unMultiplicadorEntero

	^self class with: value * unMultiplicadorEntero integerValue.! !

!Entero methodsFor: 'private-arithmetic-operations' stamp: 'CR 9/29/2020 00:39:11'!
multiplicacionSiendoUnaFraccion: unMultiplicadorFraccionario

	| newNumerator | 
	newNumerator := self * unMultiplicadorFraccionario numerator.
	^(newNumerator / unMultiplicadorFraccionario denominator). 
	! !

!Entero methodsFor: 'private-arithmetic-operations' stamp: 'CR 9/29/2020 00:39:15'!
restaSiendoUnEntero: unMinuendoEntero

	^self class with:  unMinuendoEntero integerValue - value.! !

!Entero methodsFor: 'private-arithmetic-operations' stamp: 'CR 9/29/2020 00:56:32'!
restaSiendoUnMinuendoEntero: unMinuendoEntero

	^self class with:  unMinuendoEntero integerValue - value.! !

!Entero methodsFor: 'private-arithmetic-operations' stamp: 'CR 9/29/2020 00:58:10'!
restaSiendoUnMinuendoFraccionario: unMinuendoFraccionario

	| newNumerator | 	
	newNumerator := unMinuendoFraccionario numerator - (self * 				unMinuendoFraccionario denominator).
	^(newNumerator / unMinuendoFraccionario denominator). 
	! !

!Entero methodsFor: 'private-arithmetic-operations' stamp: 'CR 9/28/2020 21:59:52'!
sumaSiendoUnEntero: unSumandoEntero

	^self class with: value + unSumandoEntero integerValue.! !

!Entero methodsFor: 'private-arithmetic-operations' stamp: 'CR 9/29/2020 00:39:44'!
sumaSiendoUnaFraccion: unSumandoFraccionario

	| newNumerator | 	
	newNumerator := (self * unSumandoFraccionario denominator) + 			unSumandoFraccionario numerator.
	^(newNumerator / unSumandoFraccionario denominator). ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: #'Numero-Exercise-Polimorfismo'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/8/2019 02:57:57'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no est� definido aqu� para Enteros Negativos'! !

!Entero class methodsFor: 'instance creation' stamp: 'HernanWilkinson 5/7/2016 22:53'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	^self new initalizeWith: aValue! !


!classDefinition: #Fraccion category: #'Numero-Exercise-Polimorfismo'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise-Polimorfismo'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'CR 9/29/2020 01:03:51'!
* aMultiplier 

	^ aMultiplier multiplicacionSiendoUnaFraccion: self.
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'CR 9/29/2020 01:00:52'!
+ anAdder 
	
	^ anAdder sumaSiendoUnaFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'CR 9/29/2020 01:01:04'!
- aSubtrahend 
	
	^ aSubtrahend restaSiendoUnMinuendoFraccionario: self.
	
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'CR 9/29/2020 01:00:57'!
/ aDivisor 
	
	^ aDivisor divisionSiendoUnDividendoFraccionario: self.! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 22:54'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !


!Fraccion methodsFor: 'private-arithmetic-operations' stamp: 'CR 9/29/2020 00:53:09'!
divisionSiendoUnDividendoEntero: unDividendoEntero

	| newNumerator | 
	newNumerator := unDividendoEntero * denominator.
	^ (newNumerator /  numerator). 
	! !

!Fraccion methodsFor: 'private-arithmetic-operations' stamp: 'CR 9/29/2020 00:54:43'!
divisionSiendoUnDividendoFraccionario: unDividendoFraccionario

	^(unDividendoFraccionario numerator * denominator) / (unDividendoFraccionario              denominator * numerator).
	! !

!Fraccion methodsFor: 'private-arithmetic-operations' stamp: 'CR 9/29/2020 00:39:51'!
multiplicacionSiendoUnEntero: unMultiplicadorEntero

	| newNumerator | 
	newNumerator := unMultiplicadorEntero *  numerator.
	^(newNumerator /  denominator ). 
	
	! !

!Fraccion methodsFor: 'private-arithmetic-operations' stamp: 'CR 9/29/2020 00:37:43'!
multiplicacionSiendoUnaFraccion: unMultiplicadorFraccionario
	
	^ (numerator * unMultiplicadorFraccionario numerator) / (denominator * 	unMultiplicadorFraccionario denominator).
	
	! !

!Fraccion methodsFor: 'private-arithmetic-operations' stamp: 'CR 9/29/2020 00:40:02'!
restaSiendoUnEntero: unMinuendoEntero

	| newNumerator | 
	newNumerator := unMinuendoEntero * denominator - numerator.
	^(newNumerator / denominator). 
	! !

!Fraccion methodsFor: 'private-arithmetic-operations' stamp: 'CR 9/29/2020 00:56:08'!
restaSiendoUnMinuendoEntero: unMinuendoEntero

	| newNumerator | 
	newNumerator := unMinuendoEntero * denominator - numerator.
	^(newNumerator / denominator). 
	! !

!Fraccion methodsFor: 'private-arithmetic-operations' stamp: 'CR 9/29/2020 00:58:32'!
restaSiendoUnMinuendoFraccionario: unMinuendoFraccionario

	| newNumerator newDenominator |
	newNumerator := (denominator * unMinuendoFraccionario numerator) - 				(numerator                              * unMinuendoFraccionario denominator) .
	newDenominator := denominator * unMinuendoFraccionario denominator.
	^newNumerator / newDenominator. ! !

!Fraccion methodsFor: 'private-arithmetic-operations' stamp: 'CR 9/29/2020 00:40:30'!
sumaSiendoUnEntero: unSumandoEntero

	| newNumerator |
	newNumerator := numerator + (unSumandoEntero * denominator).
	^(newNumerator / denominator). 
	! !

!Fraccion methodsFor: 'private-arithmetic-operations' stamp: 'CR 9/29/2020 00:40:39'!
sumaSiendoUnaFraccion: unSumandoFraccionario

	| newNumerator newDenominator |	
	newNumerator := (numerator * unSumandoFraccionario denominator) + 				(denominator * unSumandoFraccionario numerator).
	newDenominator := denominator * unSumandoFraccionario denominator.
	
	^newNumerator / newDenominator.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: #'Numero-Exercise-Polimorfismo'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'NR 9/23/2018 23:45:19'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].
	
	aDivisor isNegative ifTrue:[ ^aDividend negated / aDivisor negated].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^self new initializeWith: numerator over: denominator
	! !
