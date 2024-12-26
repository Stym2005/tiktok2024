import 'package:flutter/material.dart';
import 'package:flutter_application_1/appbar.dart';
import 'package:flutter_application_1/bottonbar.dart';
import 'package:flutter_application_1/market/FlashSalePage.dart';
import 'package:flutter_application_1/market/commission.dart';
import 'package:flutter_application_1/market/myshop.dart';

class ShopHomePage extends StatefulWidget {
  const ShopHomePage({super.key});

  @override
  State<ShopHomePage> createState() => _ShopHomePageState();
}

class _ShopHomePageState extends State<ShopHomePage> { 
  int revenue = 0;
  int productsSold = 0;
  int customers = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Section 1: ข้อมูลสถิติ
            _buildStatisticsSection(),

            // Section 2: ปุ่มจัดการร้าน
            _buildManageButtons(),
            const Divider(),

            const SizedBox(height: 10),

            // Section 3: รายการสินค้า
            _buildSectionTitle('ร้านของคุณ'),
            _buildProductItem(
              imageUrl:
                  'https://stealplug.com.my/cdn/shop/files/POP_MART_LABUBU_THE_MONSTERS_-_Flip_With_Me_Vinyl_Plush_Doll_-_1.png',
              title: 'ชั้นวางจานพลาสติก ชั้นวางของอเนกประสงค์',
              price: '฿225.00',
            ),
            _buildProductItem(
              imageUrl:
                  'https://stealplug.com.my/cdn/shop/files/POP_MART_LABUBU_THE_MONSTERS_-_Flip_With_Me_Vinyl_Plush_Doll_-_1.png',
              title: 'ที่ใส่ถุงก๊อบแก๊บ แขวนได้ ดีไซน์สวย',
              price: '฿169.00',
            ),
          ],
        ),
      ),
    );
  }

  // Function to build statistics item
  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }

  // Section 1: ข้อมูลสถิติ
  Widget _buildStatisticsSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatItem('รายได้ (\u0E3F)', revenue.toString()),
          _buildStatItem('สินค้าที่จำหน่ายแล้ว', productsSold.toString()),
          _buildStatItem('ลูกค้า', customers.toString()),
        ],
      ),
    );
  }

  // Section 2: ปุ่มจัดการร้าน
  Widget _buildManageButtons() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "เครื่องมือ", // This should be your title for the section
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 10),
          GridView.count(
            crossAxisCount: 2, // Set the number of columns
            shrinkWrap: true, // Makes the GridView fit its content size
            physics: const NeverScrollableScrollPhysics(), // Disable scrolling
            childAspectRatio:
                3.5, // Controls the aspect ratio of each grid item
            children: [
              _buildManageButton(
                'เพิ่มสินค้าของตัวแทน',
                'assets/icons/tiktokkkk.png',
                () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BottomBar(initialIndex: 1),
                    ),
                    (route) => false,
                  );
                },
              ),
              _buildManageButton(
                'Manage products',
                'assets/icons/image-Photoroom (3).png',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShoptiktokPage()),
                  );
                  // Add your action for this button
                },
              ),
              _buildManageButton(
                'คำนายหน้า',
                'assets/icons/image-Photoroom (3).png',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CommissionScreen()),
                  );
                },
              ),
              _buildManageButton(
                'ร้านของคุณ',
                'assets/icons/product.png',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  FlashSalePage()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildManageButton(
    String title,
    String iconPath,
    VoidCallback onTap,
  ) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.pink.shade400, Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(3),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  iconPath,
                  width: 28,
                  height: 28,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to build a product item
  Widget _buildProductItem({
    required String imageUrl,
    required String title,
    required String price,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
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
              productsSold += 1; // Dummy action: increase products sold
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

  // Section Title
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
