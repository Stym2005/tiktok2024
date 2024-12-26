import 'package:flutter/material.dart';

class OrderSummaryPage extends StatefulWidget {
  @override
  _OrderSummaryPageState createState() => _OrderSummaryPageState();
}

class _OrderSummaryPageState extends State<OrderSummaryPage> {
  int quantity = 1;
  double pricePerItem = 333.00;
  double discount = 0.0;

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = quantity * pricePerItem - discount;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('สรุปคำสั่งซื้อ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.network(
                  'https://via.placeholder.com/100',
                  width: 100,
                  height: 100,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'กาแฟซองดื่มชุดโปรโมชั่น',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text('Default'),
                      const SizedBox(height: 8),
                      Text(
                        '฿${pricePerItem.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: decreaseQuantity,
                      icon: const Icon(Icons.remove),
                    ),
                    Text('$quantity'),
                    IconButton(
                      onPressed: increaseQuantity,
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(height: 32, thickness: 1),
            const Text(
              'สรุปคำสั่งซื้อ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('ยอดรวม'),
                Text('฿${(quantity * pricePerItem).toStringAsFixed(2)}'),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('ส่วนลดจาก TikTok Shop'),
                Text('฿${discount.toStringAsFixed(2)}'),
              ],
            ),
            const Divider(height: 32, thickness: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'ทั้งหมด',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '฿${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ทั้งหมด($quantity รายการ)', // อัปเดตข้อความตาม quantity
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '฿${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle order submission
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE6005C),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // ตั้งค่าให้ไม่มีความโค้ง
                  ),
                ),
                child: const Text(
                  'ทำการสั่งซื้อ',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
