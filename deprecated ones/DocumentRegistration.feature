Feature: Document Registration
In order to ...
As an Accountant
I want to register accounting documents


Background: 
Given Tom is an Accountant 
And Tom has(is) logged in.  

Scenario: related Tafzils to defined Moin in Document Registration
Given "Bankhaaye Riali" is Moin
And "Peymankaran" and "Banks" are Shenavar Tafzils Primary types
And "Peymankaran" and "Banks" defined as Moin's related Tafzil groups
When Tom selects "Bankhaaye Riali" in Moin part of Document registration form
Then Tom can only selects all Leaf elements in Tafzil tree under the "Banks" and "Peymankaran"

Scenario: Related Shenavar Tafzils Primary type with no Leaf
Given "Bankhaaye Riali" is Moin
And "Peymankaran" and "Banks" are Shenavar Tafzils Primary types
And "Peymankaran" and "Banks" defined as Moin's related Tafzil groups
And "Peymankaran" OR(AND?) "Banks" have no defined Tafzils as child
When Tom selects "Bankhaaye Riali" in Moin part of Document registration form
Then Tom sees an error which can't let him to select the "Bankhaaye Riali" as a "Moin" in document registration form

Scenario: Limited amount of Tafzils input in document registration 
Given maximum_tafzils_count_in_documents is "25"
When Tom wants to register a document with 26 Tafzils
Then he sees an error which prevent him from document registration