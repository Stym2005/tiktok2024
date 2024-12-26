import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();

  // Controllers for text fields
  TextEditingController countryController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController idNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController invitationCodeController = TextEditingController();

  // Variables to store picked images
  XFile? _frontImage;
  XFile? _backImage;

  Future<void> _pickImage(String type) async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        if (type == 'front') {
          _frontImage = pickedFile;
        } else if (type == 'back') {
          _backImage = pickedFile;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Form'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Input fields
                _buildTextField('ประเทศ', 'กรุณากรอกชื่อประเทศของคุณ',
                    countryController, true),
                _buildTextField(
                    'รายละเอียดที่อยู่',
                    'กรุณากรอกรายละเอียดที่อยู่โดยละเอียด',
                    addressController,
                    true),
                _buildTextField(
                    'ชื่อจริง', 'กรุณากรอกชื่อจริง', nameController, true),
                _buildTextField('หมายเลขโทรศัพท์มือถือ',
                    'กรุณากรอกหมายเลขโทรศัพท์มือถือ', phoneController, true),
                _buildTextField(
                    'หมายเลขประจำตัวประชาชน',
                    'กรุณากรอกหมายเลขประจำตัวประชาชน',
                    idNumberController,
                    true),
                _buildTextField(
                    'อีเมล์', 'กรุณากรอกอีเมล์', emailController, true),
                const SizedBox(height: 20),

                // Image upload sections
                _buildImageUploadSection(
                    'อัพโหลดบัตรประชาชน (ด้านหน้า)', 'front', _frontImage),
                _buildImageUploadSection(
                    'อัพโหลดบัตรประชาชน (ด้านหลัง)', 'back', _backImage),

                const SizedBox(height: 20),

                // Invitation code
                _buildTextField(
                    'รหัสเชิญผู้ใช้งาน',
                    'กรุณากรอกรหัสเชิญผู้ใช้งาน',
                    invitationCodeController,
                    false),

                const SizedBox(height: 20),

                // Submit button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print('Form submitted');
                      }
                    },
                    child: const Text('ขั้นตอนถัดไป'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint,
      TextEditingController controller, bool isRequired) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (isRequired)
                const Text(
                  '*',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: Colors.grey.shade200,
            ),
            validator: isRequired
                ? (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอก$label';
                    }
                    return null;
                  }
                : null,
          ),
        ],
      ),
    );
  }

  Widget _buildImageUploadSection(String label, String type, XFile? image) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => _pickImage(type),
          child: Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
            child: image == null
                ? const Icon(
                    Icons.camera_alt,
                    size: 40,
                    color: Colors.grey,
                  )
                : Image.file(
                    File(image.path),
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      ],
    );
  }
}
