trigger AccountTrigger on Account (before insert) {
    AccountTriggerHandler handler = new AccountTriggerHandler();

    if(Trigger.isBefore){
        if(Trigger.isInsert){
            handler.onBeforeInsert(Trigger.new);
        } else if (Trigger.isInsert){
            handler.onBeforeInsert(Trigger.new);
        }
    }
}