import { LightningElement,  api,wire } from 'lwc';
import getContactsByAccountId from '@salesforce/apex/contactRelatedAccount.getContactsByAccountId';

export default class ContactsRelatedToAccount extends LightningElement {

    @api recordId;
    contacts;
    error;

    @wire(getContactsByAccountId, { accountId: '$recordId' })
    wiredContacts({ error, data }) {
        if (data) {
            this.contacts = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.contacts = undefined;
        }
    }
}