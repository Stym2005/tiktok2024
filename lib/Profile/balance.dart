import 'package:flutter/material.dart';
import 'package:flutter_application_1/Profile/TopUpScreen.dart';
import 'package:flutter_application_1/Profile/withdoaw/withdarw.dart';
import 'package:flutter_application_1/Profile/openshop/opnmarket.dart';

class Balance extends StatefulWidget {
  const Balance({super.key});

  @override
  _TikTokMonetizationPageState createState() => _TikTokMonetizationPageState();
}

class _TikTokMonetizationPageState extends State<Balance> {
  double totalEarnings = 4305.28;

  bool isLoading = false;

  void refreshData() async {
    setState(() {
      isLoading = true;
    });

    // Simulating a network call
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      totalEarnings += 200.0;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // VIP Card Style Container with Gradient
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pink.shade400, Colors.pink.shade800],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20), // more rounded
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 10,
                  spreadRadius: 6,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "VIP",
                  style: TextStyle(
                      color: Colors.white60, fontSize: 18), // larger text
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    // Add the icon with a larger size
                    Image.asset(
                      'assets/icons/tiktokcion.png', // Your icon path
                      width: 60,
                      height: 60,
                    ),
                    const SizedBox(width: 10), // Space between icon and text
                    // Add the text with more emphasis
                    Text(
                      totalEarnings.toStringAsFixed(2),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30, // larger font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 'Get Coin' Button with rounded edges and shadow
                    _buildButton(
                      label: "Get Cion",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TopUpScreen(),
                          ),
                        );
                      },
                    ),
                    // 'Withdraw' Button with rounded edges and shadow
                    _buildButton(
                      label: "Withdraw",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WithdrawPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          const Openmarket(), // Assuming this is another widget with content

          // Revenue Insight Container with modern look
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: const Color.fromARGB(255, 255, 4, 88),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  spreadRadius: 3,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Revenue Insight",
                  style: TextStyle(
                    fontSize: 20, // Increased font size for emphasis
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Based on recent trends, we believe you have highly potential to boost your revenue. Apply now!",
                  style: TextStyle(color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TopUpScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE6005C),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text("Get Cions"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to build buttons with a consistent style
  Widget _buildButton(
      {required String label, required VoidCallback onPressed}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFFE6005C),
          ),
        ),
      ),
    );
  }
}
