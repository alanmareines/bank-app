import 'package:banking_app/helpers/network_helper.dart';

class TransactionsList {
  TransactionsList({this.transactionsList});
  final List transactionsList;

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
}
