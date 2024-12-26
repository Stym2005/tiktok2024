import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home/cart/cart.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  String language = 'EN'; // Default language

  void changeLanguage() {
    setState(() {
      // Toggle between EN and another language (e.g., 'TH')
      language = (language == 'EN') ? 'TH' : 'EN';
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 241, 188, 211), // สีแรกที่ด้านบน
              Color.fromARGB(255, 252, 252, 252), // สีที่ด้านล่าง
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
          ),
        ),
      ),
      title: Row(
        children: [
          // Search Box
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'ค้นหา...',
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          const SizedBox(width: 10),
          // Language Selector
          TextButton(
            onPressed: () {
              changeLanguage(); // Call the method to change the language
            },
            child: Text(
              language, // Show current language (EN or TH)
              style: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(width: 10),
          // Tea Bag Icon
          IconButton(
            icon: Image.asset(
              'assets/icons/card.png',
              height: 35, // Set the size of the icon as required
              width: 35,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TikTokCart()),
              );
            },
          ),
        ],
      ),
    );
  }
}
