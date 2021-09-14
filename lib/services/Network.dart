import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';


class Network {
  

  Future getCurrencyData(String currency, String crypto) async {
    var Url = Uri.https('rest.coinapi.io', "/v1/exchangerate/$crypto/${currency}");
    http.Response response = await http.get(Url, headers: {
      // "X-CoinAPI-Key": dotenv.env['COINAPI_KEY'],
      "X-CoinAPI-Key": "05CE2721-C021-4369-9D07-92B0AE6735E4",

    });
    return jsonDecode(response.body);
  }
}
