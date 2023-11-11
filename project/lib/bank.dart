import 'account.dart';
import 'transaction.dart';

class Bank implements Account {
  String bankName;
  String accounHolder;
  String accountNumber;
  double balance;

  List<Transaction> transactions = [];

  Bank(this.accounHolder, this.accountNumber, this.balance, this.bankName);

  @override
  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
      transactions.add(Transaction('Deposit', amount));
      print('$amount TL $accountNumber numaralı hesabınıza yatırıldı. Yeni bakiye: $balance TL');
    } else {
      print('Geçersiz tutar');
    }
  }

  @override
  void displayInfo() {
    print('Bank: $bankName');
    print('Hesap Sahibi: $accounHolder');
    print('Hesap Numarası: $accountNumber');
    print('Bakiye: $balance TL');
  }

  @override
  void withdraw(double amount) {
    if(amount>0){
      if(amount<=balance){
        balance-=amount;
        transactions.add(Transaction('Withdrawal', amount));
        print('$amount TL çekildi. Kalan bakiye: $balance TL.');
      } else{
          print('Yetersiz bakiye.');
      }
    }
    else{
      print('Geçersiz tutar.');
    }
  }

  void transfer(Account recipient, double amount) {
    // Hesaplar arası para transferi
    if (amount > 0 && amount <= balance) {
      balance -= amount;
      recipient.deposit(amount);

      transactions.add(Transaction('Transfer to ${recipient.accountNumber}', amount));
      recipient.transactions.add(Transaction('Transfer from ${accountNumber}', amount));

      print('$amount TL transfer edildi. Kalan bakiye: $balance TL');
    } else {
      print('Geçersiz tutar veya yetersiz bakiye');
    }
  }
}
