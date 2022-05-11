public with sharing class AccountAuraController {
    @AuraEnabled(Cacheable=true)
    public static List<Account> getAccounts() {
	return [SELECT Id, Name FROM Account LIMIT 5];        
    }

    @AuraEnabled(Cacheable=true)
    public static Account getAccountDetailsById(Id accountId) {
	return [SELECT Id, Name, Industry, Type, Owner.Name, Owner.SmallPhotoUrl FROM Account where Id =:accountId];        
    }
}
