import { LightningElement, wire, track, api } from 'lwc';
import getAccounts from '@salesforce/apex/AccountAuraController.getAccounts';
import getAccountDetailsById from '@salesforce/apex/AccountAuraController.getAccountDetailsById';

export default class Accounts extends LightningElement {
    @track accounts;
    @track error;
    @api selectedAccountId;
    @api recordId;
    @api recordViewMode;

    @api accountRecord;

    @wire(getAccounts)
    wiredAccounts({ error, data }) {
        if (data) {
            this.accounts = data;
        } else if (error) {
            this.error = error;
        }
    }

    accountSelected(event){
        this.selectedAccountId = event.detail;
        let account = this.accounts.filter(account => account.Id == event.detail);
        if(account){
            account.isselected = true;
        }
    }

    viewAccountClick(event){
        this.isLoading = true;
        getAccountDetailsById({ accountId: this.selectedAccountId })
            .then(result => {
                this.accountRecord = result;
                this.isLoading = false;
            })
            .catch(error => {
                this.error = error;
                this.isLoading = false;
            });

        this.recordViewMode = true;
    }

    listAccountsClick(event){
        this.recordViewMode = false;
        this.selectedAccountId = null;
        this.recordId = null;
    }
    
}