import 'package:flutter/material.dart';
import 'package:flutter_application_1/bottonbar.dart';
import 'package:flutter_application_1/market/FlashSalePage.dart';
import 'package:flutter_application_1/Home/widget/product3/TikTokShopChat.dart';
import 'package:flutter_application_1/Home/widget/product3/buynow.dart';

class ProductActionsBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // ปุ่มไอคอน "ร้านค้า"
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FlashSalePage(),
                        ),
                      ).then((_) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                BottomBar(), // ระบุหน้า Home โดยตรง
                          ),
                          (route) => false, // ลบ stack ทั้งหมด
                        );
                      });
                    },
                    child: const Column(
                      children: [
                        Image(
                          image: AssetImage('assets/icons/product.png'),
                          height: 20,
                          width: 20,
                        ),
                        SizedBox(height: 4),
                        Text(
                          "ร้านค้า",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // ปุ่มไอคอน "แชท"
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          TikTokShopChat(), // ตรวจสอบว่า TikTokShopChat เป็น Widget ที่สร้างไว้
                    ),
                  );
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image(
                      image: AssetImage('assets/icons/chaticon.png'),
                      height: 20,
                      width: 20,
                    ),
                    SizedBox(height: 4),
                    Text(
                      "แชท",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),

            // ปุ่ม "เพิ่มลงรถเข็น"

            // ปุ่ม "เพิ่มลงรถเข็น"
            Expanded(
              flex: 3,
              child: Container(
                height: 40,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 200, 199, 199), // Add background color here
                    side: BorderSide(color: Colors.grey.shade300, width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "เพิ่มลงรถเข็น",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),

            // ปุ่ม "ซื้อตอนนี้"
            Expanded(
              flex: 4,
              child: Container(
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    buy(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "ซื้อตอนนี้",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
