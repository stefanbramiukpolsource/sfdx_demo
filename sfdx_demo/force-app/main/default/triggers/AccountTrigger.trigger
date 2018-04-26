trigger AccountTrigger on Account (before insert) {
    AccountTriggerHandler handler = new AccountTriggerHandler();

    if(Trigger.isBefore && Trigger.isInsert){
        handler.onBeforeInsert(Trigger.new);
    }
}