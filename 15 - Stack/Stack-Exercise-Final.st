!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'emptyStack thePrefixToFind thePrefixToFindUpperCase aSentenceWithoutThePrefixToFind aSentenceWithThePrefixToFind aStackWithoutThePrefixToFind aStackWithThePrefixToFindUpperCase aStackWithThePrefixToFind copyOfaStackWithBothSentences anEmptyPrefix thePrefixWithSpaces aStackWithOnlyOneSentenceWithThePrefix copyOfaStackWithOnlyOneSentenceWithThePrefix'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'CR 10/7/2020 22:43:47'!
setUp

	emptyStack := OOStack new.
	anEmptyPrefix := ''.
	thePrefixToFind := 'hello'.
	thePrefixWithSpaces := 'hell o'.
	thePrefixToFindUpperCase := 'Hello'.
	aSentenceWithoutThePrefixToFind := 'byebye'.
	aSentenceWithThePrefixToFind := 'hello Inge I'.
	
	aStackWithThePrefixToFind := (OOStack new 
	push: aSentenceWithThePrefixToFind).
	
	aStackWithOnlyOneSentenceWithThePrefix :=  (OOStack new 
	push: aSentenceWithoutThePrefixToFind) 
	push: aSentenceWithThePrefixToFind. 
															
	aStackWithoutThePrefixToFind := OOStack new 
	push: aSentenceWithoutThePrefixToFind.
	
	aStackWithThePrefixToFindUpperCase := OOStack new 
	push: thePrefixToFindUpperCase.
	
	copyOfaStackWithOnlyOneSentenceWithThePrefix :=  (OOStack new 
	push: aSentenceWithoutThePrefixToFind) 
	push: aSentenceWithThePrefixToFind. 
							
	! !


!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'CR 10/7/2020 21:07:32'!
test01findOnEmptyStackShouldReturnAnEmptyCollection

	| sentenceFinderByPrefix foundSentences |
	
	sentenceFinderByPrefix := SentenceFinderByPrefix in: emptyStack 	.
	
	foundSentences := sentenceFinderByPrefix find: thePrefixToFind. 
	
	self assert: foundSentences size = 0.

	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'CR 10/7/2020 22:40:44'!
test02findOnStackWithaSentenceWithPrefixShouldReturnOnlyTheSentenceWithThePrefix

	| sentenceFinderByPrefix foundSentences |

	sentenceFinderByPrefix := SentenceFinderByPrefix in: aStackWithOnlyOneSentenceWithThePrefix .
	
	foundSentences := sentenceFinderByPrefix find: thePrefixToFind.
	
	self assert: foundSentences size = 1.
	self assert: foundSentences includes: aSentenceWithThePrefixToFind.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'CR 10/7/2020 22:41:59'!
test03findOnStackWithoutSentencesThatHaveThePrefixShouldReturnAnEmptyCollection

	| sentenceFinderByPrefix foundSentences |
	
	sentenceFinderByPrefix := SentenceFinderByPrefix in: aStackWithoutThePrefixToFind	.
	
	foundSentences := sentenceFinderByPrefix find: thePrefixToFind . 
	
	self assert: foundSentences size = 0.

	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'BT 10/5/2020 20:29:43'!
test04findOnStackWithUpperCasePrefixShouldReturnAnEmptyCollection

	| sentenceFinderByPrefix foundSentences |
	
	sentenceFinderByPrefix := SentenceFinderByPrefix in: aStackWithThePrefixToFindUpperCase 	.
	
	foundSentences := sentenceFinderByPrefix find: thePrefixToFind . 
	
	self assert: foundSentences size = 0.

	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'CR 10/7/2020 22:43:30'!
test05findShouldnotChangeTheStack

	| sentenceFinderByPrefix foundSentences  |

	sentenceFinderByPrefix := SentenceFinderByPrefix in: aStackWithOnlyOneSentenceWithThePrefix.
	
	foundSentences := sentenceFinderByPrefix find: thePrefixToFind. 
	
	self assertThatStackElementsAndOrderOf:  aStackWithOnlyOneSentenceWithThePrefix AreTheSameAsOtherStacks: copyOfaStackWithOnlyOneSentenceWithThePrefix.
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'CR 10/7/2020 22:23:51'!
test06canNotFindWithAnEmptyPrefix 
	| sentenceFinderByPrefix foundSentences |

	sentenceFinderByPrefix := SentenceFinderByPrefix in: aStackWithThePrefixToFind.
	
	self should: [foundSentences := sentenceFinderByPrefix find: anEmptyPrefix.] raise: Error withExceptionDo: [:anError | 
			self assert: anError messageText = SentenceFinderByPrefix prefixToSearchCannotBeEmpty.]. ! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'CR 10/7/2020 22:30:19'!
test07canNotFindWithaPrefixWithSpaces 
	| sentenceFinderByPrefix foundSentences |

	sentenceFinderByPrefix := SentenceFinderByPrefix in: aStackWithThePrefixToFind.
	
	self should: [foundSentences := sentenceFinderByPrefix find: thePrefixWithSpaces.] raise: Error withExceptionDo: 			[:anError | 
			self assert: anError messageText = SentenceFinderByPrefix prefixToSearchCannotHaveSpaces.]. ! !


!SentenceFinderByPrefixTest methodsFor: 'private testing aux' stamp: 'CR 10/7/2020 21:50:42'!
assertThatStackElementsAndOrderOf: stackToCompareWithOtherStack AreTheSameAsOtherStacks: otherStackToBeComparedWith

	self assert: stackToCompareWithOtherStack size = otherStackToBeComparedWith size.
	
	[stackToCompareWithOtherStack isEmpty] whileFalse: [
		
		| poppedElementOfFirstStack poppedElementOfSecondStack |
		poppedElementOfFirstStack := stackToCompareWithOtherStack pop.
		poppedElementOfSecondStack := otherStackToBeComparedWith pop.
		
		self assert: poppedElementOfFirstStack = poppedElementOfSecondStack. 
		]

	! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'size top'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'BT 10/3/2020 21:56:35'!
initialize
	size := 0.
	top := EmptyStackNode new.! !


!OOStack methodsFor: 'testing' stamp: 'BT 10/3/2020 21:49:31'!
isEmpty
	^ size = 0! !


!OOStack methodsFor: 'errors' stamp: 'CR 10/7/2020 22:45:51'!
cantAccessElementOnEmptyStackNode	
	self error: self class stackEmptyErrorDescription.
! !


!OOStack methodsFor: 'private' stamp: 'CR 10/7/2020 23:02:17'!
popNonEmptyStackNode

	| newTop oldTop |
	oldTop := top.
	newTop := top next.
	top := newTop.
	size := size - 1.
	^ oldTop sentence.! !


!OOStack methodsFor: 'operations' stamp: 'CR 10/7/2020 22:55:42'!
pop
	^top checkIfNonEmptyAndPopIfItsPossible: self. ! !

!OOStack methodsFor: 'operations' stamp: 'CR 10/7/2020 23:01:59'!
push: aStackElement

	| stackNode |
	size := size +1.
	stackNode := NonEmptyStackNode with: aStackElement.
	stackNode next: top.
	top := stackNode! !


!OOStack methodsFor: 'accessing' stamp: 'CR 10/3/2020 23:30:36'!
size
	^size.! !

!OOStack methodsFor: 'accessing' stamp: 'CR 10/7/2020 22:57:12'!
top
	^top checkIfNonEmptyAndGetTopIfItsPossible: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 10/1/2020 18:08:13'!
stackEmptyErrorDescription
	
	^ 'Stack is empty!!'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack poppedStackElements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'error signals' stamp: 'CR 10/7/2020 22:09:13'!
signalPrefixToSearchCannotBeEmpty 

	self error: self class prefixToSearchCannotBeEmpty.! !

!SentenceFinderByPrefix methodsFor: 'error signals' stamp: 'CR 10/7/2020 22:29:17'!
signalPrefixToSearchCannotHaveSpaces

	self error: self class prefixToSearchCannotHaveSpaces.! !


!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'CR 10/7/2020 21:57:23'!
find: aPrefixToSearch
	| foundSentences |
	self validatePrefixToSearch: aPrefixToSearch. 
	foundSentences := 	Bag new. 
	self findSentencesWithPrefix: aPrefixToSearch AndSaveThemIn: foundSentences.
	^ foundSentences. ! !


!SentenceFinderByPrefix methodsFor: 'private' stamp: 'CR 10/7/2020 20:52:47'!
findSentencesWithPrefix: aPrefixToSearch AndSaveThemIn: foundSentences
	
	self findSentencesWithPrefixByPoppingStackElements: aPrefixToSearch AndSaveThemIn: foundSentences.
	self rebuildStackAfterPoppingStackElements.! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'CR 10/7/2020 21:02:17'!
findSentencesWithPrefixByPoppingStackElements: aPrefixToSearch AndSaveThemIn: foundSentences

	[stack isEmpty] whileFalse: 
	[ | aSentence |
		aSentence := stack pop.
		self add: aSentence To: foundSentences IfItsPrefixIs: aPrefixToSearch.
		self saveStackElementToRebuildStackAfterwards: aSentence.
		].! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'CR 10/7/2020 21:13:27'!
rebuildStackAfterPoppingStackElements

	[poppedStackElements isEmpty] whileFalse: [
		| aSentenceToPush |
		aSentenceToPush := poppedStackElements removeLast.
		stack push: aSentenceToPush. ].! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'CR 10/7/2020 21:03:24'!
saveStackElementToRebuildStackAfterwards: aSentence.

	poppedStackElements add: aSentence.! !


!SentenceFinderByPrefix methodsFor: 'testing' stamp: 'CR 10/7/2020 20:57:49'!
add: aSentence To: foundSentences IfItsPrefixIs: aPrefixToSearch

	(self isPrefix: aPrefixToSearch Of: aSentence) ifTrue: [ foundSentences add: aSentence ].! !

!SentenceFinderByPrefix methodsFor: 'testing' stamp: 'CR 10/7/2020 21:03:18'!
isPrefix: aPrefix Of: aSentence

	^ aSentence is: aPrefix substringAt: 1.! !

!SentenceFinderByPrefix methodsFor: 'testing' stamp: 'CR 10/7/2020 22:29:30'!
validatePrefixToSearch: aPrefixToSearch. 
	aPrefixToSearch isEmpty ifTrue: [ self signalPrefixToSearchCannotBeEmpty ].
	(aPrefixToSearch includesSubString: ' ') ifTrue: [ self signalPrefixToSearchCannotHaveSpaces ]! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'CR 10/7/2020 21:17:25'!
initializeWith: aStackWhereToSearchIn
	stack := aStackWhereToSearchIn.
	poppedStackElements := OrderedCollection new.
	
	 ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'instance creation' stamp: 'BT 10/5/2020 18:21:24'!
in: aStackWhereToSearchIn

	^ self new initializeWith: aStackWhereToSearchIn.! !


!SentenceFinderByPrefix class methodsFor: 'error messages' stamp: 'CR 10/7/2020 22:09:48'!
prefixToSearchCannotBeEmpty
	
	^ 'El prefijo no puede ser vacío!!'! !

!SentenceFinderByPrefix class methodsFor: 'error messages' stamp: 'CR 10/7/2020 22:25:21'!
prefixToSearchCannotHaveSpaces
	
	^ 'El prefijo no puede tener espacios!!'! !


!classDefinition: #StackNode category: 'Stack-Exercise'!
Object subclass: #StackNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackNode methodsFor: 'stack-reporting' stamp: 'CR 10/7/2020 22:57:35'!
checkIfNonEmptyAndGetTopIfItsPossible: myStack
	self subclassResponsibility.! !

!StackNode methodsFor: 'stack-reporting' stamp: 'CR 10/7/2020 22:57:52'!
checkIfNonEmptyAndPopIfItsPossible: myStack
	self subclassResponsibility.! !


!classDefinition: #EmptyStackNode category: 'Stack-Exercise'!
StackNode subclass: #EmptyStackNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyStackNode methodsFor: 'stack-reporting' stamp: 'CR 10/7/2020 22:56:43'!
checkIfNonEmptyAndGetTopIfItsPossible: myStack
	myStack cantAccessElementOnEmptyStackNode. ! !

!EmptyStackNode methodsFor: 'stack-reporting' stamp: 'CR 10/7/2020 22:55:22'!
checkIfNonEmptyAndPopIfItsPossible: myStack
	myStack cantAccessElementOnEmptyStackNode. ! !


!classDefinition: #NonEmptyStackNode category: 'Stack-Exercise'!
StackNode subclass: #NonEmptyStackNode
	instanceVariableNames: 'sentence nextStackNode'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NonEmptyStackNode methodsFor: 'assign-operations' stamp: 'BT 10/3/2020 22:20:10'!
next: aStackNode
	nextStackNode := aStackNode.! !


!NonEmptyStackNode methodsFor: 'initialization' stamp: 'CR 10/5/2020 21:15:21'!
initializeWith: anStackElementSentence
	sentence := anStackElementSentence.
	nextStackNode := EmptyStackNode new.! !


!NonEmptyStackNode methodsFor: 'accessing' stamp: 'BT 10/3/2020 22:44:15'!
next
	^ nextStackNode! !

!NonEmptyStackNode methodsFor: 'accessing' stamp: 'CR 10/5/2020 21:14:26'!
sentence
	^ sentence ! !


!NonEmptyStackNode methodsFor: 'stack-reporting' stamp: 'CR 10/7/2020 22:58:58'!
checkIfNonEmptyAndGetTopIfItsPossible: myStack
	^ sentence.! !

!NonEmptyStackNode methodsFor: 'stack-reporting' stamp: 'CR 10/7/2020 23:00:28'!
checkIfNonEmptyAndPopIfItsPossible: myStack
	^ myStack popNonEmptyStackNode.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NonEmptyStackNode class' category: 'Stack-Exercise'!
NonEmptyStackNode class
	instanceVariableNames: ''!

!NonEmptyStackNode class methodsFor: 'instance creation' stamp: 'BT 10/3/2020 22:16:47'!
initializeWith: anStackElement
	^self new initializeWith: anStackElement. 
	! !

!NonEmptyStackNode class methodsFor: 'instance creation' stamp: 'BT 10/3/2020 22:16:59'!
with: anStackElement
	^self new initializeWith: anStackElement. 
	! !
