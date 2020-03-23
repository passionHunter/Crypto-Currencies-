import 'package:cryptocurrency/dependency_Injection.dart';
import 'package:cryptocurrency/screens/Home.dart';
import 'package:flutter/material.dart';

void main() async {
  Injector.configure(Flavor.MOCK);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(primarySwatch: Colors.amber),
      home: new Home(),
    );
  }
}
