import 'package:flutter/material.dart';
import 'package:flutter_application_1/Profile/information/information.dart';
import 'package:flutter_application_1/appbar.dart';

class FlashSalePage extends StatefulWidget {
  const FlashSalePage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<FlashSalePage> {
  int productsSold = 0; // จำนวนสินค้าที่ขายออกไป

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        // Wrap the entire body in a SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // รายละเอียดของสินค้าและผู้ขาย
              Row(
                children: [
                  CircleAvatar(
                    radius: 24,
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
                      Text("จำนวนลูกค้า 28.1K", style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  const SizedBox(width: 150),
                  GestureDetector(
                    onTap: () {
                      print("Follow button clicked");
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE6005C),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(width: 8),
                          Text(
                            "ติดตาม",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInfoCard("103", "สินค้า"),
                  _buildInfoCard("657.5K", "ยอดขายทั้งหมด"),
                  _buildInfoCard("88%", "อัตราการตอบกลับ"),
                  _buildInfoCard("91%", "จัดส่งภายใน 48 ชม."),
                ],
              ),
              const Divider(height: 32),
              const Text(
                "สินค้า",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Divider(height: 32),
              // สินค้ารายการต่างๆ
              _buildProductItem(
                imageUrl: 'https://via.placeholder.com/150',
                title: 'Product 1',
                price: '฿299',
              ),
              _buildProductItem(
                imageUrl: 'https://via.placeholder.com/150',
                title: 'Product 2',
                price: '฿499',
              ),
              _buildProductItem(
                imageUrl: 'https://via.placeholder.com/150',
                title: 'Product 3',
                price: '฿199',
              ),

              Information(),
            ],
          ),
        ),
      ),
    );
  }

  // ฟังก์ชันการสร้างการ์ดแสดงสินค้า
  Widget _buildProductItem({
    required String imageUrl,
    required String title,
    required String price,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ListTile(
        leading: Image.network(
          imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 14),
        ),
        subtitle: Text(
          price,
          style: const TextStyle(fontSize: 12, color: Colors.green),
        ),
        trailing: ElevatedButton(
          onPressed: () {
            setState(() {
              productsSold += 1; // เพิ่มจำนวนสินค้าที่ขาย
            });
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
          child: const Text(
            'เพิ่มแล้ว',
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
