import 'package:flutter/material.dart';

class Iconopen extends StatefulWidget {
  final int orderIcons; // รับค่าจากหน้าก่อนหน้า

  const Iconopen({Key? key, this.orderIcons = 0}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<Iconopen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // ใช้ widget.orderIcons เพื่อกำหนดแท็บเริ่มต้น
    _tabController = TabController(
      length: 6, // Fixed to match the number of tabs
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose(); // อย่าลืม dispose TabController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("คำสั่งซื้อทั้งหมด"), // Title
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true, // Allow scroll if tabs overflow
          indicatorColor: Color(0xFFE6005C),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black,
          tabs: const [
            Tab(text: "รอชำระเงิน"),
            Tab(text: "รอจัดส่ง"),
            Tab(text: "รอรับสินค้า"),
            Tab(text: "รอรีวิว"),
            Tab(text: "ยกเลิกแล้ว"),
            Tab(text: "ชื่อแท็บใหม่"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildEmptyContent("รอชำระเงิน"),
          buildEmptyContent("รอจัดส่ง"),
          buildEmptyContent("รอรับสินค้า"),
          buildEmptyContent("รอรีวิว"),
          buildEmptyContent("ยกเลิกแล้ว"),
          buildEmptyContent("ชื่อหมวดหมู่สำหรับแท็บใหม่"),
        ],
      ),
    );
  }

  Widget buildEmptyContent(String title) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/empty.png', // Path to your custom icon
            width: 100,
            height:100, // Optional: Apply color tint
          ),
          const SizedBox(height: 10),
          Text(
            "ไม่มีข้อมูลในหมวด$title~",
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
