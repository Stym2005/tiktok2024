import 'package:flutter/material.dart';
import 'package:flutter_application_1/Profile/openshop/formpage.dart';

class StoreTypeSelectionPage extends StatefulWidget {
  @override
  _StoreTypeSelectionPageState createState() => _StoreTypeSelectionPageState();
}

class _StoreTypeSelectionPageState extends State<StoreTypeSelectionPage> {
  // To hold the selected value
  String? selectedStoreType = 'Personal Store';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เลือกประเภทร้านค้า'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            ListTile(
              title: Text('ร้านค้าบุศคน'),
              leading: Checkbox(
                value: selectedStoreType == 'Personal Store',
                activeColor:
                    Color(0xFFE6005C), // Custom pink color for TikTok style
                onChanged: (bool? value) {
                  if (value == true) {
                    setState(() {
                      selectedStoreType = 'Personal Store';
                    });
                  }
                },
              ),
            ),
            ListTile(
              title:
                  Text('ร้านค้าขององค์กรจำเป็นต้องอัปโหลดใบอนุญาตประกอบธุรกิจ'),
              leading: Checkbox(
                value: selectedStoreType == 'Business Store',
                activeColor:
                    Color(0xFFE6005C), // Custom pink color for TikTok style
                onChanged: (bool? value) {
                  if (value == true) {
                    setState(() {
                      selectedStoreType = 'Business Store';
                    });
                  }
                },
              ),
            ),
            Spacer(),
            // Use Expanded to make the button and text take up the remaining space
            Expanded(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.end, // Align at the bottom of the screen
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width *
                        0.8, // Makes the button take full width
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FormPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        backgroundColor: Color(0xFFE6005C),
                      ),
                      child: const Text(
                        'ยืนยัน',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  const Text(
                    'ไม่สามารถเปลี่ยนแปลงได้หลังจากเลือกประเภทการทำการค้า โปรดเลือกให้แน่ใจ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 156, 156, 156),
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
