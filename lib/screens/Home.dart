import 'dart:async';
import 'dart:convert';
import 'package:cryptocurrency/data/crypto_data.dart';
import 'package:cryptocurrency/modules/crypto_presenter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> implements CryptoListViewContract {
  CryptoListPresenter _presenter;
  bool _isLoading;
  List<Crypto> _currencies;

  final List<MaterialColor> _colors = [Colors.blue, Colors.indigo, Colors.red];

  //constructor
  _HomeState() {
    _presenter = new CryptoListPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _presenter.loadCurrencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Cryto Currencies"),
        ),
        body: _isLoading
            ? new Center(
                child: new CircularProgressIndicator(),
              )
            : new ListView.builder(
                itemCount: _currencies.length,
                itemBuilder: (BuildContext context, int index) =>
                    _getRowWithDivider(index),
              ));
  }

  Widget _getRowWithDivider(int i) {
    final Crypto currency = _currencies[i];

    var children = <Widget>[
      new Padding(
          padding: new EdgeInsets.all(10.0), child: _getListItemUI(currency)),
      new Divider(height: 5.0),
    ];

    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

  // Widget _cryptoWidget() {
  //   return new Container(
  //     child: new Column(
  //       children: <Widget>[
  //         new Flexible(
  //           child: new ListView.builder(
  //             itemCount: _currencies.length,
  //             itemBuilder: (BuildContext context, int index) {
  //               final Crypto currency = _currencies[index];
  //               final MaterialColor color = _colors[index % _colors.length];

  //               return _getListItemUI(currency, color);
  //             },
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  ListTile _getListItemUI(Crypto currency) {
    return new ListTile(
      leading: new CircleAvatar(
        // backgroundColor: color,
        child: new Text(currency.name[0]),
      ),
      title: new Text(currency.name,
          style: new TextStyle(fontWeight: FontWeight.bold)),
      subtitle: _getSubtitle(currency.price_usd, currency.percent_change_1h),
      isThreeLine: true,
    );
  }

  Widget _getSubtitle(String priceUSD, String percentageChange) {
    TextSpan priceTextWidget = new TextSpan(
        text: "\$$priceUSD\n",
        style: new TextStyle(
          color: Colors.black,
        ));

    String percentageChangeText = "1 hour:$percentageChange";
    TextSpan percentageChangeTextWidget;

    if (double.parse(percentageChange) > 0) {
      percentageChangeTextWidget = new TextSpan(
          text: percentageChangeText,
          style: new TextStyle(color: Colors.green));
    } else {
      percentageChangeTextWidget = new TextSpan(
          text: percentageChangeText, style: new TextStyle(color: Colors.red));
    }
    return new RichText(
        text: new TextSpan(
            children: [priceTextWidget, percentageChangeTextWidget]));
  }

  @override
  void onLoadCryptoComplete(List<Crypto> items) {
    setState(() {
      _currencies = items;
      _isLoading = false;
    });
  }

  @override
  void onLoadCryptoErro() {
    // TODO: implement onLoadCryptoErro
  }
}
