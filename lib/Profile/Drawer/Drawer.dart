import 'package:flutter/material.dart';
import 'package:flutter_application_1/Profile/Drawer/widget/CheckInScreen.dart';
import 'package:flutter_application_1/Profile/Drawer/widget/CouponsPage.dart';
import 'package:flutter_application_1/Profile/Drawer/widget/aboutus.dart';
import 'package:flutter_application_1/Profile/Drawer/widget/live.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pink.shade400, Colors.pink.shade800],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'ชื่อผู้ใช้',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'ID: 123456',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
                Icons.event_available), // ใช้ไอคอน check_circle สำหรับเช็คอิน
            title: const Text('เช็คอิน'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CheckInScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.card_giftcard), // ใช้ไอคอนคูปอง
            title: const Text('คูปอง'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CouponsPage()));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
                Icons.location_on), // ใช้ไอคอนที่เกี่ยวข้องกับตำแหน่งที่ตั้ง
            title: const Text('ที่อยู่รับสินค้า'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Live()));
            },
          ),
          const ListTile(
            leading: Icon(
                Icons.gpp_maybe), // ใช้ไอคอนสำหรับข้อเสนอแนะหรือการร้องเรียน
            title: Text('ข้อเสนอแนะการร้องเรียน'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person), // ใช้ไอคอนเกี่ยวกับข้อมูล
            title: const Text('เกี่ยวกับเรา'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Tikokabout()));
            },
          ),
        ],
      ),
    );
  }
}
