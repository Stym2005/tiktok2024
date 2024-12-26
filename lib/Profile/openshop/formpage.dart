import 'dart:io'; // เพิ่มการใช้งาน File
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // นำเข้า image picker

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController businessController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController idCardController = TextEditingController();

  File? _image; // เก็บรูปภาพที่เลือก

  // สร้างตัวแปร ImagePicker
  final ImagePicker _picker = ImagePicker();

  // ฟังก์ชันเลือกภาพจากแกลเลอรี
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // เก็บไฟล์รูปภาพ
      });
    }
  }

  // ฟังก์ชันลบภาพ
  void _removeImage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ยืนยันการลบภาพ'),
          content: const Text('คุณต้องการลบภาพนี้ใช่หรือไม่?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // ปิด Dialog โดยไม่ทำอะไร
              },
              child: const Text('ยกเลิก'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _image = null; // รีเซ็ตภาพ
                });
                Navigator.of(context).pop(); // ปิด Dialog หลังจากลบ
              },
              child: const Text(
                'ตกลง',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('กรอกข้อมูล'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "โลโก้ร้านค้า",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(153, 72, 71, 71),
                ),
              ),
              const SizedBox(height: 20),

              // Dotted Border for selecting image
              GestureDetector(
                onTap: _pickImage, // When clicked to pick image
                child: DottedBorder(
                  color: const Color.fromARGB(153, 84, 84, 84),
                  strokeWidth: 3,
                  dashPattern: [6, 3],
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: _image == null
                        ? const Center(
                            child: Icon(
                              Icons.camera_alt,
                              color: Color.fromARGB(153, 84, 84, 84),
                              size: 30,
                            ),
                          )
                        : Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Image.file(
                                _image!, // Show selected image
                                fit: BoxFit.cover,
                                width: 100,
                                height: 100,
                              ),
                              Container(
                                width: 30, // Circle icon width
                                height: 30, // Circle icon height
                                decoration: const BoxDecoration(
                                  color: Color(0xFFE6005C), // Background color
                                  shape: BoxShape.circle, // Circle shape
                                ),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.close,
                                    color: Colors.white, // Icon color
                                    size: 20, // Icon size
                                  ),
                                  onPressed: _removeImage, // Remove image
                                  padding:
                                      const EdgeInsets.all(0), // Button padding
                                  splashRadius: 20, // Splash effect size
                                ),
                              )
                            ],
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Input fields
              _buildCustomInputField(
                  'ชื่อร้าน', 'กรุณากรอกชื่อร้าน', nameController),
              _buildCustomInputField('คำอธิบายร้านค้า', 'กรุณากรอกรายเอียดร้าน',
                  businessController),
              _buildCustomInputField(
                  'ประเทศ', 'กรุณากรอกที่อยู่ประเทศของคุณ', addressController),
              _buildCustomInputField('รายละเอียดที่อยู่',
                  'กรุณากรอกที่อยู่ให้แน่ชัด', phoneController),
              _buildCustomInputField(
                  'ชื่อจริง', 'กรุณากรอกชื่อจริง', emailController),
              _buildCustomInputField('หมายเลขโทรศัพท์มือถือ',
                  'กรุณากรอกเลขโทรศัพท์มือถือ', idCardController),
              _buildCustomInputField(
                  'หมายเลขประจำตัวประชาชน/หมายเลขหนังสือเดินทาง',
                  'กรุณากรอกหมายเลขบัตรประจำตัวประชาชน',
                  idCardController),

              const SizedBox(height: 20),
              Text("อัพโหลดบัตรประจำตัวประชาชน/หนังสือเดินทาง"),
              const SizedBox(height: 20),
              const Text("ด้านหน้าของ\nบัตรประจำตัว"),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: _pickImage, // When clicked to pick image
                    child: DottedBorder(
                      color: const Color.fromARGB(153, 84, 84, 84),
                      strokeWidth: 3,
                      dashPattern: [6, 3],
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: _image == null
                            ? const Center(
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Color.fromARGB(153, 84, 84, 84),
                                  size: 30,
                                ),
                              )
                            : Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Image.file(
                                    _image!,
                                    fit: BoxFit.cover,
                                    width: 100,
                                    height: 100,
                                  ),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFE6005C),
                                      shape: BoxShape.circle,
                                    ),
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      onPressed: _removeImage,
                                      padding: const EdgeInsets.all(0),
                                      splashRadius: 20,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 7),

              const Text("ด้านหลังของ\nบัตรประจำตัว"),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: _pickImage, // When clicked to pick image
                    child: DottedBorder(
                      color: const Color.fromARGB(153, 84, 84, 84),
                      strokeWidth: 3,
                      dashPattern: [6, 3],
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: _image == null
                            ? const Center(
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Color.fromARGB(153, 84, 84, 84),
                                  size: 30,
                                ),
                              )
                            : Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Image.file(
                                    _image!,
                                    fit: BoxFit.cover,
                                    width: 100,
                                    height: 100,
                                  ),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFE6005C),
                                      shape: BoxShape.circle,
                                    ),
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      onPressed: _removeImage,
                                      padding: const EdgeInsets.all(0),
                                      splashRadius: 20,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              _buildCustomInputField('รหัสเชิญตัวแทน',
                  'กรุณากรอกรหัสเชิญตัวแทน', idCardController),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print('Form Submitted');
                    }
                  },
                  // ignore: sort_child_properties_last
                  child: const Text(
                    "ขั้นตอนต่อไป",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE6005C),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // ฟอร์มกรอกข้อมูล
  Widget _buildCustomInputField(
      String label, String hint, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 85, 85, 85),
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              border: InputBorder.none, // ไม่มีกรอบ
              filled: true,
              fillColor: Colors.grey.shade200,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            ),
          ),
        ],
      ),
    );
  }
}
