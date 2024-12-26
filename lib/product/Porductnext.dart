import 'package:flutter/material.dart';
import 'package:flutter_application_1/appbar.dart';
import 'package:flutter_application_1/product/BuyProductPage.dart';

class Porductnext extends StatefulWidget {
  const Porductnext({Key? key}) : super(key: key);

  @override
  State<Porductnext> createState() => _NextState();
}

class _NextState extends State<Porductnext> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: BuyProductPage(),
    );
  }
}
