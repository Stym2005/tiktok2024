import 'package:flutter/material.dart';
import 'package:flutter_application_1/Profile/munusetting/CustomerServiceWidget.dart';
import 'package:flutter_application_1/Profile/openshop/iconopen.dart';
import 'package:flutter_application_1/Profile/openshop/storetypeselection.dart';

class Openmarket extends StatefulWidget {
  const Openmarket({super.key});

  @override
  _OpenmarketState createState() => _OpenmarketState();
}

class _OpenmarketState extends State<Openmarket> {
  final List<Map<String, dynamic>> orderIcons = [
    {"icon": Icons.credit_score, "label": "รอชำระเงิน"},
    {"icon": Icons.local_shipping, "label": "รอจัดส่ง"},
    {"icon": Icons.directions_car, "label": "รอรับสินค้า"},
    {"icon": Icons.rate_review, "label": "รอรีวิว"},
    {"icon": Icons.shield, "label": "หลังการขาย"},
  ];

  bool isLoading = false;

  void _handleStoreButtonPressed() {
    setState(() {
      isLoading = true; // Set loading state when button is pressed
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false; // Set loading state back to false
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StoreTypeSelectionPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  childAspectRatio: 1,
                ),
                itemCount: orderIcons.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Iconopen(
                            orderIcons: index,
                          ),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.pink.shade400,
                                const Color(0xFFE6005C),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color.fromARGB(
                                  255, 255, 4, 88), // Border color
                              width: 2, // Border width
                            ),
                          ),
                          child: Icon(
                            orderIcons[index]['icon'],
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          orderIcons[index]['label'],
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            // Gradient Button Section
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ).copyWith(
                  elevation: ButtonStyleButton.allOrNull(0),
                ),
                onPressed: _handleStoreButtonPressed,
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.pink.shade400,
                        const Color(0xFFE6005C),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: const Color.fromARGB(
                          255, 255, 4, 88), // Border color for button
                      width: 2, // Border width
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    child: isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/my-kaidian.png',
                                width: 24,
                                height: 24,
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                "ฉันจะเปิดร้าน",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
            CustomerServiceWidget(),
          ],
        ),
      ),
    );
  }
}
