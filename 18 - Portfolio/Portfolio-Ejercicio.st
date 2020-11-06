!classDefinition: #PortfolioTest category: 'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'depositOfFifty receptiveAccountWithDepositOfFifty depositOfHundred receptiveAccountWithDepositOfHundred receptiveAccountWithNoTransactions withdrawOfTwenty'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

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

!PortfolioTest methodsFor: 'tests' stamp: 'BT 11/5/2020 19:33:39'!
test02balanceOfPortfolioWithOneReceptiveAccountWorksCorrectly
	| aPortfolio |
	
	aPortfolio := Portfolio new. 
	aPortfolio register: receptiveAccountWithNoTransactions.
	self assert: aPortfolio balance = 0.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'BT 11/5/2020 19:12:11'!
test03balanceOfPortfolioWithManyReceptiveAccountWorksCorrectly
	| aDeposit aReceptiveAccountWithNoTransactions aReceptiveAccountWithTransactions aPortfolio |
	aDeposit := Deposit for: 50.
	aReceptiveAccountWithTransactions := ReceptiveAccount new.
	aReceptiveAccountWithTransactions register: aDeposit.
	
	aReceptiveAccountWithNoTransactions := ReceptiveAccount new.
	
	aPortfolio := Portfolio new. 
	aPortfolio register: aReceptiveAccountWithNoTransactions.
	aPortfolio register: aReceptiveAccountWithTransactions.
	self assert: aPortfolio balance = 50.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'BT 11/5/2020 19:31:47'!
test03balanceOfPortfolioWithManyReceptiveAccountsAndPortfoliosWorksCorrectly
	| aPortfolioWithTwoAccounts aPortfolioWithMany |
	
	aPortfolioWithTwoAccounts := Portfolio new.
	aPortfolioWithTwoAccounts register: receptiveAccountWithNoTransactions.

	aPortfolioWithTwoAccounts register: receptiveAccountWithDepositOfHundred.
	
	aPortfolioWithMany := Portfolio new. 
	aPortfolioWithMany register: receptiveAccountWithDepositOfFifty.
	aPortfolioWithMany register: aPortfolioWithTwoAccounts.
	
	self assert: aPortfolioWithMany balance = 150.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'BT 11/5/2020 19:41:08'!
test04hasRegisteredOfAnEmptyPortfolioIsFalse
	| anEmptyPortfolio |
	anEmptyPortfolio := Portfolio new. 
	
	self deny: (anEmptyPortfolio hasRegistered: depositOfFifty).
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'BT 11/5/2020 19:42:32'!
test05hasRegisteredOfPortfolioWithOneReceptiveAccountWorksCorrectly
	| aPortfolio |
	
	aPortfolio := Portfolio new. 
	aPortfolio register: receptiveAccountWithDepositOfHundred.
	self assert: (aPortfolio hasRegistered: depositOfHundred).
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'BT 11/5/2020 19:36:03'!
test06hasRegisteredOfPortfolioWithManyReceptiveAccountsAndPortfoliosWorksCorrectly
	| aPortfolioWithTwoAccounts aPortfolioWithMany |
	
	aPortfolioWithTwoAccounts := Portfolio new.
	aPortfolioWithTwoAccounts register: receptiveAccountWithNoTransactions.

	aPortfolioWithTwoAccounts register: receptiveAccountWithDepositOfHundred.
	
	aPortfolioWithMany := Portfolio new. 
	aPortfolioWithMany register: receptiveAccountWithDepositOfFifty.
	aPortfolioWithMany register: aPortfolioWithTwoAccounts.
	
	self assert: (aPortfolioWithMany hasRegistered: depositOfFifty).
	self assert: (aPortfolioWithMany hasRegistered: depositOfHundred).
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'BT 11/5/2020 19:43:43'!
test07transactionsOfAnEmptyPortfolioIsEmpty
	| anEmptyPortfolio |
	anEmptyPortfolio := Portfolio new. 
	
	self assert: anEmptyPortfolio transactions isEmpty.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'BT 11/5/2020 19:45:16'!
test08transactionsOfPortfolioWithOneReceptiveAccountWorksCorrectly
	| aPortfolio |
	
	aPortfolio := Portfolio new. 
	aPortfolio register: receptiveAccountWithDepositOfFifty.
	self assert: (aPortfolio transactions size) = 1.
	self assert: aPortfolio transactions includes: depositOfFifty.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'BT 11/5/2020 19:48:11'!
test09hasRegisteredOfPortfolioWithManyReceptiveAccountsAndPortfoliosWorksCorrectly
	| aPortfolioWithTwoAccounts aPortfolioWithMany |
	
	aPortfolioWithTwoAccounts := Portfolio new.
	aPortfolioWithTwoAccounts register: receptiveAccountWithNoTransactions.

	aPortfolioWithTwoAccounts register: receptiveAccountWithDepositOfHundred.
	
	aPortfolioWithMany := Portfolio new. 
	aPortfolioWithMany register: receptiveAccountWithDepositOfFifty.
	aPortfolioWithMany register: aPortfolioWithTwoAccounts.
	
	self assert: (aPortfolioWithMany transactions size) = 2.
	self assert: (aPortfolioWithMany transactions includes: depositOfHundred).	
	self assert: (aPortfolioWithMany transactions includes: depositOfFifty).	! !

!PortfolioTest methodsFor: 'tests' stamp: 'BT 11/5/2020 19:55:49'!
test10updatingAnAccountIncludedInPortfolioUpdatesPortfolio
	| aPortfolioWithTwoAccounts aPortfolioWithMany |
	
	aPortfolioWithTwoAccounts := Portfolio new.
	aPortfolioWithTwoAccounts register: receptiveAccountWithNoTransactions.

	aPortfolioWithTwoAccounts register: receptiveAccountWithDepositOfHundred.
	
	aPortfolioWithMany := Portfolio new. 
	aPortfolioWithMany register: receptiveAccountWithDepositOfFifty.
	aPortfolioWithMany register: aPortfolioWithTwoAccounts.
	
	receptiveAccountWithDepositOfHundred register: withdrawOfTwenty.
	
	self assert: (aPortfolioWithMany balance) = 130.
	self assert: (aPortfolioWithMany transactions includes: depositOfHundred).	
	self assert: (aPortfolioWithMany transactions includes: depositOfFifty).	
	self assert: (aPortfolioWithMany transactions includes: withdrawOfTwenty).	! !


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


!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'CR 11/4/2020 23:12:00'!
addIfItsADeposit: aSetOfDepositsToBeAddedTo
	self subclassResponsibility.! !

!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'CR 11/4/2020 23:11:56'!
addIfItsAWithdraw: aSetOfWithdrawsToBeAddedTo
	self subclassResponsibility.! !

!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'CR 11/5/2020 18:52:36'!
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

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


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

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


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


!Portfolio methodsFor: 'transactions' stamp: 'BT 11/5/2020 21:52:12'!
checkIfParentIsAnyOf: allEntriesOfPortfolioThatMightCreateLoop
	allEntriesOfPortfolioThatMightCreateLoop 
	
	
	! !

!Portfolio methodsFor: 'transactions' stamp: 'BT 11/5/2020 21:44:34'!
register: aReceptiveAccountToBeAdded

	self verifyThereIsNoPortfolioEntryLoop: (aReceptiveAccountToBeAdded allPortfolioEntries).
	portfolioEntries add: aReceptiveAccountToBeAdded.
	
	
	! !

!Portfolio methodsFor: 'transactions' stamp: 'BT 11/5/2020 21:58:57'!
signalCantAddEntryBecauseCreatesLoop
	^ self class errorCantAddBecauseCreatesLoop.! !

!Portfolio methodsFor: 'transactions' stamp: 'BT 11/5/2020 22:04:21'!
verifyThereIsNoPortfolioEntryLoop: allEntriesOfPortfolioThatMightCreateLoop

	(portfoliosWhereIncluded anySatisfy: [:aPortfolioWhereIncluded | allEntriesOfPortfolioThatMightCreateLoop includes: aPortfolioWhereIncluded]) ifTrue:[ self signalCantAddEntryBecauseCreatesLoop].
	
	portfoliosWhereIncluded do: [:aPortfolioWhereIncluded | 
		aPortfolioWhereIncluded verifyThereIsNoPortfolioEntryLoop: allEntriesOfPortfolioThatMightCreateLoop ].
	
	
	! !


!Portfolio methodsFor: 'initialization' stamp: 'BT 11/5/2020 20:12:32'!
initialize
	portfolioEntries := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error messages' stamp: 'BT 11/5/2020 21:59:39'!
errorCantAddBecauseCreatesLoop
	^ 'CantAddBecauseCreatesLoop!!'! !


!classDefinition: #ReceptiveAccount category: 'Portfolio-Ejercicio'!
PortfolioEntry subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions private' stamp: 'CR 11/4/2020 23:08:27'!
registerByAccountType: aTransactionToRegister

	aTransactionToRegister addIfItsADeposit: deposits.
	aTransactionToRegister addIfItsAWithdraw: withdraws.! !

!ReceptiveAccount methodsFor: 'transactions private' stamp: 'CR 11/4/2020 23:25:51'!
sumTotalTransactionsFrom: aSetOfTransactions

	^ aSetOfTransactions sum: [ :aTransactionToSumItsValue | aTransactionToSumItsValue value ] ifEmpty: [ 0 ].! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'BT 11/5/2020 21:14:03'!
register: aTransactionToRegister

	transactions add: aTransactionToRegister.
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'CR 11/5/2020 18:47:16'!
balance

	^ self calculateTotalBalanceFromTransactions.! !

!ReceptiveAccount methodsFor: 'balance' stamp: 'CR 11/5/2020 18:59:24'!
calculateTotalBalanceFromTransactions

	^ transactions inject: 0 into: [:totalBalance :aTransactionToCollaborateWith |
				aTransactionToCollaborateWith collaborateWithBalance: totalBalance].
	! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'CR 11/5/2020 18:51:17'!
hasRegistered: aTransactionToCheckIfRegistered

	^ transactions includes: aTransactionToCheckIfRegistered. 
! !
