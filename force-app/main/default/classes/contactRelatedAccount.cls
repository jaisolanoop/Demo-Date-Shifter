public with sharing class contactRelatedAccount {
 @AuraEnabled(cacheable=true)
    public static List<Contact> getContactsByAccountId(Id accountId) {
        if (accountId == null) {
            return new List<Contact>();
        }
        
        return [SELECT Id, Name, Email, Phone FROM Contact WHERE AccountId = :accountId];
    }
}