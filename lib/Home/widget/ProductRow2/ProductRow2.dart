import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/Home/widget/ProductRow2/ProductCard2.dart';

class Product extends StatelessWidget {
  const Product({Key? key, required,  }) : super(key: key);

  get name => null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // CarouselSlider for product cards
            CarouselSlider(
              options: CarouselOptions(
                height: 170,
                autoPlay: true, // ทำให้ Carousel หมุนโดยอัตโนมัติ
                aspectRatio: 16 / 9,
                viewportFraction: 0.3, // กำหนดให้แสดงสินค้า 30% ของหน้าจอ
              ),
              items: [
                // First product card
                _buildProductCard(
                  context,
                  imageUrl:
                      'https://stealplug.com.my/cdn/shop/files/POP_MART_LABUBU_THE_MONSTERS_-_Flip_With_Me_Vinyl_Plush_Doll_-_1.png',
                  originalPrice: 2000.00,
                  discountedPrice: 444.00,
                  discountPercentage: 78,
                ),
                // Second product card
                _buildProductCard(
                  context,
                  imageUrl:
                      'https://stealplug.com.my/cdn/shop/files/POP_MART_LABUBU_THE_MONSTERS_-_Flip_With_Me_Vinyl_Plush_Doll_-_1.png',
                  originalPrice: 417.00,
                  discountedPrice: 33.90,
                  discountPercentage: 92,
                ),
                // Third product card
                _buildProductCard(
                  context,
                  imageUrl:
                      'https://stealplug.com.my/cdn/shop/files/POP_MART_LABUBU_THE_MONSTERS_-_Flip_With_Me_Vinyl_Plush_Doll_-_1.png',
                  originalPrice: 359.00,
                  discountedPrice: 85.66,
                  discountPercentage: 76,
                ),
                // Fourth product card
                _buildProductCard(
                  context,
                  imageUrl:
                      'https://stealplug.com.my/cdn/shop/files/POP_MART_LABUBU_THE_MONSTERS_-_Flip_With_Me_Vinyl_Plush_Doll_-_1.png',
                  originalPrice: 86.00,
                  discountedPrice: 63.00,
                  discountPercentage: 26,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(
    BuildContext context, {
    required String imageUrl,
    required double originalPrice,
    required double discountedPrice,
    required int discountPercentage,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductCard2(
              imageUrl: imageUrl,
              originalPrice: originalPrice,
              discountedPrice: discountedPrice,
              discountPercentage: discountPercentage,
            ),
          ),
        );
      },
      child: Container(
        width: 130, // กำหนดความกว้างของแต่ละสินค้า
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
          color: Colors.white,
        ),
        child: Column(
          children: [
            Image.network(
              imageUrl,
              width: 100,
              height: 80,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Discount $discountPercentage%',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '฿$discountedPrice',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '฿$originalPrice',
                    style: const TextStyle(
                      fontSize: 14,
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
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
