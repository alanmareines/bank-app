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
  var amount;
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

  makePayment(CustomerModel customer) async {
    NetworkHelper networkHelper = NetworkHelper();
    await networkHelper.postInterTransaction(customer, this);
  }

  generateQr(CustomerModel customer, String qrData) async {
    // when generating QR, QR data is amount passed by user.
    NetworkHelper networkHelper = NetworkHelper();
    var qrString = await networkHelper.getQrString(customer, qrData);
    return qrString["qr_code"];
    // return "00020126580014br.gov.bcb.pix0136123e4567-e12b-12d1-a456-4266554400005204000053039865802BR5913Fulano de Tal6008BRASILIA62070503***63041D3D";
  }
}
