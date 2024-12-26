import 'package:flutter/material.dart';
import 'package:flutter_application_1/product/addprodcut.dart';

class BuyProductPage extends StatefulWidget {
  @override
  _BuyProductPageState createState() => _BuyProductPageState();
}

class _BuyProductPageState extends State<BuyProductPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 5,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: const Color(0xFFE6005C),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          tabs: const [
            Tab(text: "เสื้อ"),
            Tab(text: "แฟชั่นบรุช"),
            Tab(text: "อิเล็กทรอนิกส์"),
            Tab(text: "รอรีวิว"),
            Tab(text: "การเล่นเกม"),
          ],
        ),
      ),
      body: DefaultTabController(
        length: 5,
        child: Column(
          children: [
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  buildCategoryContent("เสื้อ"),
                  buildCategoryContent("แฟชั่นบรุช"),
                  buildCategoryContent("อิเล็กทรอนิกส์"),
                  buildCategoryContent("รอรีวิว"),
                  buildCategoryContent("การเล่นเกม"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryContent(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 10,
          childAspectRatio: 0.55,
        ),
        itemCount: 8,
        itemBuilder: (context, index) {
          return ProductCard(
            image: 'https://stealplug.com.my/cdn/shop/files/POP_MART_LABUBU_THE_MONSTERS_-_Flip_With_Me_Vinyl_Plush_Doll_-_1.png',
            productName: 'สินค้า $index',
            price: 154, // ราคาเป็น num
            discount: "120", // ส่วนลดในรูปแบบ String
            description:
                'คำอธิบายสินค้า $index ที่ให้ข้อมูลเพิ่มเติมเกี่ยวกับสินค้านี้', // คำอธิบายสินค้า
          );
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String image;
  final String productName;
  final num price;
  final String discount;
  final String description;
 
  const ProductCard({
    Key? key,
    required this.image,
    required this.productName,
    required this.price,
    required this.discount,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddProductPage(
              image: image,
              productName: productName,
              price: price,
              discount: discount,
              description: description,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 8,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.network(
                image,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '฿$price',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  Text(
                    '฿$discount',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE6005C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 60), //รับเพิ่มความกว้างในแนวนอน
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'เพิ่มโชว์เคส',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
