import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home/widget/ProductRow2/ProductRow2.dart';
import 'package:flutter_application_1/Profile/information/information.dart';
import 'package:flutter_application_1/appbar.dart';
import 'package:flutter_application_1/Home/widget/product3/ProductActionsBar.dart';
import 'package:flutter_application_1/Home/widget/product3/ProductListScreen.dart';

class ProductCard2 extends StatefulWidget {
  final String imageUrl;
  final double originalPrice;
  final double discountedPrice;
  final int discountPercentage;

  const ProductCard2({
    Key? key,
    required this.imageUrl,
    required this.originalPrice,
    required this.discountedPrice,
    required this.discountPercentage,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProductCard2State createState() => _ProductCard2State();
}

class _ProductCard2State extends State<ProductCard2> {
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
                // Image Carousel
                ProductImageCarousel(imageUrl: widget.imageUrl),
                // Product Details
                ProductDetails(
                  price: widget.discountedPrice,
                  discount: widget.discountPercentage,
                  productName: "Product Name",
                ),
              ],
            ),
          ),
          // Draggable Sheet
          DraggableSheet(),
        ],
      ),
      bottomNavigationBar: ProductActionsBar(),
    );
  }
}

// Widget for Image Carousel
class ProductImageCarousel extends StatelessWidget {
  final String imageUrl;

  const ProductImageCarousel({Key? key, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: PageView(
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.error, size: 50),
          ),
          Image.network(
            'https://via.placeholder.com/300x200?text=Product+1',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.error, size: 50),
          ),
          Image.network(
            'https://via.placeholder.com/300x200?text=Product+2',
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
  final double price;
  final int discount;
  final String productName;

  const ProductDetails({
    Key? key,
    required this.price,
    required this.discount,
    required this.productName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double originalPrice = price / (1 - discount / 100);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Price
          Text(
            '฿${price.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color:  Color(0xFFE6005C),
            ),
          ),
          Row(
            children: [
              Text(
                '฿${originalPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 16.0,
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'ประหยัดได้ถึง $discount%',
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          // Product Name
          Text(
            productName,
            style: const TextStyle(fontSize: 16.0),
          ),
          const Divider(),
          const SizedBox(height: 16),
          const Product(),
          const SizedBox(height: 16),
          const ProductList(),
          const Information(),
        ],
      ),
    );
  }
}

// Draggable Sheet
class DraggableSheet extends StatefulWidget {
  const DraggableSheet({super.key});

  @override
  State<DraggableSheet> createState() => _DraggableSheetState();
}

class _DraggableSheetState extends State<DraggableSheet> {
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
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                      backgroundColor: const Color(0xFFE6005C),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: const Text('เพิ่มในโชว์เคส',
                        style: TextStyle(fontSize: 16.0)),
                  ),
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
