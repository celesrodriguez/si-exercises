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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


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


!OOStack methodsFor: 'private-operations' stamp: 'BT 10/3/2020 22:36:56'!
popEmptyStackNode
	^ self error: self class stackEmptyErrorDescription.
! !

!OOStack methodsFor: 'private-operations' stamp: 'BT 10/3/2020 22:50:59'!
popNonEmptyStackNode
	|newTop oldTop|
	oldTop := top.
	newTop := top next.
	top := newTop.
	size := size - 1.
	^ oldTop element copy. ! !


!OOStack methodsFor: 'operations' stamp: 'BT 10/3/2020 22:26:15'!
pop
	top xxx: self. 
	"^ self error: self class stackEmptyErrorDescription"! !

!OOStack methodsFor: 'operations' stamp: 'BT 10/3/2020 22:17:55'!
push: anStackElement
	|stackNode|
	size := size +1.
	stackNode := NonEmptyStackNode with: anStackElement.
	stackNode next: top.
	top := stackNode! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 10/1/2020 18:08:13'!
stackEmptyErrorDescription
	
	^ 'Stack is empty!!'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #StackNode category: 'Stack-Exercise'!
Object subclass: #StackNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackNode methodsFor: 'as yet unclassified' stamp: 'BT 10/3/2020 22:27:31'!
xxx: myStack
	self subclassResponsibility.! !


!classDefinition: #EmptyStackNode category: 'Stack-Exercise'!
StackNode subclass: #EmptyStackNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyStackNode methodsFor: 'as yet unclassified' stamp: 'BT 10/3/2020 22:35:12'!
xxx: myStack
	myStack popEmptyStackNode. ! !


!classDefinition: #NonEmptyStackNode category: 'Stack-Exercise'!
StackNode subclass: #NonEmptyStackNode
	instanceVariableNames: 'element nextStackNode'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NonEmptyStackNode methodsFor: 'initialization' stamp: 'BT 10/3/2020 22:18:37'!
initializeWith: anStackElement
	element := anStackElement.
	nextStackNode := EmptyStackNode new.! !

!NonEmptyStackNode methodsFor: 'initialization' stamp: 'BT 10/3/2020 22:44:15'!
next
	^ nextStackNode! !

!NonEmptyStackNode methodsFor: 'initialization' stamp: 'BT 10/3/2020 22:20:10'!
next: aStackNode
	nextStackNode := aStackNode.! !


!NonEmptyStackNode methodsFor: 'as yet unclassified' stamp: 'BT 10/3/2020 22:42:41'!
element
	^ element ! !

!NonEmptyStackNode methodsFor: 'as yet unclassified' stamp: 'BT 10/3/2020 22:38:13'!
xxx: myStack
	myStack popNonEmptyStackNode.! !

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
