import 'package:banking_app/helpers/network_helper.dart';

class CustomerModel {
  CustomerModel(
      {this.accountId, this.name, this.address, this.email, this.phone});
  String accountId;
  String name;
  String address;
  String email;
  String phone;
  String balance;

  CustomerModel.fromJson(Map<String, dynamic> json)
      : accountId = json['account_id'],
        name = json['name'],
        address = json['address'],
        email = json['email'],
        phone = json['phone'];

  Future<dynamic> getCustomerToken(String accountId, String password) async {
    NetworkHelper networkHelper = NetworkHelper();
    var token = await networkHelper.getUserToken(accountId, password);
    return token;
  }

  Future<dynamic> getCustomerInfo(String token, String accountId) async {
    NetworkHelper networkHelper = NetworkHelper();
    var customerData = await networkHelper.getCustomerData(token, accountId);
    var customer = CustomerModel.fromJson(customerData);
    var customerBalance =
        await networkHelper.getCustomerBalance(token, accountId);
    customer.balance = customerBalance.toString();
    return customer;
  }
}
