Scenario:when a saved draft get balanced then it will be a temporary
Given There is a draft document in system with following transactionRows
    | Moin    | shenaavarTafzil_1 | shenaavarTafzil2..n | desc | debitOrCredit | attachments |
    | "someMoin"    | ",,,," | ",,,,,," | "someDesc" |20000| "debit" | "attachments_list" |
    | "someMoin"    | ",,,," | ",,,,,," | "someDesc" |15000| "credit" | "attachments_list" |

Scenario: registered temporary document transits to draft document when gets unbalanced
    ||

Scenario: temporary state transition(all full paths even to permanent which is not allowed instantly)
Scenario: 'verified' state transitions
Scenario: 'permanent' state transitions
Scenario: editing validation in different states with scenario outlines
    