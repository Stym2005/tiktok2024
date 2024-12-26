import 'package:flutter/material.dart';

class OrderCommissionScreen extends StatefulWidget {
  @override
  _OrderCommissionScreenState createState() => _OrderCommissionScreenState();
}

class _OrderCommissionScreenState extends State<OrderCommissionScreen> {
  int _selectedTab = 0; // State to track the selected tab
  bool _showDetails = false; // State to toggle additional details

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'คำสั่งซื้อในโปรแกรมนายหน้า',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date Range Section
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'วันที่สั่งซื้อ: 5 เม.ย. 2023 - 4 ก.ค. 2023',
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                  Icon(Icons.arrow_drop_down, color: Colors.grey[700]),
                ],
              ),
            ),

            // Tab Section with clickable tabs
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTab('ทั้งหมด', 0),
                _buildTab('อยู่ระหว่างดำเนินการ', 1),
                _buildTab('ชำระแล้ว', 2),
                _buildTab('ไม่มีสิทธิ์', 3),
              ],
            ),
            const Divider(),

            // Dynamic Content Based on Selected Tab
            _buildTabContent(),

            // Toggle Details Button
            if (_selectedTab ==
                0) // Show the toggle button only for "ทั้งหมด" tab
              Center(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      _showDetails = !_showDetails;
                    });
                  },
                  child: Text(
                    _showDetails ? 'ดูน้อยลง' : 'ดูเพิ่มเติม',
                    style: const TextStyle(color: Colors.blue),
                  ),
                ),
              ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Widget for Tab Selection
  Widget _buildTab(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = index;
        });
      },
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          color: _selectedTab == index ? Colors.black : Colors.grey[500],
          fontWeight:
              _selectedTab == index ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  // Widget for Dynamic Content Based on Selected Tab
  Widget _buildTabContent() {
    switch (_selectedTab) {
      case 0: // "ทั้งหมด"
        return Column(
          children: [
            _buildOrderCard(),
            if (_showDetails)
              _buildOrderCard(), // Show additional card if details are expanded
          ],
        );
      case 1: // "อยู่ระหว่างดำเนินการ"
        return Center(
          child: Text(
            'อยู่ระหว่างดำเนินการ: หน้านี้ยังอยู่ระหว่างการพัฒนา',
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
        );
      case 2: // "ชำระแล้ว"
        return Center(
          child: Text(
            'ชำระแล้ว: ไม่มีคำสั่งซื้อ',
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
        );
      case 3: // "ไม่มีสิทธิ์"
        return Center(
          child: Text(
            'ไม่มีสิทธิ์: ไม่มีคำสั่งซื้อ',
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  // Widget for Order Card
  Widget _buildOrderCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Order ID and Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'รหัสคำสั่งซื้อ: 577513214964173761',
                style: TextStyle(fontSize: 12, color: Colors.grey[700]),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'อยู่ระหว่างดำเนินการ',
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Product Information
          Row(
            children: [
              Image.network(
                'https://via.placeholder.com/50',
                width: 50,
                height: 50,
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  'KUANGYEไฟฉาย ไฟฉายแรงสูง 100000 lumens LEDความสว่างสูง ส่องไกล 5000 เมตร...',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Commission Details
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCommissionInfo('฿340.00', 'ค่าคอมมิชชันพื้นฐาน'),
              _buildCommissionInfo('฿51.00', 'ค่าคอมฯพิเศษ'),
              _buildCommissionInfo('--', 'ค่าคอมมิชชันตามจริง'),
            ],
          ),
          const SizedBox(height: 8),

          // Date Ordered
          Text(
            'จัดส่งแล้ว: 2 ก.ค. 2023 1:05 PM',
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  // Widget for Commission Info
  Widget _buildCommissionInfo(String amount, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          amount,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
        ),
      ],
    );
  }
}
