import 'package:bitcoin_ticker/services/Network.dart';

class Currency {
  Future<String> getRate(String currency, String crypto) async {
    Network httpRequest = Network();
    var data = await httpRequest.getCurrencyData(currency,crypto);
    return data['rate']?.toStringAsFixed(2);
  }
}
