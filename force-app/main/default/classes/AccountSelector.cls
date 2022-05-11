public class AccountSelector {
    public static List<Account> selectById(set<Id> accountIds){
        return [select Id, Industry from Account where Id in :accountIds];
    }
}
