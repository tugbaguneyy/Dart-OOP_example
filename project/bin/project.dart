import 'package:project/project.dart' as project;
import 'package:project/bank.dart';
import 'dart:io';

void main() {
  var customerAccount=Bank('Joey Hey', '123456789', 120000, 'DartBank');
  while(true){
     print('\nBanka İşlemleri:');
    print('1. Hesap Bilgilerini Görüntüle');
    print('2. Para Yatırma');
    print('3. Para Çekme');
    print('4. Para Transferi');
    print('5. Çıkış');

    stdout.write('Lütfen bir seçenek girin (1-5): ');
    var choice = int.tryParse(stdin.readLineSync() ?? '');

    switch (choice) {
      case 1:
        customerAccount.displayInfo();
        break;

      case 2:
        stdout.write('Yatırılacak miktarı girin: ');
        var depositAmount = double.tryParse(stdin.readLineSync() ?? '');
        if (depositAmount != null) {
          customerAccount.deposit(depositAmount);
        } else {
          print('Geçersiz miktar');
        }
        break;

      case 3:
        stdout.write('Çekilecek miktarı girin: ');
        var withdrawAmount = double.tryParse(stdin.readLineSync() ?? '');
        if (withdrawAmount != null) {
          customerAccount.withdraw(withdrawAmount);
        } else {
          print('Geçersiz miktar');
        }
        break;

      case 4:
        stdout.write('Transfer edilecek miktarı girin: ');
        var transferAmount = double.tryParse(stdin.readLineSync() ?? '');
        if (transferAmount != null) {
          stdout.write('Alıcı hesap numarasını girin: ');
          var recipientAccountNumber = stdin.readLineSync() ?? '';
          var recipientAccount = Bank('Joey Hey', recipientAccountNumber, 50000, 'DBank');
          customerAccount.transfer(recipientAccount, transferAmount);
        } else {
          print('Geçersiz miktar');
        }
        break;

      case 5:
        print('Çıkış yapılıyor...');
        exit(0);

      default:
        print('Geçersiz seçenek');
    }
  }
  }


