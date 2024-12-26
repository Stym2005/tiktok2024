import 'package:flutter/material.dart';
import 'package:flutter_application_1/Profile/withdoaw/BankAccountForm.dart';
import 'package:flutter_application_1/bottonbar.dart';

class WithdrawPage extends StatefulWidget {
  @override
  _LiveRewardsScreenState createState() => _LiveRewardsScreenState();
}

class _LiveRewardsScreenState extends State<WithdrawPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        centerTitle: true,
        title: const Text(
          "Withdraw Coins",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "Accumulated Cions: ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Image.asset(
                  'assets/icons/tiktokcion.png',
                  width: 30,
                  height: 30,
                ),
                const Text(
                  " 0",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Rewards Card with Gradient Background
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.pink.shade400, Colors.pink.shade800],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 4,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Available rewards",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "USD 0.00",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "\u2248 LAK 0.00",
                    style: TextStyle(fontSize: 14, color: Colors.white60),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.pink.shade800,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width *
                                    0.8, // 80% ของความกว้างหน้าจอ
                                height: 130, // ความสูงที่กำหนด
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Text(
                                        "กรุณาผูกบัญชีธนาคารก่อน",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 93, 92, 92),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign
                                            .center, // ทำให้ข้อความจัดกลาง
                                      ),
                                    ),
                                    const Spacer(),
                                    const Divider(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(); // ปิด Dialog
                                          },
                                          child: const Text(
                                            "ยกเลิก",
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ),
                                        const SizedBox(
                                            width:
                                                50), // เพิ่มระยะห่างระหว่างปุ่ม
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    BankAccountForm(),
                                              ),
                                            ).then((_) {
                                              Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const BottomBar(), 
                                                ),
                                                (route) =>
                                                    false, // ลบ stack ทั้งหมด
                                              );
                                            });
                                          },
                                          child: const Text(
                                            "ผูกบัตรธนาคาร",
                                            style:
                                                TextStyle(color: Colors.pink),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: const Text(
                        "Withdraw",
                        style: TextStyle(color: Colors.pink),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Transactions Section
            const Text(
              "Transactions",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Dec 2024", style: TextStyle(fontSize: 16)),
                        Text("In: USD0    Out: USD0",
                            style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Text(
                        "No transactions to display",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
