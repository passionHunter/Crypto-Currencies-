import 'package:cryptocurrency/data/crypto_data.dart';
import 'package:cryptocurrency/data/crypto_data_mock.dart';
import 'package:cryptocurrency/data/crypto_data_prod.dart';

enum Flavor { MOCK, PROD }

//Dependency Injection
class Injector {
  static final Injector _singleton = new Injector._internal();
  static Flavor _flavor;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  //factory constructor
  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  CryptoRepository get cryptoRepository {
    switch (_flavor) {
      case Flavor.MOCK:
        return new MockCryptoRepository();
      default:
        return new ProdCryptoRepository();
    }
  }
}
