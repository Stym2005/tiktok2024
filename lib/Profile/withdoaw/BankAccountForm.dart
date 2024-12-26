import 'package:flutter/material.dart';

class BankAccountForm extends StatefulWidget {
  @override
  _BankAccountFormState createState() => _BankAccountFormState();
}

class _BankAccountFormState extends State<BankAccountForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('เพิ่มบัญชีธนาคาร'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField('ชื่อ-นามสกุล', 'กรุณาใส่ชื่อของคุณ'),
              _buildDivider(),
              _buildTextField(
                  'หมายเลขโทรศัพท์มือถือ', 'กรุณากรอกหมายเลขโทรศัพท์มือถือ'),
              _buildDivider(),
              _buildTextField('ประเทศ', 'กรุณากรอกชื่อประเทศของคุณ'),
              _buildDivider(),
              _buildTextField('เลขบัญชีธนาคาร', 'กรุณาใส่เลขบัญชีธนาคารของคุณ'),
              _buildDivider(),
              _buildTextField('ธนาคาร', 'กรุณาใส่ชื่อธนาคารของคุณ'),
              _buildDivider(),
              _buildTextField('ชื่อสาขา', 'กรุณาใส่ชื่อสาขาที่ถูกต้อง'),
              _buildDivider(),
              const SizedBox(height: 16),
              const Text(
                'ประเภทการชำระเงิน USDT',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              _buildTextField('USDT_trc20', 'กรุณากรอกข้อมูล'),
              _buildDivider(),
              _buildTextField('USDT_erc20', 'กรุณากรอกข้อมูล'),
              _buildDivider(),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print('Form Submitted');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade600, // TikTok สีชมพู
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // ปุ่มกลม
                    ),
                  ),
                  child: const Text(
                    'ยืนยัน',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: TextFormField(
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
                border: InputBorder.none, // ไม่มีกรอบ
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณากรอก$label';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.grey.shade300,
      thickness: 1,
      height: 1,
    );
  }
}
