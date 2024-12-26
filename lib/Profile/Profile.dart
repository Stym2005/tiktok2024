import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Profile/Drawer/Drawer.dart';
import 'package:flutter_application_1/Profile/balance.dart';
import 'package:flutter_application_1/Profile/information/information.dart';
import 'package:flutter_application_1/appbar.dart';
import 'package:image_picker/image_picker.dart'; // For selecting images
import 'dart:io'; // For using File for images

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _image; // Variable to store selected image file
  bool _isImagePickerActive = false; // Flag to track image picker activity

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    // Check if image picker is already active
    if (_isImagePickerActive)
      return; // Don't do anything if the picker is active

    setState(() {
      _isImagePickerActive = true; // Set flag to true when picker is active
    });

    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _isImagePickerActive = false; // Reset flag when image picking is complete
    });

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: const AppDrawer(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section with background and image
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.pink.shade400, Colors.pink.shade800],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 4,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: _pickImage,
                        child: CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.6),
                          radius: 45,
                          child: _image == null
                              ? const Icon(Icons.person,
                                  size: 40, color: Colors.blue)
                              : ClipOval(
                                  child: Image.file(
                                    _image!,
                                    width: 90,
                                    height: 90,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'ชื่อผู้ใช้', // User's name
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Text(
                                'ID: 123456', // User ID
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white70,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.copy),
                                color: Colors.white,
                                onPressed: () {
                                  Clipboard.setData(
                                      const ClipboardData(text: '123456'));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('ID คัดลอกแล้ว'),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Balance(),
            const Information(),
          ],
        ),
      ),
    );
  }
}


