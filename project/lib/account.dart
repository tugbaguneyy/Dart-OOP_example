class Account {
  String accounHolder;
  String accountNumber;
  double balance;
  Account(this.accounHolder,this.accountNumber,this.balance);

  get transactions => null;

  void deposit(double amount){
    if(amount>0){
      balance+=amount;
      print('$amount TL yatırıldı. Yeni bakiye: $balance TL.');
    }
    else{
      print('Geçersiz tutar');
    }
  }

  void withdraw(double amount){
    if(amount>0){
      if(amount<=balance){
        balance-=amount;
        print('$amount TL çekildi. Kalan bakiye: $balance TL.');
      } else{
          print('Yetersiz bakiye.');
      }
    }
    else{
      print('Geçersiz tutar.');
    }
  }

  void displayInfo(){
    print('Hesap sahibi: $accounHolder');
    print('Hesap numarası: $accountNumber');
    print('Bakiye: $balance TL');
  }
  
}