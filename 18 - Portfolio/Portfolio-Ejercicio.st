!classDefinition: #PortfolioTest category: 'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'depositOfFifty receptiveAccountWithDepositOfFifty depositOfHundred receptiveAccountWithDepositOfHundred receptiveAccountWithNoTransactions withdrawOfTwenty'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'CR 11/8/2020 01:17:38'!
assertThat: portfolioTransactions isSameSetAs: transactionsThatShouldBeIncluded
	
	self assert: (transactionsThatShouldBeIncluded allSatisfy: [:transactionThatShouldBeIncluded | portfolioTransactions includes: transactionThatShouldBeIncluded]).
	self assert: portfolioTransactions size = transactionsThatShouldBeIncluded size.! !

!PortfolioTest methodsFor: 'tests' stamp: 'BT 11/5/2020 19:52:20'!
setUp
	
	depositOfFifty := Deposit for: 50.
	receptiveAccountWithDepositOfFifty := ReceptiveAccount new.
	receptiveAccountWithDepositOfFifty register: depositOfFifty.
	
	depositOfHundred := Deposit for: 100.
	receptiveAccountWithDepositOfHundred := ReceptiveAccount new.
	receptiveAccountWithDepositOfHundred register: depositOfHundred.
	
	receptiveAccountWithNoTransactions := ReceptiveAccount new.
	
	withdrawOfTwenty := Withdraw for: 20.! !

!PortfolioTest methodsFor: 'tests' stamp: 'CR 11/4/2020 23:29:01'!
test01balanceOfAnEmptyPortfolioIsZero
	| anEmptyPortfolio |
	anEmptyPortfolio := Portfolio new. 
	
	self assert: 0 = anEmptyPortfolio balance.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'CR 11/8/2020 00:53:14'!
test02balanceOfPortfolioWithOneReceptiveAccountWorksCorrectly
	| aPortfolioWithBalanceZero |
	aPortfolioWithBalanceZero := Portfolio new. 
	
	self assert:  [aPortfolioWithBalanceZero register: receptiveAccountWithNoTransactions] doesNotChange: [aPortfolioWithBalanceZero balance].
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'CR 11/8/2020 00:54:06'!
test03balanceOfPortfolioWithManyReceptiveAccountsAndPortfoliosWorksCorrectly
	| aPortfolioWithTwoAccounts aPortfolioWithAnAccountAndAPortfolio |
	
	aPortfolioWithTwoAccounts := Portfolio new.
	aPortfolioWithTwoAccounts register: receptiveAccountWithNoTransactions.
	aPortfolioWithTwoAccounts register: receptiveAccountWithDepositOfHundred.
	
	aPortfolioWithAnAccountAndAPortfolio := Portfolio new. 
	aPortfolioWithAnAccountAndAPortfolio register: receptiveAccountWithDepositOfFifty.
	aPortfolioWithAnAccountAndAPortfolio register: aPortfolioWithTwoAccounts.
	
	self assert: aPortfolioWithAnAccountAndAPortfolio balance = 150.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'CR 11/8/2020 00:54:33'!
test03bis_balanceOfPortfolioWithManyReceptiveAccountsWorksCorrectly
	| aPortfolioWithTwoAccounts |
	
	aPortfolioWithTwoAccounts := Portfolio new. 
	aPortfolioWithTwoAccounts register: receptiveAccountWithNoTransactions.
	aPortfolioWithTwoAccounts register: receptiveAccountWithDepositOfFifty.
	self assert: aPortfolioWithTwoAccounts balance = 50.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'BT 11/5/2020 19:41:08'!
test04hasRegisteredOfAnEmptyPortfolioIsFalse
	| anEmptyPortfolio |
	anEmptyPortfolio := Portfolio new. 
	
	self deny: (anEmptyPortfolio hasRegistered: depositOfFifty).
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'CR 11/8/2020 00:55:25'!
test05hasRegisteredOfPortfolioWithOneReceptiveAccountWorksCorrectly
	| aPortfolioWithOneAccount |
	
	aPortfolioWithOneAccount := Portfolio new. 
	aPortfolioWithOneAccount register: receptiveAccountWithDepositOfHundred.
	self assert: (aPortfolioWithOneAccount hasRegistered: depositOfHundred).
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'CR 11/8/2020 00:57:16'!
test06hasRegisteredOfPortfolioWithManyReceptiveAccountsAndPortfoliosWorksCorrectly
	| aPortfolioWithTwoAccounts aPortfolioWithAnAccountAndAPortfolio |
	
	aPortfolioWithTwoAccounts := Portfolio new.
	aPortfolioWithTwoAccounts register: receptiveAccountWithNoTransactions.
	aPortfolioWithTwoAccounts register: receptiveAccountWithDepositOfHundred.
	
	aPortfolioWithAnAccountAndAPortfolio := Portfolio new. 
	aPortfolioWithAnAccountAndAPortfolio register: receptiveAccountWithDepositOfFifty.
	aPortfolioWithAnAccountAndAPortfolio register: aPortfolioWithTwoAccounts.
	
	self assert: (aPortfolioWithAnAccountAndAPortfolio hasRegistered: depositOfFifty).
	self assert: (aPortfolioWithAnAccountAndAPortfolio hasRegistered: depositOfHundred).
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'BT 11/5/2020 19:43:43'!
test07transactionsOfAnEmptyPortfolioIsEmpty
	| anEmptyPortfolio |
	anEmptyPortfolio := Portfolio new. 
	
	self assert: anEmptyPortfolio transactions isEmpty.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'CR 11/8/2020 00:57:57'!
test08transactionsOfPortfolioWithOneReceptiveAccountWorksCorrectly
	| aPortfolioWithOneAccount |
	
	aPortfolioWithOneAccount := Portfolio new. 
	aPortfolioWithOneAccount register: receptiveAccountWithDepositOfFifty.
	self assert: (aPortfolioWithOneAccount transactions size) = 1.
	self assert: aPortfolioWithOneAccount transactions includes: depositOfFifty.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'CR 11/8/2020 00:59:27'!
test09transactionOfPortfolioWithManyReceptiveAccountsAndPortfoliosWorksCorrectly
	| aPortfolioWithTwoAccounts aPortfolioWithAnAccountAndAPortfolio |
	
	aPortfolioWithTwoAccounts := Portfolio new.
	aPortfolioWithTwoAccounts register: receptiveAccountWithNoTransactions.
	aPortfolioWithTwoAccounts register: receptiveAccountWithDepositOfHundred.
	
	aPortfolioWithAnAccountAndAPortfolio := Portfolio new. 
	aPortfolioWithAnAccountAndAPortfolio register: receptiveAccountWithDepositOfFifty.
	aPortfolioWithAnAccountAndAPortfolio register: aPortfolioWithTwoAccounts.
	
	self assert: (aPortfolioWithAnAccountAndAPortfolio transactions size) = 2.
	self assert: (aPortfolioWithAnAccountAndAPortfolio transactions includes: depositOfHundred).	
	self assert: (aPortfolioWithAnAccountAndAPortfolio transactions includes: depositOfFifty).	! !

!PortfolioTest methodsFor: 'tests' stamp: 'CR 11/8/2020 01:14:50'!
test10updatingAnAccountIncludedInPortfolioUpdatesPortfolio
	| aPortfolioWithTwoAccounts aPortfolioWithAnAccountAndAPortfolio setWithTransactions|
	
	aPortfolioWithTwoAccounts := Portfolio new.
	aPortfolioWithTwoAccounts register: receptiveAccountWithNoTransactions.

	aPortfolioWithTwoAccounts register: receptiveAccountWithDepositOfHundred.
	
	aPortfolioWithAnAccountAndAPortfolio := Portfolio new. 
	aPortfolioWithAnAccountAndAPortfolio register: receptiveAccountWithDepositOfFifty.
	aPortfolioWithAnAccountAndAPortfolio register: aPortfolioWithTwoAccounts.
	
	receptiveAccountWithDepositOfHundred register: withdrawOfTwenty.
	
	setWithTransactions := Bag with: depositOfHundred with: depositOfFifty with: withdrawOfTwenty.
	
	self assert: (aPortfolioWithAnAccountAndAPortfolio balance) = 130.
	self assertThat: (aPortfolioWithAnAccountAndAPortfolio transactions) isSameSetAs: setWithTransactions.
	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'CR 11/8/2020 01:46:13'!
test11addingPortfolioToPortfolioWhereDirectlyIncludedRaisesError
	| rootPorfolio childPortfolio |
	
	childPortfolio := Portfolio new.
	
	rootPorfolio := Portfolio new. 
	rootPorfolio register: receptiveAccountWithDepositOfFifty.
	rootPorfolio register: childPortfolio.
	
	self should: [childPortfolio register: rootPorfolio] 
	raise: Error   
	withMessageText: PortfolioEntry errorCantAddBecauseCreatesLoop.
	

	! !

!PortfolioTest methodsFor: 'tests' stamp: 'CR 11/8/2020 01:46:18'!
test12addingPortfolioToPortfolioWhereIndirectlyIncludedRaisesError
	| rootPorfolio childPortfolio grandchildPorfolio |
	
	childPortfolio := Portfolio new.
	grandchildPorfolio := Portfolio new.
	
	childPortfolio register: grandchildPorfolio.
	
	rootPorfolio := Portfolio new. 
	rootPorfolio register: receptiveAccountWithDepositOfFifty.
	rootPorfolio register: childPortfolio.

	
	self should: [grandchildPorfolio register: rootPorfolio] 
	raise: Error   
	withMessageText: PortfolioEntry errorCantAddBecauseCreatesLoop.
	

	! !


!classDefinition: #ReceptiveAccountTest category: 'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:44'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:48'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:52'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:14:15'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw account |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:14:01'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 50 on: account1.
		
	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #AccountTransaction category: 'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'receptive-account interaction' stamp: 'CR 11/4/2020 23:12:00'!
addIfItsADeposit: aSetOfDepositsToBeAddedTo
	self subclassResponsibility.! !

!AccountTransaction methodsFor: 'receptive-account interaction' stamp: 'CR 11/4/2020 23:11:56'!
addIfItsAWithdraw: aSetOfWithdrawsToBeAddedTo
	self subclassResponsibility.! !

!AccountTransaction methodsFor: 'receptive-account interaction' stamp: 'CR 11/5/2020 18:52:36'!
collaborateWithBalance: balanceToCollaborateWith

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'CR 11/8/2020 01:51:47'!
initializeFor: aDepositValue

	value := aDepositValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'receptive-account interaction' stamp: 'CR 11/4/2020 23:09:46'!
addIfItsADeposit: aSetOfDepositToBeAddedTo
	aSetOfDepositToBeAddedTo add: self.! !

!Deposit methodsFor: 'receptive-account interaction' stamp: 'CR 11/4/2020 23:10:41'!
addIfItsAWithdraw: aSetOfWithdrawsToBeAddedTo
! !

!Deposit methodsFor: 'receptive-account interaction' stamp: 'CR 11/5/2020 18:53:03'!
collaborateWithBalance: balanceToCollaborateWith
	
	^ balanceToCollaborateWith + value. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'CR 11/8/2020 01:52:06'!
initializeFor: aWithdrawValue

	value := aWithdrawValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'receptive-account interaction' stamp: 'CR 11/4/2020 23:10:28'!
addIfItsADeposit: aSetOfDepositsToBeAddedTo! !

!Withdraw methodsFor: 'receptive-account interaction' stamp: 'CR 11/4/2020 23:10:12'!
addIfItsAWithdraw: aSetOfWithdrawsToBeAddedTo
	aSetOfWithdrawsToBeAddedTo add: self.! !

!Withdraw methodsFor: 'receptive-account interaction' stamp: 'CR 11/5/2020 18:53:24'!
collaborateWithBalance: balanceToCollaborateWith
	
	^ balanceToCollaborateWith - value. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #PortfolioEntry category: 'Portfolio-Ejercicio'!
Object subclass: #PortfolioEntry
	instanceVariableNames: 'portfoliosWhereIncluded'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioEntry methodsFor: 'accessing' stamp: 'BT 11/5/2020 20:48:44'!
balance
	self subclassResponsibility ! !

!PortfolioEntry methodsFor: 'accessing' stamp: 'BT 11/5/2020 20:49:35'!
hasRegistered: anAccountTransactionToBeRegistered
	self subclassResponsibility ! !

!PortfolioEntry methodsFor: 'accessing' stamp: 'BT 11/5/2020 20:48:56'!
transactions
	self subclassResponsibility ! !


!PortfolioEntry methodsFor: 'adding to portfolio' stamp: 'CR 11/7/2020 23:28:42'!
addIfPossibleToPortfolioEntries: aPortfolioToBeAddedTo

	self subclassResponsibility.! !

!PortfolioEntry methodsFor: 'adding to portfolio' stamp: 'CR 11/8/2020 01:49:30'!
addToPorfolio: aPortfolioEntryToAdd
	self subclassResponsibility.! !


!PortfolioEntry methodsFor: 'signals' stamp: 'CR 11/8/2020 01:44:58'!
signalCantAddEntryBecauseCreatesLoop
	self error: self class errorCantAddBecauseCreatesLoop.! !


!PortfolioEntry methodsFor: 'private' stamp: 'CR 11/8/2020 01:50:32'!
collectReachableEntriesAndSaveIn: entriesReachableByPortfoliosWhereIncluded
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioEntry class' category: 'Portfolio-Ejercicio'!
PortfolioEntry class
	instanceVariableNames: ''!

!PortfolioEntry class methodsFor: 'error messages' stamp: 'CR 11/8/2020 01:45:49'!
errorCantAddBecauseCreatesLoop
	^ 'CantAddBecauseCreatesLoop!!'! !


!classDefinition: #Portfolio category: 'Portfolio-Ejercicio'!
PortfolioEntry subclass: #Portfolio
	instanceVariableNames: 'portfolioEntries'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'accessing' stamp: 'BT 11/5/2020 20:12:32'!
balance
	^ portfolioEntries sum: [:aReceptiveAccountToSum | aReceptiveAccountToSum balance] ifEmpty: [0].! !

!Portfolio methodsFor: 'accessing' stamp: 'BT 11/5/2020 20:12:32'!
hasRegistered: aTransactionToCheckIfRegistered
	^ portfolioEntries anySatisfy: [:aReceptiveAccount | aReceptiveAccount hasRegistered: aTransactionToCheckIfRegistered].! !

!Portfolio methodsFor: 'accessing' stamp: 'BT 11/5/2020 20:12:32'!
transactions
	^ portfolioEntries collect: [:aReceptiveAccountToAddItsTransactions | aReceptiveAccountToAddItsTransactions transactions] andFold: [:a :b | a union: b] ifEmpty: (OrderedCollection new) copy. ! !


!Portfolio methodsFor: 'errors' stamp: 'CR 11/8/2020 01:48:08'!
raiseErrorIfIncludedIn: entriesReachableByPortfolioThatMightCreateLoop

	(entriesReachableByPortfolioThatMightCreateLoop includes: self) ifTrue: [ super signalCantAddEntryBecauseCreatesLoop].
	
	! !


!Portfolio methodsFor: 'transactions' stamp: 'CR 11/7/2020 23:24:39'!
register: aPortfolioEntryToBeAdded

	aPortfolioEntryToBeAdded addIfPossibleToPortfolioEntries: self.
	
	
	! !


!Portfolio methodsFor: 'initialization' stamp: 'CR 11/8/2020 01:07:03'!
initialize
	portfolioEntries := Bag new.
	portfoliosWhereIncluded := Bag new.! !


!Portfolio methodsFor: 'verification' stamp: 'CR 11/8/2020 00:07:23'!
checkIfMeOrPortfolioEntriesWhereIncludedAreIn: entriesReachableByPortfolioThatMightCreateLoop

	self raiseErrorIfIncludedIn: entriesReachableByPortfolioThatMightCreateLoop.
	portfoliosWhereIncluded do: [:portfolioWhereIncluded |  portfolioWhereIncluded checkIfMeOrPortfolioEntriesWhereIncludedAreIn: entriesReachableByPortfolioThatMightCreateLoop].

	
	! !

!Portfolio methodsFor: 'verification' stamp: 'CR 11/8/2020 00:36:38'!
collectReachableEntriesAndSaveIn: entriesReachableByPortfoliosWhereIncluded

	(self reachableEntriesAlreadyCollected: entriesReachableByPortfoliosWhereIncluded) ifFalse: [
		self keepCollectingAndSaveIn: entriesReachableByPortfoliosWhereIncluded
		]
	! !

!Portfolio methodsFor: 'verification' stamp: 'CR 11/8/2020 01:41:11'!
entriesReachableIfAdded
	| entriesReachableByMe |
	entriesReachableByMe := Bag new.
	self collectReachableEntriesAndSaveIn: entriesReachableByMe. 
	^ entriesReachableByMe
	
	! !

!Portfolio methodsFor: 'verification' stamp: 'CR 11/8/2020 00:36:07'!
keepCollectingAndSaveIn: entriesReachableByPortfoliosWhereIncluded

	entriesReachableByPortfoliosWhereIncluded add: self.
	portfolioEntries do: 
					[:aPortfolioEntryWhoKeepsCollecting | aPortfolioEntryWhoKeepsCollecting collectReachableEntriesAndSaveIn: entriesReachableByPortfoliosWhereIncluded.].

	! !

!Portfolio methodsFor: 'verification' stamp: 'CR 11/8/2020 00:33:18'!
reachableEntriesAlreadyCollected: entriesReachableByPortfoliosWhereIncluded

	^ entriesReachableByPortfoliosWhereIncluded includes: self! !

!Portfolio methodsFor: 'verification' stamp: 'CR 11/8/2020 00:06:54'!
verifyThereIsNoPortfolioEntryLoopWhenAdding: aPortfolioThatMightCreateLoop
	| entriesReachableByPortfolioThatMightCreateLoop |
	entriesReachableByPortfolioThatMightCreateLoop := aPortfolioThatMightCreateLoop entriesReachableIfAdded. 
	
	self checkIfMeOrPortfolioEntriesWhereIncludedAreIn: entriesReachableByPortfolioThatMightCreateLoop.
	
	! !


!Portfolio methodsFor: 'adding to portfolio' stamp: 'CR 11/8/2020 00:44:51'!
addIfPossibleToPortfolioEntries: aPortfolioToBeAddedTo

	aPortfolioToBeAddedTo verifyThereIsNoPortfolioEntryLoopWhenAdding: self.
	aPortfolioToBeAddedTo addToPorfolio: self.
	self addNewPortfolioWhereIncluded: aPortfolioToBeAddedTo.
	
	
	! !

!Portfolio methodsFor: 'adding to portfolio' stamp: 'CR 11/8/2020 00:44:58'!
addNewPortfolioWhereIncluded: aPortfolioToBeAddedTo

	portfoliosWhereIncluded add: aPortfolioToBeAddedTo! !

!Portfolio methodsFor: 'adding to portfolio' stamp: 'CR 11/7/2020 23:30:03'!
addToPorfolio: aPortfolioEntryToAdd

	portfolioEntries add: aPortfolioEntryToAdd.! !


!classDefinition: #ReceptiveAccount category: 'Portfolio-Ejercicio'!
PortfolioEntry subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'CR 11/8/2020 01:18:57'!
initialize

	transactions := Bag new.! !


!ReceptiveAccount methodsFor: 'private' stamp: 'CR 11/5/2020 18:59:24'!
calculateTotalBalanceFromTransactions

	^ transactions inject: 0 into: [:totalBalance :aTransactionToCollaborateWith |
				aTransactionToCollaborateWith collaborateWithBalance: totalBalance].
	! !

!ReceptiveAccount methodsFor: 'private' stamp: 'CR 11/8/2020 00:40:28'!
collectReachableEntriesAndSaveIn: entriesReachableByPortfoliosWhereIncluded
! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'BT 11/5/2020 21:14:03'!
register: aTransactionToRegister

	transactions add: aTransactionToRegister.
! !


!ReceptiveAccount methodsFor: 'accessing' stamp: 'CR 11/5/2020 18:47:16'!
balance

	^ self calculateTotalBalanceFromTransactions.! !

!ReceptiveAccount methodsFor: 'accessing' stamp: 'CR 11/5/2020 18:51:17'!
hasRegistered: aTransactionToCheckIfRegistered

	^ transactions includes: aTransactionToCheckIfRegistered. 
! !

!ReceptiveAccount methodsFor: 'accessing' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'adding to portfolio' stamp: 'CR 11/7/2020 23:28:28'!
addIfPossibleToPortfolioEntries: aPortfolioToBeAddedTo

	aPortfolioToBeAddedTo addToPorfolio: self.! !
