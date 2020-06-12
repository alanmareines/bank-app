import 'package:banking_app/helpers/network_helper.dart';
import 'package:banking_app/helpers/qr_parsing.dart';

import 'customer_model.dart';

class TransactionModel {
  TransactionModel(
      {this.transactionsList,
      this.txId,
      this.merchantName,
      this.debtorAccountId,
      this.creditorAccountId,
      this.amount,
      this.dateTime,
      this.additionalInfo});

  DateTime dateTime;
  List transactionsList;
  String txId;
  String merchantName;
  String debtorAccountId;
  String creditorAccountId;
  double amount;
  String additionalInfo;

  Future<dynamic> getCustomerToken(String accountId, String password) async {
    NetworkHelper networkHelper = NetworkHelper();
    var token = await networkHelper.getUserToken(accountId, password);
    return token;
  }

  Future<dynamic> getCustomerTransactions(String token) async {
    NetworkHelper networkHelper = NetworkHelper();
    var transactionsListData =
        await networkHelper.getCustomerTransactions(token);
    return transactionsListData;
  }

  buildTransaction(CustomerModel customer, String qrData) {
    TransactionModel transactionInfo = QrParsing().parse(qrData);
    transactionInfo.debtorAccountId = customer.accountId;
    transactionInfo.dateTime = DateTime.now();
    return transactionInfo;
  }

  makePayment(CustomerModel customer, TransactionModel transaction) async {
    NetworkHelper networkHelper = NetworkHelper();
    networkHelper.postIntraTransaction(customer, transaction);
  }
}
