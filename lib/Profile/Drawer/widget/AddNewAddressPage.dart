import 'package:flutter/material.dart';

class AddNewAddressPage extends StatefulWidget {
  @override
  _AddNewAddressPageState createState() => _AddNewAddressPageState();
}

class _AddNewAddressPageState extends State<AddNewAddressPage> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _detailsController = TextEditingController();
  String _selectedCountry = 'ไทย';
  String _selectedRegion = 'เลือกภูมิภาค';

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _detailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('เพิ่มที่อยู่ใหม่'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text('ข้อมูลติดต่อ'),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'ชื่อ',
              ),
            ),
            Row(
              children: [
                DropdownButton<String>(
                  value: 'TH +66',
                  items: ['TH +66', 'US +1'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {},
                ),
                Expanded(
                  child: TextField(
                    controller: _phoneController,
                    decoration: const InputDecoration(
                      labelText: 'หมายเลขโทรศัพท์',
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text('ข้อมูลที่อยู่'),
            DropdownButtonFormField<String>(
              value: _selectedCountry,
              items: ['ไทย', 'อื่น ๆ'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCountry = value!;
                });
              },
              decoration: const InputDecoration(
                labelText: 'ประเทศ',
              ),
            ),
            DropdownButtonFormField<String>(
              value: _selectedRegion,
              items: ['เลือกภูมิภาค', 'ภาคเหนือ', 'ภาคใต้'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedRegion = value!;
                });
              },
              decoration: const InputDecoration(
                labelText: 'ภูมิภาค',
              ),
            ),
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(
                labelText: 'ที่อยู่',
              ),
            ),
            TextField(
              controller: _detailsController,
              decoration: const InputDecoration(
                labelText: 'รายละเอียดอื่น ๆ (ไม่บังคับ)',
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'การตั้งค่า',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text(
              'เมื่อลิกบันทึก แสดงว่าคุณรับทราบว่าคุณได้อ่าน นโยบายความเป็นส่วนตัวของ TikTok Shop แล้ว',
              style: TextStyle(fontSize: 12.0, color: Colors.grey),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle save action here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
              ),
              child: const Text('บันทึก',
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
