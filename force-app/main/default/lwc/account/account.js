import { LightningElement, api } from 'lwc';

export default class Account extends LightningElement {
    @api account;
    @api selectedid;

    accountClick() {
        const event = new CustomEvent('selected', {
            detail: this.account.Id
        });

        this.dispatchEvent(event);
    }

    @api
    get selectedCSS(){
        if(this.selectedid == this.account.Id){
            return "slds-box slds-theme_shade slds-theme_alert-texture";
       }
    }

}