import 'package:flutter/material.dart';

class FlashSaleSection extends StatefulWidget {
  const FlashSaleSection({Key? key}) : super(key: key);

  @override
  _FlashSaleSectionState createState() => _FlashSaleSectionState();
}

class _FlashSaleSectionState extends State<FlashSaleSection> {
  // คุณสามารถเพิ่มสถานะ (เช่น การโหลดข้อมูล, การเปลี่ยนแปลงข้อมูลสินค้า ฯลฯ) ที่นี่

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FlashSaleItem(
            title: 'แชมพูอัญชัน (ได้ทั้งหมด 3 ชิ้น...)',
            price: '฿103.00',
            originalPrice: '฿122.00',
            discount: '16%',
          ),
          FlashSaleItem(
            title: 'แชมพูอัญชันชุด 3 ชิ้น...',
            price: '฿96.00',
            originalPrice: '฿109.00',
            discount: '12%',
          ),
          FlashSaleItem(
            title: 'กาแฟผงหอม 2 แพ็ค...',
            price: '฿197.00',
            originalPrice: '฿240.00',
            discount: '18%',
          ),
        ],
      ),
    );
  }
}

class FlashSaleItem extends StatefulWidget {
  final String title;
  final String price;
  final String originalPrice;
  final String discount;

  const FlashSaleItem({
    Key? key,
    required this.title,
    required this.price,
    required this.originalPrice,
    required this.discount,
  }) : super(key: key);

  @override
  _FlashSaleItemState createState() => _FlashSaleItemState();
}

class _FlashSaleItemState extends State<FlashSaleItem> {
  // คุณสามารถเพิ่มสถานะภายในนี้เช่นการคลิกปุ่ม "ซื้อ" หรือการจัดการสถานะอื่น ๆ

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Container(
          width: 80.0,
          height: 80.0,
          color: Colors.grey[300],
          child: const Icon(
            Icons.image,
            size: 40.0,
            color: Colors.white,
          ),
        ),
        title: Text(
          widget.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Row(
          children: [
            Text(
              widget.price,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.red),
            ),
            const SizedBox(width: 8.0),
            Text(
              widget.originalPrice,
              style: const TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        trailing: Column(
          children: [
            Text('${widget.discount} off',
                style: const TextStyle(color: Colors.orange)),
            const SizedBox(height: 4.0),
            Expanded(
              // Wrap ElevatedButton with Expanded or Flexible
              child: ElevatedButton(
                onPressed: () {},
                child:  Text('ซื้อ'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  backgroundColor: Colors.pink,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
