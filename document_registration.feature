Feature: Document Registration
In order to save the transactions in system
As an Accountant
I want to register accounting documents


Background: 
Given Tom is an Accountant 
And Tom has(is) logged in.  


Scenario: Document registration form
Given Tafzil level has been set to be 2
When Tom enters the document_date as "2019-06-01" and shomaare_atf as "123"
And Tom  inserts two transactionRows by entering the following inputs
    | Moin    | shenaavarTafzil_1 | shenaavarTafzil2 | amount  | desc | type | attachments |
    |"someMoin"    | ",,,," | ",,,,,," | "someDesc" |20000| "debit" | "attachments_list" |
    | "someMoin"    | ",,,," | ",,,,,," | "someDesc" |15000| "credit" | "attachments_list" |
Then Tom see a Document with added transactionRow 


Scenario: Restricting a user to save a Document as "Temporary" when the transactions are not Balance
When Tom inserts two transactionRow as following
    | Moin    | shenaavarTafzil_1 | shenaavarTafzil2..n | desc       |amount| type      | attachments |
    | "someMoin"    | ",,,,"    |       ",,,,,,"        | "someDesc" |20000 | "debit"   | "attachments_list" |
    | "someMoin"    | ",,,,"    |           ",,,,,,"    | "someDesc" |15000 | "credit"  | "attachments_list" |

And Tom submits the Document as "Temporary" Document
Then Tom should get an error


Scenario: Allowing a user to save a Document as "Draft" when the transactions are not Balance
When Tom inserts two transactionRow as following
    | Moin    | shenaavarTafzil_1 | shenaavarTafzil2..n | desc | debitOrCredit | attachments |
    | "someMoin"    | ",,,," | ",,,,,," | "someDesc" |20000| "debit" | "attachments_list" |
    | "someMoin"    | ",,,," | ",,,,,," | "someDesc" |15000| "credit" | "attachments_list" |

And Tom submits the transactionRow as "Draft" Document
Then Tom can see the inserted Document in its drafts

Scenario: related Tafzils to defined Moin in transactionRow
Given "Bankhaaye Riali" is Moin
And "Peymankaran" and "Banks" are tafzilGroups
And "Peymankaran" and "Banks" defined as "Bankhaaye Riali"'s related tafzilGroups
When Tom selects "Bankhaaye Riali" in Moin part of transactionRow
Then Tom can only selects all Leaf elements in Tafzil tree under the "Banks" and "Peymankaran"

Scenario: Related tafzilGroups with no Leaf
Given "Bankhaaye Riali" is Moin
And "Peymankaran" and "Banks" are tafzilGroups
And "Peymankaran" and "Banks" defined as Moin's related tafzilGroups
And "Peymankaran" OR(AND?) "Banks" have no defined Tafzils as child
When Tom selects "Bankhaaye Riali" in Moin part of transactionRow
Then Tom sees an error which can't let him to select the "Bankhaaye Riali" as a "Moin" in transactionRow

# Scenario: Limited amount of Tafzils input in transactionRow 
# Given maximum_tafzils_count_in_documents is "25"
# When Tom wants to register a transactionRow with 26 Tafzils
# Then he sees an error which prevent him from registering a transactionRow


Scenario: inputs of tafzilLevels in transactionRows should be exactly equal to defined tafzilLevels in Moin
Given <Moin> is Moin
And tafzilLevels of <Moin> are as following
|tafzilLevel|tafzilGroups|
|   "1"     | ["Banks","Peymankaran"] |
|   "2"     | []                      |
|   "3"     | ["Moshtarian","Banks","Niazmandan"]  |

When  Tom submits the <Moin> , <shenaavarTafzil1> , <shenaavarTafzil2> and <shenaavarTafzil3> in a transactionRow
Then Tom should see the <Submission_Result>
Examples:
|Moin|shenaavarTafzil1|shenaavarTafzil2|shenaavarTafzil3| Submission_Result|
|"Bankhaaye Riali" | "Zino Co"  | Null | "Haj Agha" | "Success" |
|"Bankhaaye Riali" | "Zino Co"  | "Saba" | "Haj Agha" | "Error" |
|"Bankhaaye Riali" | "Zino Co"  | Null | Null | "Error" |


Scenario: related properties(tafzils,tafzilGroups,moin,group,kol) could not be deleted when there is a  t