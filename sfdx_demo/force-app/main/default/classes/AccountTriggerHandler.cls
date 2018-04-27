public class AccountTriggerHandler {
    private final static String BIG_CUSTOMER_RT = 'Big_Customer';


    public void onBeforeInsert(List<Account> newAccounts){
        setBigCustomerRTToMarkedAccounts(newAccounts);
    }

    public void onBeforeUpdate(List<Account> newAccounts, List<Account> oldAccounts){
        setBigCustomerRTToMarkedAccounts(newAccounts);
    }

    public void setBigCustomerRTToMarkedAccounts(List<Account> newAccounts){
        RecordType bigCustomerRT = [
            SELECT Id
            FROM RecordType
            WHERE DeveloperName = :BIG_CUSTOMER_RT AND SobjectType = 'Account'
        ];

        for(Account acc : newAccounts){
            if(acc.IsBigCustomer__c){
                acc.RecordTypeId = bigCustomerRT.Id;
            }
        }
    } 
}