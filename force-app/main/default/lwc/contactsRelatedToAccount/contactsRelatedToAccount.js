import { LightningElement, api, wire } from 'lwc';
import getContactsByAccountId from '@salesforce/apex/contactRelatedAccount.getContactsByAccountId';

const column = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Email', fieldName: 'Email', type: 'email' },
    { label: 'Phone', fieldName: 'Phone', type: 'phone' },
];

export default class AccountContacts extends LightningElement {
    @api recordId; 
    columns = column;

    @wire(getContactsByAccountId, { accountId: '$recordId' })
    contacts;
}