Feature:  TafzilGroups's Tree Creation 
In order to defining and organizing participants in transcations
As a Financial Manager 
I want to define TafzilGroups tree


Background: 
Given Bob is a Financial Manager
And Bob has(is) logged in.

Scenario: Defining a root TafzilGroup(TafzilGroup without any parent)
When Bob enters the following inputs
    |   tafzilGroup_title  | alternate_code |
    |   "Peymankaran"      | "some_chars"   |
Then System whould have a tafzilGroup with a system generated code 


Scenario: Defining a tafzilGroup as a child under another tafzilGroup
Given there is a tafzilGroup in system as following
    |   title         | system_code |
    |   "Peymankaran" | "001"       |
When Bob defines a child for "Peymankaran" by entering the following inputs:
    | tafzilGroup_title     | alternate_code |
    | "sherkathaaye irani"  | "some_chars"   |
Then System would have a tafzilGroup by title of "sherkathaaye irani" as a child of "Peymankaran" tafzilGroup 
And Bob see the generated code of "Sherkathaaye irani" as "001/1"


Scenario: Defining a shenaavarTafzil under a tafzilGroup
Given Bob has selected "Sherkathaaye irani" as a tafzilGroup
And "Sherkathaaye irani" system_code is "001/1"

When Bob define a shenaavarTafzil as a child of "Sherkathaaye irani" tafzilGroup by entering the following inputs:
    |shenaavarTafzil_title| shenaavarTafzil_type | alternate_code |
    | "Zino co"           | "Party" or "Others"  |  "some_chars"  |

Then System have "Zino co" as a shenaavarTafzil as a child of "Sherkathaaye irani" tafzilGroup
And  "Zino co" have a generated code which is independant from its parents



Scenario: restricting to add a tafzilGroup under a tafzilGroup which has shenaavarTafzil under it as a child
Given "sherkathaaye irani" tafzilGroup has any shenaavarTafzil like "Zino co" as its child(ren)
When Bob wants to define a tafzilGroup under "Sherkathaaye irani" by entering related inputs
Then System should not allow for this action because of a system related restriction


Scenario: one shenaavarTafzil with two parents
Given ""

Scenario:  code generation(@todo this to be in chart of accounts feature , another for Tafzils here)
Given Bob has set <digit> for creation of <element_of_chart> in main settings
When he attemps to define <element_of_chart>
Then he should get code with length of <digit>
Examples: 
    |   digit  |  element_of_chart  |
    |   2      |    Kol             |
    |   3      |    Moin            |
    |   2      |    Group           |
    |   5      |    tafzilGroups_roots|





# Scenario: Defining A Shenaavar Tafzil Layer 2's Element (TL2)
# Given Bob selected "Sherkathaaye irani" which is a TL1
# And wants to define "sherkate zino" as TL2 as a child of "Sherkathaaye irani" TL1 
# When Bob enters the following inputs
#     | tl2_title       | tl1_code          | tl2_code |
#     | "sherkate zino" | "001222" or "222" | "003"    |
# Then System would have a TL2 element by title of "sherkate zino" under "sherkathaaye irani" TL1
# And Bob see the generated code of this TL2 as "001222003"