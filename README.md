# Overview

This repo contains answers to the questionnaire related to js, css, database and excerises related building trigger and lwc component

## Contact Trigger

The implimentation of contact trigger follows the convention of using a trigger handler where trigger handler hosts the logic instead of the trigger. a very simplistic view of trigger handler is taken because of time constraints.

### Code Artifacts
- ContactTrigger - captures before insert, before update of a contact and calls the ContactTriggerHandler to set the industry
- ContactTriggerHandler - provides a setAccountIndustry method that sets the Account_Industry__c on the contact. The handler makes use of Account selector to get the Account Industry related to accountId on the contact. The code is bulkfied so it could work on batch of records and uses limited queries. The logic iterates through contacts, identifies accountIds in context, queryies account's Industry and sets them on the contact
- AccountSelector - Selector has been created to centralize all query methods in one place for ease of maintainance and code reusability


## Accout List / view LWC
The lwc component embedded in a visualforce page provides mechanism to view list of accounts and view details

### Code Artifacts
- LWCDemo - visualforce page that embeds the accounts lwc component
- accountapp - lightningout app
- accounts - host lwc component that contains listing and navigation methods to navigate to view account details or back to listing 
- account - lwc component provides mini detail of account 
- accountDetails - lwc component provides detail of account 

