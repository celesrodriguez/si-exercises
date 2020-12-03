!classDefinition: #CartTest category: 'TusLibros'!
TestCase subclass: #CartTest
	instanceVariableNames: 'testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test01NewCartsAreCreatedEmpty

	self assert: testObjectsFactory createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [ cart add: testObjectsFactory itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 0 of: testObjectsFactory itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 2 of: testObjectsFactory itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test06CartRemembersAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self assert: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self deny: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	self assert: (cart occurrencesOf: testObjectsFactory itemSellByTheStore) = 2! !


!CartTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 18:09'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.! !


!classDefinition: #CashierTest category: 'TusLibros'!
TestCase subclass: #CashierTest
	instanceVariableNames: 'testObjectsFactory debitBehavior'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'CR 12/2/2020 23:50:27'!
test01CanNotCheckoutAnEmptyCart

	| salesBook |
	
	salesBook := OrderedCollection new.
	self 
		should: [ Cashier 
			toCheckout: testObjectsFactory createCart 
			charging: testObjectsFactory notExpiredCreditCard 
			through: self
			on: testObjectsFactory today
			registeringOn:  salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier cartCanNotBeEmptyErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'CR 12/2/2020 23:50:31'!
test02CalculatedTotalIsCorrect

	| cart cashier |
	
	cart := testObjectsFactory createCart.
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	
	cashier :=  Cashier
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard 
		through: self
		on: testObjectsFactory today 
		registeringOn: OrderedCollection new.
		
	self assert: cashier checkOut = (testObjectsFactory itemSellByTheStorePrice * 2)! !

!CashierTest methodsFor: 'tests' stamp: 'CR 12/2/2020 23:50:35'!
test03CanNotCheckoutWithAnExpiredCreditCart

	| cart salesBook |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
	
	self
		should: [ Cashier 
				toCheckout: cart 
				charging: testObjectsFactory expiredCreditCard 
				through: self
				on: testObjectsFactory today
				registeringOn: salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Cashier canNotChargeAnExpiredCreditCardErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'CR 12/2/2020 23:50:39'!
test04CheckoutRegistersASale

	| cart cashier salesBook total |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard
		through: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	total := cashier checkOut.
					
	self assert: salesBook size = 1.
	self assert: salesBook first total = total.! !

!CashierTest methodsFor: 'tests' stamp: 'CR 12/2/2020 23:50:42'!
test05CashierChargesCreditCardUsingMerchantProcessor

	| cart cashier salesBook total creditCard debitedAmout debitedCreditCard  |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		through: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	debitBehavior := [ :anAmount :aCreditCard | 
		debitedAmout := anAmount.
		debitedCreditCard := aCreditCard ].
	total := cashier checkOut.
					
	self assert: debitedCreditCard = creditCard.
	self assert: debitedAmout = total.! !

!CashierTest methodsFor: 'tests' stamp: 'CR 12/2/2020 23:50:47'!
test06CashierDoesNotSaleWhenTheCreditCardHasNoCredit

	| cart cashier salesBook creditCard |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 	debitBehavior := [ :anAmount :aCreditCard | self error: Cashier creditCardHasNoCreditErrorMessage].
	
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		through: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	self 
		should: [cashier checkOut ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier creditCardHasNoCreditErrorMessage.
			self assert: salesBook isEmpty ]! !


!CashierTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 19:03'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.
	debitBehavior := [ :anAmount :aCreditCard | ]! !


!CashierTest methodsFor: 'merchant processor protocol' stamp: 'HernanWilkinson 6/17/2013 19:02'!
debit: anAmount from: aCreditCard 

	^debitBehavior value: anAmount value: aCreditCard ! !


!classDefinition: #RestInterfaceTest category: 'TusLibros'!
TestCase subclass: #RestInterfaceTest
	instanceVariableNames: 'testObjectFactory aClientID'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!RestInterfaceTest methodsFor: 'tests' stamp: 'CR 12/3/2020 01:06:41'!
test01newCartsCreatedAreEmpty

	| interface cartID |
	interface := RestInterface for: testObjectFactory defaultSupermarket withAuthenticator: testObjectFactory defaultAuthenticator.
	
	cartID := interface createCartForClient: 'aClientID'  withPassword: 'passwordOfClientWhoIsCreatingACart'.
	
	self assert: (interface listCart: cartID) isEmpty.
				! !

!RestInterfaceTest methodsFor: 'tests' stamp: 'CR 12/3/2020 01:08:06'!
test02UserIsAuthenticatedWhenCreatesANewCart
	| interface |
	interface := RestInterface for: testObjectFactory defaultSupermarket withAuthenticator: (testObjectFactory invalidClientAuthenticator).

	self should: [interface createCartForClient: 'aClientID'  withPassword: 'anInvalidPassword'.]
	 raise: Error 
	 withMessageText: RestInterface invalidClientErrorDescription.
				! !

!RestInterfaceTest methodsFor: 'tests' stamp: 'CR 12/3/2020 01:08:12'!
test03CannotAddABookToAnUnknownCart

	| interface |
	interface := RestInterface for: testObjectFactory defaultSupermarket withAuthenticator: testObjectFactory defaultAuthenticator.
	
	self should: [ interface addToCart: (testObjectFactory createCart ) book: (testObjectFactory itemSellByTheStore)]
	raise: Error 
	withMessageText: RestInterface unknownCartErrorMessage.
				! !

!RestInterfaceTest methodsFor: 'tests' stamp: 'CR 12/3/2020 01:08:19'!
test04AddingABookToACreatedCartWorksCorrectly

	| interface cartID itemToAdd itemsListOfCart |
	interface := RestInterface for: testObjectFactory defaultSupermarket withAuthenticator: testObjectFactory defaultAuthenticator.
	
	cartID := interface createCartForClient: 'aClientID'  withPassword: 'passwordOfClientWhoIsCreatingACart'.
	itemToAdd := testObjectFactory itemSellByTheStore.
	interface addToCart: cartID book: itemToAdd. 
	
	itemsListOfCart := interface listCart: cartID.
	
	self assert: itemsListOfCart size = 1.
	self assert: (itemsListOfCart occurrencesOf: itemToAdd) = 1.
				! !

!RestInterfaceTest methodsFor: 'tests' stamp: 'CR 12/3/2020 01:08:26'!
test05CannotListItemsOfAnInvalidCart

	| interface |
	interface := RestInterface for: testObjectFactory defaultSupermarket withAuthenticator: testObjectFactory defaultAuthenticator.
	
	self should: [ interface listCart: (testObjectFactory createCart)]
	raise: Error 
	withMessageText: RestInterface unknownCartErrorMessage.
	
	
				! !

!RestInterfaceTest methodsFor: 'tests' stamp: 'CR 12/3/2020 01:08:34'!
test06ListItemsOfValidCartWorksCorrectly

	| interface cartID itemToAdd |
	interface := RestInterface for: testObjectFactory defaultSupermarket withAuthenticator: testObjectFactory defaultAuthenticator.
	
	cartID := interface createCartForClient: 'aClientID'  withPassword: 'passwordOfClientWhoIsCreatingACart'.
	itemToAdd := testObjectFactory itemSellByTheStore.
	interface addToCart: cartID book: itemToAdd. 
	
	self assert: (interface listCart: cartID) = (Bag with: itemToAdd).
				! !

!RestInterfaceTest methodsFor: 'tests' stamp: 'CR 12/3/2020 06:11:51'!
test07CannotCheckOutUnknownCart

	| interface |
	interface := RestInterface for: testObjectFactory defaultSupermarket withAuthenticator: testObjectFactory defaultAuthenticator.
	
	self should: [ interface checkout: (testObjectFactory createCart) withCreditCard: (testObjectFactory notExpiredCreditCard ) for: (testObjectFactory defaultCardOwner) ]
	raise: Error 
	withMessageText: RestInterface unknownCartErrorMessage.
	
	
				! !

!RestInterfaceTest methodsFor: 'tests' stamp: 'CR 12/3/2020 06:55:08'!
test08CannotCheckOutEmptyCart

	| interface cartID  |
	interface := RestInterface for: testObjectFactory defaultSupermarket withAuthenticator: testObjectFactory defaultAuthenticator.
	
	cartID := interface createCartForClient: 'aClientID'  withPassword: 'passwordOfClientWhoIsCreatingACart'.
	
	self should: [interface checkout: cartID withCreditCard: (testObjectFactory notExpiredCreditCard ) for: 'aClientID'.] 
	raise: Error
	withExceptionDo: [:anError | | clientPurchases |
		clientPurchases := interface listPurchases: 'aClientID' withPassword: 'passwordOfClientWhoIsCreatingACart'.
		self assert: clientPurchases = 'No purchases'. 
		self assert: anError messageText = RestInterface cannotCheckOutEmptyCart.
		].! !

!RestInterfaceTest methodsFor: 'tests' stamp: 'CR 12/3/2020 06:49:48'!
test09UserIsAuthenticatedWhenListingPurchases
	| interface |
	interface := RestInterface for: testObjectFactory defaultSupermarket withAuthenticator: (testObjectFactory invalidClientAuthenticator).
	
	self should: [interface listPurchases: 'aClientID' withPassword: 'anInvalidPassword'.]
	 raise: Error 
	 withMessageText: RestInterface invalidClientErrorDescription.
				! !

!RestInterfaceTest methodsFor: 'tests' stamp: 'CR 12/3/2020 06:43:59'!
test10CheckOutValidCartWorksCorrectly

	| interface cartID itemToAdd clientPurchases purchase |
	interface := RestInterface for: testObjectFactory defaultSupermarket withAuthenticator: testObjectFactory defaultAuthenticator.
	purchase := '(''validBook''->1 ) Total spent = 10'.
	cartID := interface createCartForClient: 'aClientID'  withPassword: 'passwordOfClientWhoIsCreatingACart'.
	itemToAdd := testObjectFactory itemSellByTheStore.
	interface addToCart: cartID book: itemToAdd. 
	
	interface checkout: cartID withCreditCard: (testObjectFactory notExpiredCreditCard ) for: 'aClientID'.
	clientPurchases := interface listPurchases: 'aClientID' withPassword: 'passwordOfClientWhoIsCreatingACart'.
	self assert: purchase = clientPurchases.
				! !

!RestInterfaceTest methodsFor: 'tests' stamp: 'CR 12/3/2020 06:55:40'!
test11PurchasesForClientWhoDidNotCheckOutIsEmpty

	| interface cartID itemToAdd clientPurchases |
	interface := RestInterface for: testObjectFactory defaultSupermarket withAuthenticator: testObjectFactory defaultAuthenticator.
	
	cartID := interface createCartForClient: 'aClientID'  withPassword: 'passwordOfClientWhoIsCreatingACart'.
	itemToAdd := testObjectFactory itemSellByTheStore.
	interface addToCart: cartID book: itemToAdd. 
	
	clientPurchases := interface listPurchases: 'aClientID' withPassword: 'passwordOfClientWhoIsCreatingACart'.
	self assert: 'No purchases' = clientPurchases.
				! !


!RestInterfaceTest methodsFor: 'setup' stamp: 'BT 12/2/2020 10:39:21'!
setUp
	testObjectFactory := StoreTestObjectsFactory new.
	
	! !


!classDefinition: #AuthenticatorSimulator category: 'TusLibros'!
Object subclass: #AuthenticatorSimulator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!AuthenticatorSimulator methodsFor: 'authenticate' stamp: 'BT 12/2/2020 11:47:14'!
authenticateUser: aUserToAunthenticate withPassword: aPassword 
	^ self subclassResponsibility.! !


!classDefinition: #AuthenticatorSimulatorOfInvalidClients category: 'TusLibros'!
AuthenticatorSimulator subclass: #AuthenticatorSimulatorOfInvalidClients
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!AuthenticatorSimulatorOfInvalidClients methodsFor: 'authenticate' stamp: 'BT 12/2/2020 11:39:08'!
authenticateUser: aUserToAunthenticate withPassword: aPassword 
	^ false! !


!classDefinition: #AuthenticatorSimulatorOfValidClients category: 'TusLibros'!
AuthenticatorSimulator subclass: #AuthenticatorSimulatorOfValidClients
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!AuthenticatorSimulatorOfValidClients methodsFor: 'authenticate' stamp: 'BT 12/2/2020 11:39:16'!
authenticateUser: aUserToAunthenticate withPassword: aPassword 
	^ true! !


!classDefinition: #Cart category: 'TusLibros'!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:06'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 19:09'!
total

	^ items sum: [ :anItem | catalog at: anItem ]! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !


!Cart methodsFor: 'user interface' stamp: 'BT 12/2/2020 10:56:32'!
listItems
	^ items asBag.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: 'TusLibros'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: 'TusLibros'!
Object subclass: #Cashier
	instanceVariableNames: 'cart salesBook merchantProcessor creditCard total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:08'!
calculateTotal

	total := cart total.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'CR 12/3/2020 00:13:02'!
createSale

	^ Sale of: total with: cart listItems.
 ! !

!Cashier methodsFor: 'checkout - private' stamp: 'CR 12/3/2020 00:23:54'!
debitTotal
	
	^ merchantProcessor debit: total from: creditCard.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
registerSale

	salesBook add: self createSale! !


!Cashier methodsFor: 'checkout' stamp: 'CR 12/3/2020 00:20:32'!
checkOut

	self calculateTotal.
	self registerSale.
	^ self debitTotal.! !


!Cashier methodsFor: 'initialization' stamp: 'CR 12/2/2020 23:49:57'!
initializeToCheckout: aCart charging: aCreditCard through: aMerchantProcessor registeringOn: aSalesBook
	
	cart := aCart.
	creditCard := aCreditCard.
	merchantProcessor := aMerchantProcessor.
	salesBook := aSalesBook! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: 'TusLibros'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:22'!
assertIsNotEmpty: aCart 
	
	aCart isEmpty ifTrue: [self error: self cartCanNotBeEmptyErrorMessage ]! !

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:23'!
assertIsNotExpired: aCreditCard on: aDate
	
	(aCreditCard isExpiredOn: aDate) ifTrue: [ self error: self canNotChargeAnExpiredCreditCardErrorMessage ]! !


!Cashier class methodsFor: 'instance creation' stamp: 'CR 12/2/2020 23:50:10'!
toCheckout: aCart charging: aCreditCard through: aMerchantProcessor on: aDate registeringOn: aSalesBook
	
	self assertIsNotEmpty: aCart.
	self assertIsNotExpired: aCreditCard on: aDate.
	
	^self new initializeToCheckout: aCart charging: aCreditCard through: aMerchantProcessor registeringOn: aSalesBook! !


!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 18:21'!
canNotChargeAnExpiredCreditCardErrorMessage
	
	^'Can not charge an expired credit card'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:56'!
cartCanNotBeEmptyErrorMessage
	
	^'Can not check out an empty cart'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 19:02'!
creditCardHasNoCreditErrorMessage
	
	^'Credit card has no credit'! !


!classDefinition: #CreditCard category: 'TusLibros'!
Object subclass: #CreditCard
	instanceVariableNames: 'expiration'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 18:39'!
isExpiredOn: aDate 
	
	^expiration start < (Month month: aDate monthIndex year: aDate yearNumber) start ! !


!CreditCard methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:38'!
initializeExpiringOn: aMonth 
	
	expiration := aMonth ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: 'TusLibros'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:38'!
expiringOn: aMonth 
	
	^self new initializeExpiringOn: aMonth! !


!classDefinition: #MerchantProcessor category: 'TusLibros'!
Object subclass: #MerchantProcessor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!


!classDefinition: #MPInvalidTransaction category: 'TusLibros'!
MerchantProcessor subclass: #MPInvalidTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!MPInvalidTransaction methodsFor: 'as yet unclassified' stamp: 'CR 12/3/2020 00:06:58'!
debit: amount from: creditCard
	self error: self class invalidTransaction.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MPInvalidTransaction class' category: 'TusLibros'!
MPInvalidTransaction class
	instanceVariableNames: ''!

!MPInvalidTransaction class methodsFor: 'as yet unclassified' stamp: 'CR 12/3/2020 00:07:17'!
invalidTransaction
	^'Invalid transaction!!'! !


!classDefinition: #MPValidTransaction category: 'TusLibros'!
MerchantProcessor subclass: #MPValidTransaction
	instanceVariableNames: 'transactionID'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!MPValidTransaction methodsFor: 'as yet unclassified' stamp: 'CR 12/3/2020 00:26:30'!
debit: amount from: creditCard
	^ transactionID. ! !

!MPValidTransaction methodsFor: 'as yet unclassified' stamp: 'CR 12/3/2020 00:26:15'!
initialize
	transactionID := 0. ! !


!classDefinition: #RestInterface category: 'TusLibros'!
Object subclass: #RestInterface
	instanceVariableNames: 'supermarket authenticator cartsByClient'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!RestInterface methodsFor: 'authentication' stamp: 'BT 12/2/2020 11:42:44'!
validateUser: aUserToAuthenticate withPassword: aPassword
	(authenticator authenticateUser: aUserToAuthenticate withPassword: aPassword) ifFalse: [self error: self class invalidClientErrorDescription].
	! !


!RestInterface methodsFor: 'create cart private' stamp: 'CR 12/3/2020 00:58:58'!
assignNewCart: newCartID toClient: aClientID

	(cartsByClient at: aClientID ifAbsentPut: [OrderedCollection new]) add: newCartID.! !


!RestInterface methodsFor: 'api' stamp: 'BT 12/2/2020 14:31:25'!
addToCart: aCartID book: aBook
	supermarket addBook: aBook toCart: 	aCartID ifAbsent: [self error: self class  unknownCartErrorMessage].
! !

!RestInterface methodsFor: 'api' stamp: 'CR 12/3/2020 01:30:02'!
checkout: aCartToCheckOut withCreditCard: cardToPayWith for: clientID 

	^ supermarket checkout: aCartToCheckOut withCreditCard: cardToPayWith for: clientID ifInvalidCart: [self error: self class unknownCartErrorMessage].! !

!RestInterface methodsFor: 'api' stamp: 'CR 12/3/2020 01:32:40'!
createCartForClient: aClientID withPassword: passwordOfClientWhoIsCreatingACart
	| newCartID |
	self validateUser: aClientID withPassword: passwordOfClientWhoIsCreatingACart.
	newCartID := supermarket newCartForClient: aClientID.
	self assignNewCart: newCartID toClient: aClientID.
	^newCartID.! !

!RestInterface methodsFor: 'api' stamp: 'CR 12/2/2020 23:09:17'!
listCart: aCartID 
	^ supermarket listCartsItemsOf: aCartID ifAbsent: [ self error: self class unknownCartErrorMessage ]. ! !

!RestInterface methodsFor: 'api' stamp: 'CR 12/3/2020 02:01:20'!
listPurchases: clientID withPassword: clientPassword
	| clientSalesBook |
	self validateUser: clientID withPassword: clientPassword.
	clientSalesBook := supermarket salesBookFor: clientID.
	^ self purchasesGivenSalesBook: clientSalesBook.! !


!RestInterface methodsFor: 'initialization' stamp: 'CR 12/3/2020 00:48:12'!
initializeWith: aSupermarket withAuthenticator: anAuthenticator 
	supermarket := aSupermarket.
	authenticator := anAuthenticator.
	cartsByClient := Dictionary new.
! !


!RestInterface methodsFor: 'list purchases private' stamp: 'CR 12/3/2020 06:31:29'!
addItemsFromSalesBook: clientSalesBook To: allItems

	clientSalesBook do: [: sale | allItems addAll: (sale items) ]! !

!RestInterface methodsFor: 'list purchases private' stamp: 'CR 12/3/2020 06:24:36'!
asStringItemsFrom: allItems

	^ allItems contents asString withoutPrefix: 'a Dictionary'! !

!RestInterface methodsFor: 'list purchases private' stamp: 'CR 12/3/2020 06:25:47'!
itemsAsString: allItems

	^ allItems contents asString withoutPrefix: 'a Dictionary'! !

!RestInterface methodsFor: 'list purchases private' stamp: 'CR 12/3/2020 06:31:39'!
purchasesGivenSalesBook: clientSalesBook
	|  totalSpent allItems |
	(clientSalesBook isEmpty) ifTrue: [^'No purchases'].
	
	totalSpent := self sumTotalSpentFor: clientSalesBook.
	allItems := Bag new.
	self addItemsFromSalesBook: clientSalesBook To: allItems.
	^ (self itemsAsString: allItems), (self totalSpentAsString: totalSpent).! !

!RestInterface methodsFor: 'list purchases private' stamp: 'CR 12/3/2020 06:22:18'!
sumTotalSpentFor: clientSalesBook

	^ clientSalesBook sum: [: sale | sale total ] ifEmpty: [0]! !

!RestInterface methodsFor: 'list purchases private' stamp: 'CR 12/3/2020 06:37:32'!
totalSpentAsString: totalSpent

	^ ' Total spent = ', totalSpent asString! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RestInterface class' category: 'TusLibros'!
RestInterface class
	instanceVariableNames: ''!

!RestInterface class methodsFor: 'instance creation' stamp: 'BT 12/2/2020 11:28:39'!
for: aSupermarket withAuthenticator: anAuthenticator 
	^ self new initializeWith: aSupermarket withAuthenticator: anAuthenticator.! !


!RestInterface class methodsFor: 'error messages' stamp: 'CR 12/3/2020 06:52:28'!
cannotCheckOutEmptyCart
	^ 'Can not check out empty cart!!'.! !

!RestInterface class methodsFor: 'error messages' stamp: 'CR 12/2/2020 23:27:33'!
expiredCreditCard
	^ 'The credit card is expired'.! !

!RestInterface class methodsFor: 'error messages' stamp: 'BT 12/2/2020 11:32:00'!
invalidClientErrorDescription
	^ 'Invalid client!!'.! !

!RestInterface class methodsFor: 'error messages' stamp: 'BT 12/2/2020 12:26:29'!
unknownCartErrorMessage
	'cant add items to an unknown cart!!'.! !


!classDefinition: #Sale category: 'TusLibros'!
Object subclass: #Sale
	instanceVariableNames: 'total items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Sale methodsFor: 'items' stamp: 'CR 12/3/2020 01:48:43'!
items
	
	^ items ! !


!Sale methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 18:48'!
total
	
	^ total! !


!Sale methodsFor: 'initialization' stamp: 'CR 12/3/2020 00:14:37'!
initializeTotal: aTotal withItems: boughtItems.

	total := aTotal.
	items := boughtItems.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: 'TusLibros'!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'instance creation' stamp: 'CR 12/3/2020 00:19:21'!
of: aTotal with: boughtItems

	(aTotal <= 0) ifTrue: [self hasToBeNonNegative].
	^self new initializeTotal: aTotal withItems: boughtItems.! !


!Sale class methodsFor: 'error messages' stamp: 'CR 12/3/2020 00:18:51'!
hasToBeNonNegative
	^'Sale amount has to be non negative!!'! !


!classDefinition: #StoreTestObjectsFactory category: 'TusLibros'!
Object subclass: #StoreTestObjectsFactory
	instanceVariableNames: 'today timeNow'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStore
	
	^ 'validBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStorePrice
	
	^10! !


!StoreTestObjectsFactory methodsFor: 'cashier' stamp: 'BT 12/2/2020 10:22:21'!
defaultCashier
	^ true! !


!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
defaultCatalog
	
	^ Dictionary new
		at: self itemSellByTheStore put: self itemSellByTheStorePrice;
		yourself ! !


!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'CR 12/2/2020 22:50:13'!
defaultCardNumber
	^'245323'! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'HernanWilkinson 6/17/2013 18:37'!
expiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber - 1)! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'HernanWilkinson 6/17/2013 18:36'!
notExpiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber + 1)! !


!StoreTestObjectsFactory methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:37'!
initialize

	today := DateAndTime now! !


!StoreTestObjectsFactory methodsFor: 'date' stamp: 'CR 12/2/2020 22:51:57'!
defaultExpirationDate
	
	^ today + 1! !

!StoreTestObjectsFactory methodsFor: 'date' stamp: 'CR 12/3/2020 07:02:21'!
now
	
	^ timeNow! !

!StoreTestObjectsFactory methodsFor: 'date' stamp: 'HernanWilkinson 6/17/2013 18:37'!
today
	
	^ today! !


!StoreTestObjectsFactory methodsFor: 'supermarket' stamp: 'CR 12/3/2020 01:07:27'!
defaultSupermarket
	^ Supermarket withCatalog: self defaultCatalog through: MPValidTransaction new.! !


!StoreTestObjectsFactory methodsFor: 'interface - authenticator' stamp: 'BT 12/2/2020 11:26:31'!
defaultAuthenticator
	^ AuthenticatorSimulatorOfValidClients new! !

!StoreTestObjectsFactory methodsFor: 'interface - authenticator' stamp: 'BT 12/2/2020 11:30:57'!
invalidClientAuthenticator
	^ AuthenticatorSimulatorOfInvalidClients new.! !


!StoreTestObjectsFactory methodsFor: 'clients' stamp: 'CR 12/2/2020 22:51:27'!
defaultCardOwner
	^ 'BelenT'! !


!classDefinition: #Supermarket category: 'TusLibros'!
Object subclass: #Supermarket
	instanceVariableNames: 'catalog cashier carts salesBookByClient merchantProcessor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Supermarket methodsFor: 'initialization' stamp: 'BT 12/2/2020 10:19:01'!
createIDforCart: needingIDCart
	^ needingIDCart.! !

!Supermarket methodsFor: 'initialization' stamp: 'CR 12/3/2020 01:41:47'!
createSaleBookForClientIfAbsent: aClientID
	salesBookByClient at: aClientID ifAbsentPut: [Bag new].
	! !

!Supermarket methodsFor: 'initialization' stamp: 'CR 12/3/2020 01:23:42'!
initializeWithCatalog: aCatalog through: aMerchantProcessor
	catalog := aCatalog.
	carts := IdentityDictionary new.
	salesBookByClient := Dictionary new.
	merchantProcessor := aMerchantProcessor.! !

!Supermarket methodsFor: 'initialization' stamp: 'CR 12/3/2020 01:37:49'!
newCartForClient: aClientID
	| newCart IDForNewCart |
	newCart := Cart acceptingItemsOf: catalog.
	IDForNewCart := self createIDforCart: newCart.
	carts at: IDForNewCart put: newCart.
	self createSaleBookForClientIfAbsent: aClientID.
	^ IDForNewCart.
	! !


!Supermarket methodsFor: 'interface - interaction' stamp: 'CR 12/3/2020 06:51:32'!
checkout: cartID withCreditCard: creditCardToPayWith for: clientID ifInvalidCart: errorBlock 
	| aCartToCheckOut aCashierToPayWith |
	aCartToCheckOut := carts at: cartID ifAbsent: errorBlock.
	self verifyCartIsNonEmpty: aCartToCheckOut.
	aCashierToPayWith := Cashier toCheckout: aCartToCheckOut charging: creditCardToPayWith through: merchantProcessor on: self timeNow registeringOn: (salesBookByClient at: clientID). 
	^ aCashierToPayWith checkOut.
	
	

	! !

!Supermarket methodsFor: 'interface - interaction' stamp: 'BT 12/2/2020 14:53:04'!
listCartsItemsOf: aCartID ifAbsent: errorBlock
	^ carts at: aCartID ifPresent: [:cart | cart listItems ] ifAbsent: errorBlock.! !

!Supermarket methodsFor: 'interface - interaction' stamp: 'CR 12/3/2020 02:01:47'!
salesBookFor: clientID
	^ salesBookByClient at: clientID.! !

!Supermarket methodsFor: 'interface - interaction' stamp: 'CR 12/3/2020 06:52:44'!
verifyCartIsNonEmpty: aCartToCheckOut

	^ (aCartToCheckOut isEmpty) ifTrue: [self error: RestInterface cannotCheckOutEmptyCart]! !


!Supermarket methodsFor: 'cart' stamp: 'BT 12/2/2020 14:27:33'!
addBook: aBook toCart: aCartID ifAbsent: errorBlock 
	| cart |
	cart := carts at: aCartID ifAbsent: errorBlock.
	cart add: aBook.
	! !


!Supermarket methodsFor: 'as yet unclassified' stamp: 'CR 12/3/2020 00:29:36'!
timeNow
	^DateAndTime now.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Supermarket class' category: 'TusLibros'!
Supermarket class
	instanceVariableNames: ''!

!Supermarket class methodsFor: 'instance creation' stamp: 'CR 12/3/2020 01:05:23'!
withCatalog: aCatalog through: aMerchantProcessor
	^ self new initializeWithCatalog: aCatalog through: aMerchantProcessor.! !
