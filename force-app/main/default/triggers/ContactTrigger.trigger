trigger ContactTrigger on Contact (before insert, before update) {
    if((Trigger.isBefore && Trigger.isInsert) || (Trigger.isBefore && Trigger.isUpdate)){
        ContactTriggerHandler.setAccountIndustry(Trigger.new);
    }
}