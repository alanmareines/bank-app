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
      'https://api.linapay.io/v1/psp/customers/intra-transfers',
      headers: <String, String>{
        'authorization': 'Bearer ${customer.token}',
      },
      body: jsonEncode({
        "intra": {
          "message_id": transaction.txId,
          "end_to_end_id": "",
          "settlement_time_request": transaction.dateTime.toString(),
          "debtor_id": "meu_banco",
          "creditor_id": "hooli",
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

  Future getQrString(CustomerModel customer, String amount) async {
    http.Response response = await http.post(
      'https://mighty-chamber-20498.herokuapp.com/api/v1/qr-code',
      //TODO qr endpoint
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "merchant_city": "Sao Paulo",
        "merchant_name": customer.name,
        "account_id": customer.accountId,
        "amount": amount,
        "additional_info": 'linaqr',
      }),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      return "Error";
    }
  }

  Future getPspToken() async {
    http.Response response = await http.post(
      'https://api.linapay.io/v1/psps/users/sign-in',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": "alanmareines@gmail.com",
        "api_key": "0a972f95-2230-46dc-b6fa-9af716d956b5",
      }),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data)["data"]["token"];
    } else {
      return "Error";
    }
  }

  Future postInterTransaction(TransactionModel transaction) async {
    String token = await getPspToken();
    http.Response response = await http.post(
      'https://api.linapay.io/v1/transfers/sending',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "sending": {
          "message_id": transaction.txId,
          "instructed_agent_id": "instructed_agent_id-0001",
          "instructing_agent_id": "instructing_agent_id-0001",
          "end_to_end_id": "",
          "settlement_time_request": "2019-09-20T20:00:00Z",
          "intermediary_agent_1_id": "intermediary_agent_1_id-0001",
          "intermediary_agent_2_id": "intermediary_agent_2_id-0001",
          "initiating_party_id": "initiating_party_id_22222222222",
          "debtor_id": "debtor_id-0001",
          "creditor_id": "creditor_id-0001",
          "debtor_agent_id": "meu_banco",
          "creditor_agent_id": "hooli",
          "creditor_account_id": transaction.creditorAccountId,
          "creditor_account_issr": "",
          "creditor_account_proxy_id": transaction.creditorAccountId,
          "debtor_account_id": transaction.debtorAccountId,
          "debtor_account_issr": "",
          "debtor_account_proxy_id": transaction.debtorAccountId,
          "purpose": transaction.additionalInfo,
          "amount": transaction.amount
        }
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
