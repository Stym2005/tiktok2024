import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home/widget/product3/prodcutcart3.dart';
import 'package:intl/intl.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<Map<String, dynamic>> sampleProducts = [
    {
      "imageUrl":
          "https://static.nike.com/a/images/w_1280,q_auto,f_auto/06569bd0-a651-44f5-ad73-9f00d3e33e7b/air-jordan-1-chicago-dz5485-612-release-date.jpg",
      "title": "ลำโพง Jmax",
      "price": "144.00",
      "discount": 85,
      "description":
          "A premium speaker with excellent sound quality and long battery life.",
    },
    {
      "imageUrl":
          "https://static.nike.com/a/images/w_1280,q_auto,f_auto/06569bd0-a651-44f5-ad73-9f00d3e33e7b/air-jordan-1-chicago-dz5485-612-release-date.jpg",
      "title": "โต๊ะพับ Camping",
      "price": "99.00",
      "discount": 67,
      "description":
          "A lightweight folding table perfect for camping and outdoor activities.",
    },
    {
      "imageUrl":
          "https://static.nike.com/a/images/w_1280,q_auto,f_auto/06569bd0-a651-44f5-ad73-9f00d3e33e7b/air-jordan-1-chicago-dz5485-612-release-date.jpg",
      "title": "สว่านไฟฟ้า 120W",
      "price": "1,219.00",
      "discount": 87,
      "description":
          "A powerful drill ideal for DIY and home improvement projects.",
    },
    {
      "imageUrl":
          "https://static.nike.com/a/images/w_1280,q_auto,f_auto/06569bd0-a651-44f5-ad73-9f00d3e33e7b/air-jordan-1-chicago-dz5485-612-release-date.jpg",
      "title": "ชุดเครื่องมือช่าง",
      "price": "27.00",
      "discount": 70,
      "description":
          "A comprehensive toolkit for home repairs and basic maintenance.",
    },
    {
      "imageUrl":
          "https://static.nike.com/a/images/w_1280,q_auto,f_auto/06569bd0-a651-44f5-ad73-9f00d3e33e7b/air-jordan-1-chicago-dz5485-612-release-date.jpg",
      "title": "ชุดเครื่องมือช่าง",
      "price": "27.00",
      "discount": 70,
      "description":
          "A comprehensive toolkit for home repairs and basic maintenance.",
    },
    {
      "imageUrl":
          "https://static.nike.com/a/images/w_1280,q_auto,f_auto/06569bd0-a651-44f5-ad73-9f00d3e33e7b/air-jordan-1-chicago-dz5485-612-release-date.jpg",
      "title": "ชุดเครื่องมือช่าง",
      "price": "27.00",
      "discount": 70,
      "description":
          "A comprehensive toolkit for home repairs and basic maintenance.",
    },
    {
      "imageUrl":
          "https://static.nike.com/a/images/w_1280,q_auto,f_auto/06569bd0-a651-44f5-ad73-9f00d3e33e7b/air-jordan-1-chicago-dz5485-612-release-date.jpg",
      "title": "ชุดเครื่องมือช่าง",
      "price": "27.00",
      "discount": 70,
      "description":
          "A comprehensive toolkit for home repairs and basic maintenance.",
    },
  ];

  // Helper function to calculate the discounted price
  double _calculateDiscountedPrice(
      double originalPrice, int discountPercentage) {
    return originalPrice - (originalPrice * discountPercentage / 100);
  }

  Widget _buildProductCard({
    required BuildContext context,
    required String productName,
    required String description,
    required String imageUrl,
    required double originalPrice,
    required double discountedPrice,
    required int discountPercentage,
    required double rating,
    required int reviews,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Prodcutcart3(
              image: imageUrl,
              productName: productName,
              originalPrice: originalPrice,
              discountedPrice: discountedPrice,
              discountPercentage: discountPercentage,
              rating: rating,
              reviews: reviews,
              price: discountedPrice, // Pass the correct price
              discount: discountPercentage, // Pass the discount percentage
            ),
          ),
        );
      },
      child: MouseRegion(
        onEnter: (_) {
          // Hover effect (if required)
        },
        onExit: (_) {
          // Reset effect on hover exit
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform:
              Matrix4.translationValues(0, -8, 0), // Moves up by 8 pixels
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(0),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      height: 130,
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '-$discountPercentage%',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  productName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < rating ? Icons.star : Icons.star_border,
                          size: 16,
                          color: Colors.yellow,
                        );
                      }),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '($reviews reviews)',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  '฿${NumberFormat('#,##0.00').format(discountedPrice)}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFE6005C),
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // Wrapping in SingleChildScrollView to handle overflow
      child: GridView.builder(
        padding: const EdgeInsets.all(5),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 1,
          childAspectRatio: 0.70,
        ),
        itemCount: sampleProducts.length,
        itemBuilder: (context, index) {
          final product = sampleProducts[index];
          double originalPrice = double.tryParse(product['price'] ?? '0') ?? 0;
          double discountedPrice =
              _calculateDiscountedPrice(originalPrice, product['discount']);
          return _buildProductCard(
            context: context,
            productName: product['title'],
            description: product['description'],
            imageUrl: product['imageUrl'],
            originalPrice: originalPrice,
            discountedPrice: discountedPrice,
            discountPercentage: product['discount'],
            rating: 4.5, // Default rating (adjust as needed)
            reviews: 1200, // Default reviews (adjust as needed)
          );
        },
      ),
    );
  }
}
