public class ContactTriggerHandler {
    public static void setAccountIndustry(List<Contact> contacts){
       Set<Id> accountIds = getContactAccountIds(contacts);
       List<Account> accounts = AccountSelector.selectById(accountIds);
       Map<Id, Account> accountById = new Map<Id, Account>(accounts);
       for(Contact contact : contacts){
           if(contact.AccountId !=null && accountById.containsKey(contact.AccountId)){
             contact.Account_Industry__c = accountById.get(contact.AccountId).Industry;
           } 
       }
    }

    private static Set<Id> getContactAccountIds(List<Contact> contacts){
        Set<Id> contactAccountIds = new Set<Id>();
        for(Contact contact : contacts){
            if(contact.AccountId != null){
                contactAccountIds.add(contact.AccountId);
            }
        }
        return contactAccountIds;
    }
}
