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
	instanceVariableNames: 'emptyStack thePrefixToFind thePrefixToFindUpperCase aSentenceWithoutThePrefixToFind aSentenceWithThePrefixToFind aStackWithBothSentences aStackWithoutThePrefixToFind aStackWithThePrefixToFindUpperCase'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'BT 10/5/2020 18:13:40'!
setUp

	emptyStack := OOStack new.
	thePrefixToFind := 'hello'.
	thePrefixToFindUpperCase := 'Hello'.
	aSentenceWithoutThePrefixToFind := 'byebye'.
	aSentenceWithThePrefixToFind := 'hello Inge I'.
	
	aStackWithBothSentences :=  (OOStack new push: aSentenceWithoutThePrefixToFind) 
									      push: aSentenceWithThePrefixToFind. 
									
	aStackWithoutThePrefixToFind := OOStack new push: aSentenceWithoutThePrefixToFind.
	
	aStackWithThePrefixToFindUpperCase := OOStack new push: thePrefixToFindUpperCase.
	! !


!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'BT 10/5/2020 20:25:19'!
test01findOnEmptyStackShouldReturnAnEmptyCollection

	| sentenceFinderByPrefix foundSentences |
	
	sentenceFinderByPrefix := SentenceFinderByPrefix in: emptyStack 	.
	
	foundSentences := sentenceFinderByPrefix find: aStackWithoutThePrefixToFind. 
	
	self assert: foundSentences size = 0.

	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'BT 10/5/2020 20:25:42'!
test02findOnStackWithPrefixShouldReturnTheOnlySentenceWithThePrefix

	| sentenceFinderByPrefix foundSentences |

	sentenceFinderByPrefix := SentenceFinderByPrefix in: aStackWithBothSentences 	.
	
	foundSentences := sentenceFinderByPrefix find: thePrefixToFind .
	
	self assert: foundSentences size = 1.
	self assert: foundSentences includes: aSentenceWithThePrefixToFind.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'BT 10/5/2020 20:28:33'!
test03findOnStackWithoutPrefixShouldReturnAnEmptyCollection

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

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'CR 10/5/2020 21:23:44'!
test05findShouldnotChangeTheStack

	| sentenceFinderByPrefix foundSentences aCopyOfStack |

	aCopyOfStack := aStackWithBothSentences copy.
		
	sentenceFinderByPrefix := SentenceFinderByPrefix in: aStackWithBothSentences 	.
	
	foundSentences := sentenceFinderByPrefix find: thePrefixToFind . 
	
	self assert: aCopyOfStack = aStackWithBothSentences.


"
v2test01SentenceFinderByPrefixAppliedEmptyStackShouldByEmpty

	| sentenceFinderByPrefix foundSentences |
	
	sentenceFinderByPrefix := SentenceFinderByPrefix in: emptyStack 	.
	
	self 
		should: [ foundSentences := sentenceFinderByPrefix find: aStackWithoutThePrefixToFind. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
	
	
"! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'size top'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'inicialization' stamp: 'BT 10/3/2020 21:56:35'!
initialize
	size := 0.
	top := EmptyStackNode new.! !


!OOStack methodsFor: 'testing' stamp: 'BT 10/3/2020 21:49:31'!
isEmpty
	^ size = 0! !


!OOStack methodsFor: 'private' stamp: 'CR 10/3/2020 23:13:53'!
cantAccessElementOnEmptyStackNode	
	^ self error: self class stackEmptyErrorDescription.
! !

!OOStack methodsFor: 'private' stamp: 'CR 10/5/2020 21:15:45'!
popNonEmptyStackNode
	|newTop oldTop|
	oldTop := top.
	newTop := top next.
	top := newTop.
	size := size - 1.
	^ oldTop sentence.! !


!OOStack methodsFor: 'operations' stamp: 'CR 10/3/2020 23:21:10'!
pop
	^top checkIfEmptyAndPop: self. ! !

!OOStack methodsFor: 'operations' stamp: 'BT 10/3/2020 22:17:55'!
push: anStackElement
	|stackNode|
	size := size +1.
	stackNode := NonEmptyStackNode with: anStackElement.
	stackNode next: top.
	top := stackNode! !

!OOStack methodsFor: 'operations' stamp: 'CR 10/3/2020 23:30:36'!
size
	^size.! !

!OOStack methodsFor: 'operations' stamp: 'CR 10/5/2020 21:16:27'!
top
	^top getTopStackSentence: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 10/1/2020 18:08:13'!
stackEmptyErrorDescription
	
	^ 'Stack is empty!!'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack sentencesList'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'CR 10/5/2020 22:03:51'!
find: aPrefixToSearch
	| foundSentences |
	foundSentences := 	Bag new. 
	self findSentencesWithPrefix: aPrefixToSearch AndSaveThemIn: foundSentences.
	^ foundSentences. ! !


!SentenceFinderByPrefix methodsFor: 'private' stamp: 'CR 10/5/2020 22:05:54'!
findSentencesWithPrefix: aPrefixToSearch AndSaveThemIn: foundSentences
	| aSentence |
	[stack isEmpty] whileFalse: 
	[aSentence := stack pop.
		(self isPrefix: aPrefixToSearch Of: aSentence) 
		ifTrue: [ foundSentences add: aSentence ].
		sentencesList add: aSentence.
		].
	self rebuildStack.! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'CR 10/5/2020 21:11:04'!
isPrefix: aPrefix Of: aSentence
	^ aSentence is: aPrefix substringAt: 1.! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'CR 10/5/2020 21:54:03'!
rebuildStack
	| aSentenceToPush |
	[sentencesList isEmpty] whileFalse: [aSentenceToPush:= sentencesList removeLast
								stack push: aSentenceToPush ]! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'CR 10/5/2020 21:53:29'!
initializeWith: aStackWhereToSearchIn
	stack := aStackWhereToSearchIn.
	sentencesList := LinkedList new.
	
	 ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'BT 10/5/2020 18:21:24'!
in: aStackWhereToSearchIn

	^ self new initializeWith: aStackWhereToSearchIn.! !


!classDefinition: #StackNode category: 'Stack-Exercise'!
Object subclass: #StackNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackNode methodsFor: 'stack-reporting' stamp: 'CR 10/3/2020 23:21:18'!
checkIfEmptyAndPop: myStack
	self subclassResponsibility.! !

!StackNode methodsFor: 'stack-reporting' stamp: 'CR 10/5/2020 21:16:59'!
getTopStackSentence: myStack
	self subclassResponsibility.! !


!StackNode methodsFor: 'as yet unclassified' stamp: 'BT 10/5/2020 18:25:21'!
xxx: aPrefixToFind
	self subclassResponsibility. ! !


!classDefinition: #EmptyStackNode category: 'Stack-Exercise'!
StackNode subclass: #EmptyStackNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyStackNode methodsFor: 'stack-reporting' stamp: 'CR 10/3/2020 23:21:27'!
checkIfEmptyAndPop: myStack
	^myStack cantAccessElementOnEmptyStackNode. ! !

!EmptyStackNode methodsFor: 'stack-reporting' stamp: 'CR 10/5/2020 21:18:36'!
getTopStackSentence: myStack
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


!NonEmptyStackNode methodsFor: 'stack-reporting' stamp: 'CR 10/3/2020 23:21:35'!
checkIfEmptyAndPop: myStack
	^myStack popNonEmptyStackNode.! !

!NonEmptyStackNode methodsFor: 'stack-reporting' stamp: 'CR 10/5/2020 21:16:15'!
getTopStackSentence: myStack
	^ sentence.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NonEmptyStackNode class' category: 'Stack-Exercise'!
NonEmptyStackNode class
	instanceVariableNames: ''!

!NonEmptyStackNode class methodsFor: 'as yet unclassified' stamp: 'BT 10/3/2020 22:16:47'!
initializeWith: anStackElement
	^self new initializeWith: anStackElement. 
	! !

!NonEmptyStackNode class methodsFor: 'as yet unclassified' stamp: 'BT 10/3/2020 22:16:59'!
with: anStackElement
	^self new initializeWith: anStackElement. 
	! !
