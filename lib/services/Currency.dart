import 'package:bitcoin_ticker/services/Network.dart';

class Currency {
  Future<String> getRate(String currency) async {
    Network httpRequest = Network();
    var data = await httpRequest.getCurrencyData(currency);
    return data['rate']?.toStringAsFixed(2);
  }
}
