@IsTest
private class AccountTriggerTest {
    
    @IsTest
    private static void shouldUpdateAccountRTtoBigCustomer() {
        //given
        RecordType customerRT = [
            SELECT Id
            FROM RecordType
            WHERE DeveloperName = :'Customer' AND SobjectType = 'Account'
        ];
        Account acc = new Account(Name = 'Test', RecordTypeId = customerRT.Id);

        //when
        acc.IsBigCustomer__c = true;
        insert acc;

        //then
        List<Account> resutls = [SELECT RecordTypeId FROM Account WHERE Id = :acc.Id];
        RecordType bigCustomerRT = [
            SELECT Id
            FROM RecordType
            WHERE DeveloperName = :'Big_Customer' AND SobjectType = 'Account'
        ];
        System.assertEquals(bigCustomerRT.Id, resutls[0].RecordTypeId);
    }
}
