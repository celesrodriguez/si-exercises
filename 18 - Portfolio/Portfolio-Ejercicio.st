!classDefinition: #PortfolioTest category: 'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'CR 11/4/2020 23:29:01'!
test01balanceOfAnEmptyPortfolioIsZero
	| anEmptyPortfolio |
	anEmptyPortfolio := Portfolio new. 
	
	self assert: 0 = anEmptyPortfolio balance.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'CR 11/4/2020 23:47:00'!
test02registerReceptiveAccountWithNoTransactionsWorksCorrectly
	| aReceptiveAccountWithNoTransactions aPortfolio |
	aReceptiveAccountWithNoTransactions := ReceptiveAccount new.
	aPortfolio := Portfolio new. 
	aPortfolio register: aReceptiveAccountWithNoTransactions.
	self assert: aPortfolio balance = 0.
	self assert: (aPortfolio transactions) isEmpty.! !

!PortfolioTest methodsFor: 'tests' stamp: 'CR 11/5/2020 00:33:02'!
test03registerReceptiveAccountWithOnlyDepositWorksCorrectly
	| aReceptiveAccountWithTransactions aPortfolio aDeposit |
	aDeposit := Deposit for: 50.
	aReceptiveAccountWithTransactions := ReceptiveAccount new.
	aReceptiveAccountWithTransactions register: aDeposit.
	aPortfolio := Portfolio new. 
	aPortfolio register: aReceptiveAccountWithTransactions.
	self assert: 50 = aPortfolio balance.
	self assert: aPortfolio transactions size = 1.
	self assert: (aPortfolio hasRegistered: aDeposit).! !

!PortfolioTest methodsFor: 'tests' stamp: 'CR 11/5/2020 00:22:06'!
test04
	| aReceptiveAccountWithTransactions aPortfolio aDeposit |
	aDeposit := Deposit for: 50.
	aReceptiveAccountWithTransactions := ReceptiveAccount new.
	aReceptiveAccountWithTransactions register: aDeposit.
	aPortfolio := Portfolio new. 
	aPortfolio register: aReceptiveAccountWithTransactions.
	self assert: 50 = aPortfolio balance.
	self assert: aPortfolio transactions includes: aDeposit.	
	self assert: aPortfolio transactions size = 1.! !


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


!classDefinition: #Portfolio category: 'Portfolio-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'receptiveAccounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'accessing' stamp: 'CR 11/4/2020 23:55:37'!
balance
	^ receptiveAccounts sum: [:aReceptiveAccountToSum | aReceptiveAccountToSum balance] ifEmpty: [0].! !

!Portfolio methodsFor: 'accessing' stamp: 'CR 11/5/2020 00:27:49'!
hasRegistered: aTransactionToCheckIfRegistered
	^ receptiveAccounts anySatisfy: [:aReceptiveAccount | aReceptiveAccount hasRegistered: aTransactionToCheckIfRegistered].! !

!Portfolio methodsFor: 'accessing' stamp: 'CR 11/4/2020 23:54:01'!
transactions
	^ receptiveAccounts collect: [:aReceptiveAccountToAddItsTransactions | aReceptiveAccountToAddItsTransactions transactions] andFold: [:a :b | a union: b] ifEmpty: (OrderedCollection new) copy. ! !


!Portfolio methodsFor: 'transactions' stamp: 'CR 11/4/2020 23:36:17'!
register: aReceptiveAccountToBeAdded 
	receptiveAccounts add: aReceptiveAccountToBeAdded.! !


!Portfolio methodsFor: 'initialization' stamp: 'CR 11/4/2020 23:38:33'!
initialize
	receptiveAccounts := OrderedCollection new.! !


!classDefinition: #ReceptiveAccount category: 'Portfolio-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'deposits withdraws transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'CR 11/5/2020 18:50:56'!
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
