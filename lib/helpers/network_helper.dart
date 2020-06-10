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
}
