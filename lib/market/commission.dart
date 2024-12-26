import 'package:flutter/material.dart';
import 'package:flutter_application_1/shop/menu/ordercommision.dart';
import 'package:flutter_application_1/shop/menu/withdrw.dart';

class CommissionScreen extends StatefulWidget {
  @override
  _CommissionScreenState createState() => _CommissionScreenState();
}

class _CommissionScreenState extends State<CommissionScreen> {
  double _balance = 0.00; // Dynamic balance variable
  bool _canWithdraw = false; // State for enabling/disabling the button

  // Example function to simulate updating balance
  void _updateBalance(double newBalance) {
    setState(() {
      _balance = newBalance;
      _canWithdraw = newBalance > 0; // Enable button if balance > 0
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'ค่าคอมมิชชัน',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            // Balance Display
            Text(
              '฿${_balance.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'ค่าคอมมิชชันที่สามารถถอนได้',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            // Withdraw Button (Enabled/Disabled based on state)
            ElevatedButton(
              onPressed: _canWithdraw
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                             const Withdrawmenu(), // เปลี่ยนไปยังหน้า WithdrawMenu
                        ),
                      );
                      setState(() {
                        _balance = 0.00; // Reset balance to 0 after withdrawal
                        _canWithdraw = false;
                      });
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: _canWithdraw
                    ? const Color(0xFFE6005C)
                    : Colors.grey[300], // Change color when disabled
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: Text(
                'ถอนเงิน',
                style: TextStyle(
                  color: _canWithdraw ? Colors.white : Colors.grey[600],
                  fontSize: 17,
                ),
              ),
            ),

            const SizedBox(height: 40),
            // Options Section
            ListTile(
              leading: Icon(Icons.lock_outline),
              title: const Text(
                'คำสั่งซื้อในโปรแกรมนายหน้า',
                style: TextStyle(fontSize: 16),
              ),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderCommissionScreen(),
                  ),
                );
              },
            ),

            const ListTile(
              leading: Icon(Icons.info_outline),
              title: Text(
                'กฎค่านายหน้าของตัวแทน',
                style: TextStyle(fontSize: 16),
              ),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
            ),
            const SizedBox(height: 20),
            // Example Button to Update Balance
            ElevatedButton(
              onPressed: () {
                _updateBalance(150.00); // Example: Update balance to 150
              },
              child: const Text('อัปเดตค่าคอมมิชชัน'),
            ),
          ],
        ),
      ),
    );
  }
}
