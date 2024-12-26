import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home/widget/product3/OrderSummaryPage.dart';
import 'package:flutter_application_1/Home/widget/product3/ProductListScreen.dart';
import 'package:flutter_application_1/market/FlashSalePage.dart';

class TikTokCart extends StatefulWidget {
  @override
  _TikTokCartState createState() => _TikTokCartState();
}

class _TikTokCartState extends State<TikTokCart> {
  bool isSelected = true;
  double quantity = 1;
  double price = 333.00;
  double originalPrice = 399.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('รถเข็นสินค้า'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FlashSalePage()),
                );
              },
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.grey.shade300,
                    child: const ImageIcon(
                      AssetImage('assets/icons/product.png'),
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "nanaพลาซ่า",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "จำนวนลูกค้า 28.1K",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            const Divider(),
            Row(
              children: [
                Checkbox(
                  value: isSelected,
                  onChanged: (value) {
                    setState(() {
                      isSelected = value!;
                    });
                  },
                  activeColor: Color(0xFFE6005C), // เปลี่ยนสีของเครื่องหมายถูก
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        50), // ทำให้เครื่องหมายถูกเป็นวงมน
                  ),
                ),
                Image.network(
                  'https://stealplug.com.my/cdn/shop/files/POP_MART_LABUBU_THE_MONSTERS_-_Flip_With_Me_Vinyl_Plush_Doll_-_1.png', // Replace with actual image URL
                  height: 80,
                  width: 80,
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'กาแฟซองดื่มชุดโปรโม\nชั่น6กล่อง(60)F6',
                        maxLines: 2,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text(
                      '฿$price',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '฿$originalPrice',
                      style: const TextStyle(
                        fontSize: 12,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (quantity > 1) quantity--;
                            });
                          },
                          icon: const Icon(Icons.remove),
                        ),
                        Text('$quantity'),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const Divider(),
            const SizedBox(
              height: 25,
            ),
            const Align(
              alignment: Alignment.centerLeft, // จัดตำแหน่งไปที่ขวา
              child: Text(
                "คุณอาจชอบ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold, // ทำให้ตัวหนังสือหนาขึ้น
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const ProductList(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              // เปลี่ยนสี Checkbox และทำให้เป็นวงมน
              Transform.scale(
                scale: 1.2, // ปรับขนาดของ Checkbox
                child: Checkbox(
                  value: isSelected,
                  onChanged: (value) {
                    setState(() {
                      isSelected = value!;
                    });
                  },
                  activeColor: Color(0xFFE6005C), // เปลี่ยนสีเป็นสีที่ต้องการ
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50), // ทำให้เป็นวงมน
                  ),
                ),
              ),
              const Text('เลือกทั้งหมด'),
              const Spacer(),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('฿${price * quantity}'),
                ],
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderSummaryPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  minimumSize: const Size(120, 48),
                ),
                child: Text(
                  'ชำระเงิน ($quantity)',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
