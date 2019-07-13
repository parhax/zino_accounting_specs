



Scenario: Assigning the tafzilGroups to Moin's tafzilLevels
Given tafzilLevels in system has been set to be 3
And we have "Bankhaaye Riali" as a Moin in system
When Bob assign the tafzilGroups to tafzilLevels of "Bankhaaye Riali" as following

|tafzilLevel|tafzilGroups|
|   "1"     | ["Banks","Peymankaran"] |
|   "2"     | []                      |
|   "3"     | ["Moshtarian","Banks","Niazmandan"]  |

Then "Bankhaaye Riali" should have defined tafzilGroups in its tafzilLevels