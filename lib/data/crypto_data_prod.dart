import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cryptocurrency/data/crypto_data.dart';

class ProdCryptoRepository implements CryptoRepository {
  //since the URL is not going to change every time it's given here
  String cryptoUrl = "https://api.coinmarketcap.com/v1/ticket?limit=50";

  @override
  Future<List<Crypto>> fetchCurrencies() async {
    http.Response response = await http.get(cryptoUrl);
    final List responseBody = jsonDecode(response.body);
    final statusCode = response.statusCode;
    if (statusCode != 200 || responseBody == null) {
      throw new FetchDataException(
          "An Error has Ocurred :[status Code : $statusCode]");
    }
    return responseBody.map((c) => new Crypto.fromMap(c)).toList();
  }
}
