import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;

transferToOpayWallet(
    {String amount = '',
    String country = '',
    String currency = 'NGN',
    String reason = '',
    String merchantId = '',
    String merchantName = '',
    String type = 'MERCHANT',
    String reference = "test_3fr7k3xb9"

    //
    }) async {
    var headers = {
      'MerchantId': 'merchant_id',
      'Authorization': 'Bearer signature',
      'Content-Type': 'application/json',
    };

    var data =
        '{ "amount": "", "country": "NG", "currency": "NGN", "reason": "", "receiver": { "merchantId" :"256620072116000", "name" :"Test", "type" :"MERCHANT" }, reference: "test_3fr7k3xb9" }';

    var res = await http.post(
        Uri.parse('https://cashierapi.opayweb.com/api/v3/transfer/toWallet'),
        headers: headers,
        body: data);
    if (res.statusCode != 200)
      throw Exception('http.post error: statusCode= ${res.statusCode}');
    print(res.body);
  }
}
