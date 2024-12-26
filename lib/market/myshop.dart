import 'package:flutter/material.dart';
import 'package:flutter_application_1/appbar.dart';

class ShoptiktokPage extends StatefulWidget {
  const ShoptiktokPage({super.key});

  @override
  State<ShoptiktokPage> createState() => _ShopHomePageState();
}

class _ShopHomePageState extends State<ShoptiktokPage> {
  // Mock data for products
  final List<Map<String, String>> products = [
    {
      'image': 'https://via.placeholder.com/100',
      'title': 'ที่วางสบู่ ถาดวางสบู่ ที่วางสบู่แบบโค้ง',
      'price': '฿155.00',
      'status': 'เพิ่มแล้ว',
    },
    {
      'image': 'https://via.placeholder.com/100',
      'title': 'ชวดน้ำพกพา 600ml. ฟรีสติกเกอร์',
      'price': '฿225.00',
      'status': 'เพิ่มแล้ว',
    },
    {
      'image': 'https://via.placeholder.com/100',
      'title': 'ชั้นวางจานพลาสติก ชั้นวางอเนกประสงค์',
      'price': '฿169.00',
      'status': 'เพิ่มแล้ว',
    },
    {
      'image': 'https://via.placeholder.com/100',
      'title': 'ที่ใส่ถุงก๊อบแก๊บ ดีไซน์สวย',
      'price': '฿155.00',
      'status': 'เพิ่มแล้ว',
    },
    {
      'image': 'https://via.placeholder.com/100',
      'title': 'หมอนผ้าห่ม หมอนนุ่มนิ่ม ลายน่ารัก',
      'price': '฿249.00',
      'status': 'เพิ่มแล้ว',
    },
  ];

  // Controller for search
  // ignore: unused_field
  final TextEditingController _searchController = TextEditingController();

  // Filtered list of products
  List<Map<String, String>> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    filteredProducts = products; // Initialize with all products
  }

  void _filterProducts(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredProducts = products;
      } else {
        filteredProducts = products
            .where((product) =>
                product['title']!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          // Search Bar

          // Product List
          Expanded(
            child: ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return _buildProductItem(
                  product['image']!,
                  product['title']!,
                  product['price']!,
                  product['status']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Widget for each product item
  Widget _buildProductItem(
      String imageUrl, String title, String price, String status) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      elevation: 2,
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
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          price,
          style: const TextStyle(fontSize: 12, color: Colors.green),
        ),
        trailing: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey.shade300,
            elevation: 0,
          ),
          child: Text(
            status,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ),
      ),
    );
  }
}
