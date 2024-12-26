import 'package:flutter/material.dart';

class Withdrawmenu extends StatefulWidget {
  const Withdrawmenu({Key? key}) : super(key: key);

  @override
  _WithdrawPageState createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<Withdrawmenu> {
  bool canWithdraw = false;
  final TextEditingController _amountController = TextEditingController();
  double balance = 10447.62; // ยอดเงินคงเหลือ
  double minimumWithdraw = 10.0; // ขั้นต่ำในการถอนเงิน

  void _checkWithdrawEligibility() {
    final inputAmount = double.tryParse(_amountController.text) ?? 0.0;

    setState(() {
      canWithdraw = inputAmount >= minimumWithdraw && inputAmount <= balance;
    });
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  // ฟังก์ชันเปิด BottomSheet เมื่อคลิกไอคอน
  void _showAmountBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 300, // ปรับขนาด BottomSheet
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "เลือกบัญชีธนาคารที่ต้องการใช้ในการถอนเงิน",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  // Logic to handle selection of a bank account
                  Navigator.pop(context); // Close BottomSheet after selection
                },
                child: const ListTile(
                  leading: Icon(Icons.account_balance,
                      size: 28, color: Colors.black54),
                  title: Text("บัญชีธนาคาร A"),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Logic to handle selection of a bank account
                  Navigator.pop(context); // Close BottomSheet after selection
                },
                child: const ListTile(
                  leading: Icon(Icons.account_balance,
                      size: 28, color: Colors.black54),
                  title: Text("บัญชีธนาคาร B"),
                ),
              ),
              // เพิ่มบัญชีใหม่
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Logic for adding a new bank account
                  Navigator.pop(context); // Close BottomSheet after action
                },
                child: const ListTile(
                  leading: Icon(Icons.add, size: 28, color: Colors.blue),
                  title: Text("เพิ่มบัญชีธนาคาร"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ถอนเงิน"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Withdraw Account Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "บัญชีที่ถอนเงิน",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    // เรียกใช้งาน _showAmountBottomSheet เมื่อคลิกไอคอน
                    _showAmountBottomSheet();
                  },
                  child: const Text(
                    "+เพิ่ม",
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Bank Transfer Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(2),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.credit_card,
                    size: 35,
                    color: Colors.black54,
                  ),
                  const SizedBox(width: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "การโอนเงินผ่านธนาคาร",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "จำนวนการถอนเงินขั้นต่ำ: ฿10.00",
                        style: TextStyle(color: Colors.black54, fontSize: 12),
                      ),
                      Text(
                        "จำนวนสูงสุด: ฿2,000,000.00",
                        style: TextStyle(color: Colors.black54, fontSize: 12),
                      ),
                      Text(
                        "คุณควรได้รับเงินภายใน 1 วันทำการ",
                        style: TextStyle(color: Colors.black54, fontSize: 12),
                      ),
                    ],
                  ),
                  const Spacer(), // เพิ่ม Spacer เพื่อให้ไอคอนไปอยู่ขวาสุด
                  GestureDetector(
                    onTap:
                        _showAmountBottomSheet, // เปิด BottomSheet เมื่อคลิกไอคอน
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Color.fromARGB(255, 82, 82, 83),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Withdraw Amount Section
            const Text(
              "จำนวนเงิน",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "ป้อนจำนวนเงินที่ต้องการถอน",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: const Icon(Icons.currency_bitcoin),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _amountController.clear();
                    _checkWithdrawEligibility();
                  },
                ),
              ),
              onChanged: (value) {
                _checkWithdrawEligibility();
              },
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "ยอดเงินคงเหลือ: ฿${balance.toStringAsFixed(2)}",
                  style: const TextStyle(fontSize: 16),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _amountController.text = balance.toStringAsFixed(2);
                      _checkWithdrawEligibility();
                    });
                  },
                  child: const Text(
                    "ถอนยอดเงินคงเหลือ",
                    style: TextStyle(color: Colors.blue, fontSize: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Withdraw Now Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: canWithdraw
                    ? () {
                        final withdrawAmount =
                            double.tryParse(_amountController.text) ?? 0.0;

                        if (withdrawAmount > 0) {
                          setState(() {
                            balance -= withdrawAmount; // Update balance
                            canWithdraw =
                                false; // Disable button after withdrawal
                          });

                          // Show success dialog
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("ถอนเงินสำเร็จ"),
                                content: Text(
                                    "คุณได้ทำการถอนเงิน ฿${withdrawAmount.toStringAsFixed(2)}"),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: const Text("ตกลง"),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: canWithdraw ? Colors.blue : Colors.grey[300],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  "ถอนเงินตอนนี้",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
