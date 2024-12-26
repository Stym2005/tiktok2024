import 'package:flutter/material.dart';

class CheckInScreen extends StatefulWidget {
  @override
  _CheckInScreenState createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("เช็คอิน"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          // Top Section with Blue Background
          Container(
            color: Colors.blue,
            width: double.infinity,
            padding: const EdgeInsets.only(top: 50, bottom: 20),
            child: Column(
              children: [
                const Text(
                  "คะแนนการเช็คอิน",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Check-in logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    "เช็คอินเข้าวันนี้",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "มีการเช็คอินอย่างต่อเนื่อง 2 วัน, เช็คอินทั้งหมด 2 วัน",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          // Calendar Section
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(12),
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(12),
                child: CalendarDatePicker(
                  initialDate: selectedDate,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                  onDateChanged: (date) {
                    setState(() {
                      selectedDate = date;
                    });
                  },
                ),
              ),
            ),
          ),

          // Timeline Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "ประวัติการเช็คอิน",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildTimelineBox("5 คะแนน", "5 วัน"),
                    _buildTimelineBox("10 คะแนน", "10 วัน"),
                    _buildTimelineBox("15 คะแนน", "15 วัน"),
                    _buildTimelineBox("20 คะแนน", "20 วัน"),
                    _buildTimelineBox("25 คะแนน", "25 วัน"),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // Widget to build timeline boxes
  Widget _buildTimelineBox(String points, String days) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            points,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          days,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
