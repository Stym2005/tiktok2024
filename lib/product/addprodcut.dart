import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home/widget/ProductRow2/ProductRow2.dart';
import 'package:flutter_application_1/Profile/information/information.dart';
import 'package:flutter_application_1/appbar.dart';
import 'package:flutter_application_1/Home/widget/product3/ProductActionsBar.dart';
import 'package:flutter_application_1/Home/widget/product3/ProductListScreen.dart';

class AddProductPage extends StatefulWidget {
  final String image;
  final String productName;
  final num price; // เพิ่มเครื่องหมาย ; ที่นี้
  final String discount;
  final String description;

  const AddProductPage({
    Key? key,
    required this.image,
    required this.productName,
    required this.price,
    required this.discount,
    required this.description,
  }) : super(key: key);

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductImageCarousel(), // Extracted Widget for Image Carousel
                ProductDetails(
                  price: widget.price,
                  discount: widget.discount,
                  productName: widget.productName,
                ),
              ],
            ),
          ),
          const DraggableSheet(
            productId: '',
          ), // Extracted Widget for Draggable Sheet
        ],
      ),
      bottomNavigationBar: ProductActionsBar(),
    );
  }
}

// Widget for Image Carousel
class ProductImageCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: PageView(
        children: [
          Image.network(
            'https://stealplug.com.my/cdn/shop/files/POP_MART_LABUBU_THE_MONSTERS_-_Flip_With_Me_Vinyl_Plush_Doll_-_1.png',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.error, size: 50),
          ),
          Image.network(
            'https://cdn.store-assets.com/s/716455/i/78987842.png',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.error, size: 50),
          ),
          Image.network(
            'https://cdn.store-assets.com/s/716455/i/78987843.png',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.error, size: 50),
          ),
        ],
      ),
    );
  }
}

// Widget for Product Details
class ProductDetails extends StatelessWidget {
  final num price; // ใช้ num แทน String
  final String discount;
  final String productName;

  const ProductDetails({
    Key? key,
    required this.price,
    required this.discount,
    required this.productName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display price with style
          Text(
            '\$${price.toString()}', // แสดงราคาเป็น String โดยการแปลง num เป็น String
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          Row(
            children: [
              Text(
                discount,
                style: const TextStyle(
                  fontSize: 16.0,
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'ประหยัดได้ถึง 71%',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(
            productName,
            style: const TextStyle(fontSize: 16.0),
          ),
          const Divider(),

          const SizedBox(height: 16),
          const Product(),
          const SizedBox(height: 16),
          const Text(
            "สินค้าที่คุณอาจชอบ",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 16),
          const ProductList(),
          const Information(),
        ],
      ),
    );
  }
}

// Sample TikTok Shop Page Widget

// Widget for Draggable Sheet
class DraggableSheet extends StatefulWidget {
  final String productId;

  const DraggableSheet({Key? key, required this.productId}) : super(key: key);

  @override
  State<DraggableSheet> createState() => _DraggableSheetState();
}

class _DraggableSheetState extends State<DraggableSheet> {
  void addToShowcase(String productId) {
    // Implement your logic here
    print('Product added to showcase: $productId');
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: ListView(
            controller: scrollController,
            children: [
              Image.asset(
                'assets/icons/image-Photoroom (2).png',
                width: 10,
                height: 10,
              ),
              const Text(
                'ข้อมูลโปรโมชั่น',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text(
                  '✨ เพิ่มสินค้าที่น่าสนใจไปยังโชว์เคสบนโปรไฟล์ของคุณ คุณสามารถซ่อนสินค้าในตัวอย่างโชว์เคสได้ทุกเมื่อ',
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
              const Divider(height: 32.0),
              ListTile(
                leading: const Icon(Icons.percent, color: Colors.red),
                title: const Text('ลดสูงสุด 80% สำหรับสินค้าบางรายการ'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.video_collection, color: Colors.blue),
                title: const Text('สร้างวิดีโอขายสินค้า'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.search, color: Colors.grey),
                title: const Text('ค้นหาสินค้าที่คล้ายกัน'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.phone, color: Colors.orange),
                title: const Text('ติดต่อผู้ขาย'),
                onTap: () {},
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    addToShowcase(widget.productId);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    backgroundColor: const Color(0xFFE6005C),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  child: const Text('เพิ่มในโชว์เคส',
                      style: TextStyle(fontSize: 16.0)),
                ),
              ),
              // Add more ListTiles as needed
            ],
          ),
        );
      },
    );
  }
}

// Widget for Bottom Actions Bar
