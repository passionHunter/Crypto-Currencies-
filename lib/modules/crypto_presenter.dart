import 'package:cryptocurrency/data/crypto_data.dart';
import 'package:cryptocurrency/dependency_Injection.dart';

abstract class CryptoListViewContract {
  //when downloading data is done successfully this crypto_data will be executed
  void onLoadCryptoComplete(List<Crypto> items);

  //If we face error while fetching the data then this will be executed
  void onLoadCryptoErro();
}

class CryptoListPresenter {
  CryptoListViewContract _view;
  CryptoRepository _repository;

//this is for the singleton class so only one (_repository) can be created
  CryptoListPresenter(this._view) {
    _repository = new Injector().cryptoRepository;
  }

  void loadCurrencies() {
    //fetch the currencies
    _repository
        .fetchCurrencies()
        .then((c) => _view.onLoadCryptoComplete(c))
        .catchError((onError) => _view.onLoadCryptoErro());
  }
}
