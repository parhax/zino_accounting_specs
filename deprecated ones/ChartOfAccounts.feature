Feature: creation of chart of accounts
In order to organize transcations in chart of Accounts
As a Financial Manager 
I want to create chart of accounts

Background: 
Given Babak is a Financial Manager 

Scenario: adding a General ledger(kol) 
Given "Amvaal" is a group with '01' system_code
And last generated GL's system_code is '0102'
When Babak enters the following GL in the "Amvaal" group
    | displaying_code | Title | Maahiat e hesaab|
    | 5   | Assets | debit |    
Then "Assets" is inserted under the "Amvaal" group 
And it gets a system_code as '0103'

Scenario: adding a Moin  
Given "Assets" is a Kol with '0103' system_code
And the last generated Moin's system_code is '01050001'
When Babak enters the following Moin in the "Assets" Kol
    | displaying_code | Title | Maahiat e hesaab| 
    | 32              | Banks | debit           |    
Then "Banks" is inserted under the "Assets" group
And it gets a system_code as '01030002'
