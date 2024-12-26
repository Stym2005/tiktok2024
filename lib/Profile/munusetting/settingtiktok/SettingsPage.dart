import 'package:flutter/material.dart';
import 'package:flutter_application_1/Profile/Drawer/widget/aboutus.dart';
import 'package:flutter_application_1/Profile/information/information.dart';
import 'package:flutter_application_1/Profile/munusetting/settingtiktok/widget/showDelete.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'การตั้งค่า',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        children: [
          // User Section
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            child: ListTile(
              leading: const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/profile_image.png'),
              ),
              title: const Text(
                'Aa',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: const Text('2029900579',
                  style: TextStyle(color: Colors.grey)),
              onTap: () {
                // Navigate to profile details
              },
            ),
          ),
          const SizedBox(height: 20),

          // Account Section
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            child: Column(
              children: [
                buildSettingsOption('การจัดการที่อยู่รับสินค้า'),
                buildSettingsOption('ผูกบัญชีเข้าสู่ระบบ'),
                buildSettingsOption('แก้ไขหมายเลขบัญชีล็อกอิน'),
                buildSettingsOption('แก้ไขรหัสผ่านเข้าสู่ระบบ'),
                buildSettingsOption('การจัดการรหัสชำระเงิน', onTap: () {
                  Navigator.pop(context,);
                    
                   
                }),
                buildSettingsOption('ลบบัญชีออกจากระบบ', textColor: const Color(0xFFE6005C),
                    onTap: () {
                  showDeleteConfirmationDialog(context);
                }),
                buildSettingsOption('ภาษา'),
                buildSettingsOption('เกี่ยวกับเรา', onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Tikokabout()),
                  );
                }),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Logout Button
          Center(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: const Color(0xFFE6005C),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                // Add logout functionality here
              },
              icon: const Icon(Icons.logout),
              label: const Text(
                'ออกจากระบบ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 30),

          // Information Section
          const Information(),
        ],
      ),
    );
  }

  Widget buildSettingsOption(String title,
      {Color? textColor, VoidCallback? onTap}) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 16, color: textColor ?? Colors.black),
      ),
      onTap: onTap,
    );
  }
}
