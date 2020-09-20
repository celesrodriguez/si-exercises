!classDefinition: #CantSuspend category: #'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'CR 9/19/2020 20:56:11'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook codeBlockToExecute|
	
	customerBook := CustomerBook new.

	codeBlockToExecute := [customerBook addCustomerNamed: 'John Lennon'].
	
	self should: codeBlockToExecute notTakeMoreThan: 50 milliSeconds.
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'CR 9/19/2020 20:56:24'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds
	| customerBook paulMcCartney codeBlockToExecute |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	customerBook addCustomerNamed: paulMcCartney.
	
	codeBlockToExecute := [customerBook removeCustomerNamed: paulMcCartney].
	
	self should: codeBlockToExecute notTakeMoreThan: 100 milliSeconds.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'CR 9/19/2020 21:03:10'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook codeBlockThatRaisesException exceptionToCatch assertionsBlock|
			
	customerBook := CustomerBook new.
	codeBlockThatRaisesException := 	[ customerBook addCustomerNamed: ''.].
	exceptionToCatch := Error. 
	assertionsBlock :=  [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ].
	self should: codeBlockThatRaisesException raise: exceptionToCatch withExceptionDo: assertionsBlock. ! !

!CustomerBookTest methodsFor: 'testing' stamp: 'CR 9/19/2020 21:05:41'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook codeBlockThatRaisesException exceptionToCatch assertionsBlock|
			
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: 'John Lennon'.
	
	codeBlockThatRaisesException := [ customerBook removeCustomerNamed: 'Paul McCartney'.].
	exceptionToCatch := NotFound. 
	assertionsBlock :=  [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: 'John Lennon') ].
		
	self should: codeBlockThatRaisesException raise: exceptionToCatch withExceptionDo: assertionsBlock. ! !

!CustomerBookTest methodsFor: 'testing' stamp: 'CR 9/19/2020 21:49:05'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 1 equals: customerBook numberOfSuspendedCustomers.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'CR 9/19/2020 21:48:14'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assert: customerBook isEmpty.
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'CR 9/19/2020 21:11:57'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon codeBlockThatRaisesException exceptionToCatch assertionsBlock|
				
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.

	codeBlockThatRaisesException := [ customerBook suspendCustomerNamed: 'George Harrison'.].
	exceptionToCatch := CantSuspend. 
	assertionsBlock :=  [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ].
	self should: codeBlockThatRaisesException raise: exceptionToCatch withExceptionDo: assertionsBlock. ! !

!CustomerBookTest methodsFor: 'testing' stamp: 'CR 9/19/2020 21:14:26'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon codeBlockThatRaisesException exceptionToCatch assertionsBlock|
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	codeBlockThatRaisesException := [ customerBook suspendCustomerNamed: johnLennon].
	exceptionToCatch := CantSuspend. 
	assertionsBlock :=  [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon). ].
		
	self should: codeBlockThatRaisesException raise: exceptionToCatch withExceptionDo: assertionsBlock. ! !



!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspendedCustomers activeCustomers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'CR 9/19/2020 22:13:45'!
includesCustomerNamed: aCustomerName

	^(activeCustomers includes: aCustomerName) or: [ suspendedCustomers includes: aCustomerName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'CR 9/19/2020 22:15:34'!
isAnEmptyBook
	
	^activeCustomers isEmpty and: [ suspendedCustomers isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'CR 9/19/2020 22:16:06'!
initialize

	activeCustomers := OrderedCollection new.
	suspendedCustomers = OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'CR 9/19/2020 22:16:26'!
addCustomerNamed: aCustomerName

	aCustomerName isAnEmptyBook ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aCustomerName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	activeCustomers add: aCustomerName. ! !

!CustomerBook methodsFor: 'customer management' stamp: 'CR 9/19/2020 22:12:27'!
numberOfActiveCustomers
	
	^activeCustomers size.! !

!CustomerBook methodsFor: 'customer management' stamp: 'CR 9/19/2020 22:16:41'!
numberOfCustomers
	
	^activeCustomers size + suspendedCustomers size.! !

!CustomerBook methodsFor: 'customer management' stamp: 'CR 9/19/2020 22:16:46'!
numberOfSuspendedCustomers
	
	^suspendedCustomers size.! !

!CustomerBook methodsFor: 'customer management' stamp: 'CR 9/19/2020 22:17:05'!
removeCustomerNamed: aName 
 
	1 to: activeCustomers size do: 
	[ :index |
		aName = (activeCustomers at: index)
			ifTrue: [
				activeCustomers removeAt: index.
				^ aName 
			] 
	].

	1 to: suspendedCustomers size do: 	
	[ :index |
		aName = (suspendedCustomers at: index)
			ifTrue: [
				suspendedCustomers removeAt: index.
				^ aName 
			] 
	].
	
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'CR 9/19/2020 22:17:36'!
suspendCustomerNamed: aCustomerName 
	
	(activeCustomers includes: aCustomerName) ifFalse: [^CantSuspend signal].
	
	activeCustomers remove: aCustomerName.
	
	suspendedCustomers add: aCustomerName.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 9/17/2020 06:01:49'!
customerAlreadyExistsErrorMessage

	^'customer already exists!!'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 9/17/2020 06:02:05'!
customerCanNotBeEmptyErrorMessage

	^'customer name cannot be empty!!'! !
