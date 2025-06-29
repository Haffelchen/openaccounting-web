import { Pipe, PipeTransform } from '@angular/core';
import { Account } from './account';

@Pipe({name: 'debitCredit'})
export class DebitCreditPipe implements PipeTransform {
  debitNames: any;
  creditNames: any;


  constructor() {
    this.debitNames = {
      'Vermögenswerte': 'Deposit',
      'Verbindlichkeiten': 'Payment',
      'Eigenkapital': 'Decrease',
      'Erträge': 'Deduction',
      'Aufwendungen': 'Expense'
    };

    this.creditNames = {
      'Vermögenswerte': 'Withdrawal',
      'Verbindlichkeiten': 'Charge',
      'Eigenkapital': 'Increase',
      'Erträge': 'Erträge',
      'Aufwendungen': 'Refund'
    };
  }

  transform(account: Account, type: string): string {
    if(!account) {
      return type === 'credit' ? 'Credit' : 'Debit';
    }

    let parent = account.fullName.split(':')[0];
    if(type === 'credit') {
      return this.creditNames[parent];
    } else {
      return this.debitNames[parent];
    }
  }
}