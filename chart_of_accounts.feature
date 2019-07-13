Feature: creation of chart of accounts
In order to organize transcations in chart of Accounts
As a Financial Manager 
I want to create chart of accounts


Background: 
Given Bob is a Financial Manager
And Bob has(is) logged in.


Scenario: creation of a root accountType
When  Bob enters the following info
 |  account_type_title  |   can_have_child  | child_coding_numbers | account
 | "Assets"             |   "True"          |   "3"                |

Then accountType inserts with a SUCCESS message
And "Assets" accountType have a TWO numbers generated system_code 

Scenario: creation of accountType under another accountType
Given Bob have been selected "Assets" accountType
And "Assets" can_have_child is "TRUE"
And "Assets" child_coding_numbers has been set to "3"
When Bob enters the following info
 | account_type_title | can_have_child | child_coding_numbers |
 | "Banks"            | "No"           |    Null              |
Then accountType iserts with a SUCCESS message
And "Banks" accountType have a "3" numbers generated system_code

Scenario: creation of account types under account type which is not defined to have children
Given Bob have been selected "Assets" accountType
And "Assets" can_have_child is "False"
When Bob enters the following info
 | account_type_title | can_have_child | child_coding_numbers |
 | "Banks"            | "No"           |    Null              |
Then accountType would not isert with a ERROR message