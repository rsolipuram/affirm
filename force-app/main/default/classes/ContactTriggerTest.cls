@isTest
public class ContactTriggerTest {

   @isTest
   private static void shouldSetAccountIndustryWhenNewContactIsCreated(){

    //arrange
    Account testAccount = new Account(Name ='testAccount', Industry='TestIndustry');
    insert testAccount;

    //act
    Contact contact = new Contact(AccountId = testAccount.Id, FirstName='firstName', LastName = 'lastName');
    insert contact;

    //assert
    Contact insertedContact = [select Id, Account_Industry__c from Contact where Id = :contact.Id];
    System.assertEquals(testAccount.Industry, insertedContact.Account_Industry__c, 'expect contact industry to match account industry');
   }

   @isTest
   private static void shouldSetAccountIndustryWhenContactIsUpdated(){

    //arrange
    Account testAccount = new Account(Name ='testAccount', Industry='TestIndustry');
    insert testAccount;
    Contact contact = new Contact(AccountId = testAccount.Id, FirstName='firstName', LastName = 'lastName');
    insert contact;

    //changing account industry
    testAccount.Industry = 'TestIndustry2';
    update testAccount;

    //act
    update contact;

    //assert
    Contact updatedContact = [select Id, Account_Industry__c from Contact where Id = :contact.Id];
    System.assertEquals(testAccount.Industry, updatedContact.Account_Industry__c, 'expect contact industry to match account industry');
   }
}
