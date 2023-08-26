abstract class Account{
    int accountNumber;
   double balance ;
   Account(this.accountNumber, this.balance);
   ///deposit (double amount)
   deposit(double amount){
    balance+=amount;
    print("Deposited: ${amount.toStringAsFixed(2)} TK");
    print("New blance ${balance.toStringAsFixed(2)} TK");
   }

   ///withdraw (double amount)
}

class SavingAccount extends Account{
  double interestRate;
  SavingAccount( int accountNumber, double balance, this.interestRate) : super(accountNumber, balance);
  @override
  void withdraw(double amount){
    if(balance>=amount){
      balance -=amount;
      balance +=balance*interestRate;
      print("Withdrawn: ${amount.toStringAsFixed(2)} TK");
      print("New balance ${balance.toStringAsFixed(2)} TK");
    }
    else{
      print("Insufficient funds. Can't withdraw ${amount.toStringAsFixed(2)} TK");
    }
  }
}

class CurrentAccount extends Account{

   double overdarftLimit;
   CurrentAccount(int accountNumber, double balance, this.overdarftLimit) : super(accountNumber, balance);
   @override
   void withdraw(double amount){
    if(balance + overdarftLimit>=amount){
      balance-=amount;
      print("Withdrawn:${amount.toStringAsFixed(2)} TK");
      print("New balance: ${balance.toStringAsFixed(2)} Tk");
    }
    else{
      print("Insufficient funds, Can't withdraw ${amount.toStringAsFixed(2)} TK");
    }
   }
}

void main(){
  SavingAccount savingAccount =SavingAccount(998877665544, 8000.0,3.0);
  savingAccount.deposit(12000.0);
  savingAccount.withdraw(20000.1);
  savingAccount.deposit(12000.0);
  print('');
  CurrentAccount currentAccount=CurrentAccount(1122-3344, 25000.0, 5000.0);
  currentAccount.deposit(4000);
  currentAccount.withdraw(6000);
 

}
