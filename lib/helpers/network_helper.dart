import 'package:banking_app/models/customer_model.dart';
import 'package:banking_app/models/transaction_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  Future getUserToken(String accountId, String password) async {
    http.Response response = await http.post(
      'https://api.linapay.io/v1/psp/customers/sign-in',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "account_id": accountId,
        "password": password,
      }),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data)["data"]["token"];
    } else {
      return "Error";
    }
  }

  Future getCustomerData(String token, String accountId) async {
    http.Response response = await http.get(
        "https://api.linapay.io/v1/psp/customers/?account_id=$accountId",
        headers: <String, String>{
          'authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  Future getCustomerBalance(String token, String accountId) async {
    http.Response response = await http.get(
        "https://api.linapay.io/v1/psp/customers/balances?account_id=$accountId",
        headers: <String, String>{
          'authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data)['data']['amount'];
    } else {
      print(response.statusCode);
    }
  }

  Future signUpCustomer(
      String name,
      String privateId,
      String email,
      String accountId,
      String address,
      String cep,
      String phone,
      String password,
      String passwordConfirmation) async {
    http.Response response = await http.post(
      'https://api.linapay.io/v1/psp/customers',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "customer": {
          "psp_id": "1",
          "private_id": privateId,
          "account_id": accountId,
          "name": name,
          "email": email,
          "address": address,
          "postal_code": cep,
          "phone": phone,
          "password": password,
          "password_confirmation": passwordConfirmation
        },
      }),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      return "Error";
    }
  }

  Future getCustomerTransactions(String token) async {
    http.Response response = await http.get(
        "https://api.linapay.io/v1/psp/customers/transactions",
        headers: <String, String>{
          'authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data)["data"];
    } else {
      print(response.statusCode);
    }
  }

  Future postIntraTransaction(
      CustomerModel customer, TransactionModel transaction) async {
    http.Response response = await http.post(
      'https://api.linapay.io/v1/psp/customers',
      headers: <String, String>{
        'authorization': 'Bearer ${customer.token}',
      },
      body: jsonEncode({
        "intra": {
          "message_id": transaction.txId,
          "end_to_end_id": "",
          "settlement_time_request": transaction.dateTime,
          "debtor_id": "meu_banco",
          "creditor_id": "meu_banco",
          "debtor_account_id": transaction.debtorAccountId,
          "creditor_account_id": transaction.creditorAccountId,
          "purpose": transaction.additionalInfo,
          "amount": transaction.amount,
        },
      }),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      return "Error";
    }
  }
}
