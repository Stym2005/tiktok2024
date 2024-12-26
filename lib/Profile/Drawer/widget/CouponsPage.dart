import 'package:flutter/material.dart';

class CouponsPage extends StatefulWidget {
  @override
  _MyCouponsPageState createState() => _MyCouponsPageState();
}

class _MyCouponsPageState extends State<CouponsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('คูปองของฉัน'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'ไม่ได้ใช้'),
            Tab(text: 'ใช้แล้ว'),
            Tab(text: 'หมดอายุ'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildEmptyTab('ไม่มีอีกแล้ว'),
          _buildEmptyTab('ไม่มีคูปองที่ใช้แล้ว'),
          _buildEmptyTab('ไม่มีคูปองหมดอายุ'),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.white, // Background color for the container
        child: GestureDetector(
          onTap: () {
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFFE6005C), // Background color for the button
              borderRadius: BorderRadius.circular(8), // Rounded corners
            ),
            alignment: Alignment.center,
            child: const Text(
              'ศูนย์คูปอง',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white, // Text color
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyTab(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/empty.png',
            width: 100,
            height: 100,
          ),
          const SizedBox(height: 16),
          Text(
            message,
            style: const TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
