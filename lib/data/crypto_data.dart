import 'dart:async';

class Crypto {
  String name;
  String price_usd;
  String percent_change_1h;

  //constructor
  Crypto({this.name, this.price_usd, this.percent_change_1h});
  //another constructor for mapping the api dynamically
  Crypto.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        price_usd = map['price_usd'],
        percent_change_1h = map['percent_change_1h'];
}

//abstract class works as an interface,because we want to implement
abstract class CryptoRepository {
  Future<List<Crypto>> fetchCurrencies();
}

// Class which handle exception, i.e if any error or network issues occurs it will be handled here
class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}
