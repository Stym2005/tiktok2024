import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home/widget/ImgSlide/ImgSlide.dart';
import 'package:flutter_application_1/Home/widget/product3/ProductListScreen.dart';
import 'package:flutter_application_1/Home/widget/ProductRow2/ProductRow2.dart';
import 'package:flutter_application_1/appbar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(), // ใช้ AppBar ที่คุณสร้างไว้
      // ignore: prefer_const_constructors
      backgroundColor:
          Color.fromARGB(255, 255, 255, 255), // สีพื้นหลังของหน้าจอ
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImgSlide(),
              SizedBox(height: 3),
              SizedBox(height: 9),
              Product(),
              
              SizedBox(height: 15),
              ProductList(),
            ],
          ),
        ),
        // ใส่ BuyProductPage ที่คุณสร้างไว้
      ),
    );
  }
}
