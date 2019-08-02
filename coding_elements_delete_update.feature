Feature: deleting or updating chart of accounts
In order to organize transcations in chart of Accounts
As a Financial Manager 
I want to delete or update elements of chart of accounts


Background: 
Given Bob is a Financial Manager
And Bob has(is) logged in.


Scenario: deleting an element of chart of account which has logged transaction
Given "Assets" is an accountType 
And there is a registered transaction in the system which has a accountDetail
When  Bob wants to delete the "Assets" 
Then "Assets" remains in the system
And he see an ERROR message 



Scenario: deleting an accountType which has children
Given "Assets" is an accountType
And "Assets" has 2 accountType as its children
And children has no related registered transaction in the system
When Bob wants to delete the "Assets"
Then "Assets" will get deleted
And two children accountType wil get deleted 

Scenario: updating an accountType
Given "Amvaal" is an accountType
When Bob inserts "Assets" to update the title of "Amvaal"
Then he see a SUCCESS message 
And "Assets" accountType would be in the system wherever the "Amvaal" wants

