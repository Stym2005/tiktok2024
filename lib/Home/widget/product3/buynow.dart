import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home/widget/product3/OrderSummaryPage.dart';

void buy(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16.0),
      ),
    ),
    builder: (context) => _ProductSelectionBottomSheet(),
  );
}

class _ProductSelectionBottomSheet extends StatefulWidget {
  @override
  _ProductSelectionBottomSheetState createState() =>
      _ProductSelectionBottomSheetState();
}

class _ProductSelectionBottomSheetState
    extends State<_ProductSelectionBottomSheet> {
  int quantity = 1; // Initial quantity
  String? selectedOption;
  String? selectedSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Image and Price Section
          Row(
            children: [
              Image.network(
                'https://png.pngitem.com/pimgs/s/43-434027_product-beauty-skin-care-personal-care-liquid-tree.png',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 16),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '฿55.50 - 192.00',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  Text(
                    '฿250.00 - 280.00',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  Text(
                    'ประหยัดได้ถึง 78%',
                    style: TextStyle(fontSize: 14, color: Colors.green),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Options Section
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              for (var option in [
                '5A',
                '6A',
                '7A',
                '8A',
                '9A',
                '10A',
                '11A',
                '12A',
                '13A',
                '14A',
                '15A',
                '16A'
              ])
                ChoiceChip(
                  label: Text(option),
                  selected: selectedOption == option,
                  onSelected: (selected) {
                    setState(() {
                      selectedOption = selected ? option : null;
                    });
                  },
                ),
            ],
          ),
          const SizedBox(height: 16),

          // Size Section
          Row(
            children: [
              for (var size in ['6ฟุต', '5ฟุต', '3.5ฟุต'])
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ChoiceChip(
                    label: Text(size),
                    selected: selectedSize == size,
                    onSelected: (selected) {
                      setState(() {
                        selectedSize = selected ? size : null;
                      });
                    },
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),

          // Quantity Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'จำนวน',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (quantity > 1) quantity--;
                      });
                    },
                    icon: const Icon(Icons.remove),
                  ),
                  Text('$quantity', style: const TextStyle(fontSize: 16)),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Add to Cart Button
          ElevatedButton(
            onPressed: () {
              if (selectedOption != null && selectedSize != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  OrderSummaryPage(),
                  ),
                );
              } else {
                // Show an alert or notification to the user to select options and size
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('กรุณาเลือกตัวเลือกและขนาด')),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink,
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text(
              'ซื้อด้วยคูปอง',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
