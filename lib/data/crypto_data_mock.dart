import 'dart:async';
import 'package:cryptocurrency/data/crypto_data.dart';

class MockCryptoRepository implements CryptoRepository {
  @override
  Future<List<Crypto>> fetchCurrencies() {
    return new Future.value(currencies);
  }
}

var currencies = <Crypto>[
  new Crypto(name: "Bitcoin", price_usd: "800.60", percent_change_1h: "-0.7"),
  new Crypto(name: "Etherium", price_usd: "600.50", percent_change_1h: "-0.25"),
  new Crypto(name: "Ripple", price_usd: "720.30", percent_change_1h: "0.7"),
  new Crypto(
      name: "Bitcoin Cash", price_usd: "850.60", percent_change_1h: "-0.2"),
  new Crypto(name: "Bitcoin", price_usd: "800.60", percent_change_1h: "-0.7"),
  new Crypto(name: "Etherium", price_usd: "600.50", percent_change_1h: "-0.25"),
  new Crypto(name: "Ripple", price_usd: "720.30", percent_change_1h: "0.7"),
  new Crypto(
      name: "Bitcoin Cash", price_usd: "850.60", percent_change_1h: "-0.2"),
  new Crypto(name: "Bitcoin", price_usd: "800.60", percent_change_1h: "-0.7"),
  new Crypto(name: "Etherium", price_usd: "600.50", percent_change_1h: "-0.25"),
  new Crypto(name: "Ripple", price_usd: "720.30", percent_change_1h: "0.7"),
  new Crypto(
      name: "Bitcoin Cash", price_usd: "850.60", percent_change_1h: "-0.2"),
];
