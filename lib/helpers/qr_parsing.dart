import 'package:banking_app/models/transaction_model.dart';

class QrParsing {
  parse(qrData) {
    Map calculatefield(string) {
      var field = string.substring(0, 2);
      var fieldSize = string.substring(2, 4);
      var fieldData = string.substring(4, int.parse(fieldSize) + 4);
      var newString = string.substring(
          field.length + fieldSize.length + fieldData.length, string.length);

      Map fieldInfo = {
        "field": field,
        "fieldData": fieldData,
        "newString": newString
      };

      return fieldInfo;
    }

    String trimmedData = qrData.substring(28);
    TransactionModel transactionInfo = TransactionModel();
    Map accountId = calculatefield(trimmedData);
    transactionInfo.creditorAccountId = accountId["fieldData"];
    Map additionalInfo = calculatefield(accountId["newString"]);
    transactionInfo.additionalInfo = additionalInfo["fieldData"];
    Map mcc = calculatefield(additionalInfo["newString"]);
    Map currency = calculatefield(mcc["newString"]);
    switch (calculatefield(currency["newString"])["field"]) {
      case "58":
        {
          Map countryCode = calculatefield(currency["newString"]);
          Map customerName = calculatefield(countryCode["newString"]);
          transactionInfo.merchantName = customerName["fieldData"];
          Map city = calculatefield(customerName["newString"]);
          Map additionalData = calculatefield(city["newString"]);
          Map txId = calculatefield(additionalData["fieldData"]);
          transactionInfo.txId = txId["fieldData"];
        }
        break;
      default:
        {
          Map amount = calculatefield(currency["newString"]);
          transactionInfo.amount = amount["fieldData"];
          Map countryCode = calculatefield(amount["newString"]);
          Map customerName = calculatefield(countryCode["newString"]);
          Map city = calculatefield(customerName["newString"]);
          transactionInfo.merchantName = customerName["fieldData"];
          Map additionalData = calculatefield(city["newString"]);
          Map txId = calculatefield(additionalData["fieldData"]);
          transactionInfo.txId = txId["fieldData"];
        }
        break;
    }
    return transactionInfo;
  }
}
