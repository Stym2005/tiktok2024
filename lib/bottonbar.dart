import 'package:flutter/material.dart';
import 'package:flutter_application_1/product/Porductnext.dart';
import 'package:flutter_application_1/Profile/Profile.dart';
import 'package:flutter_application_1/Home/home.dart';
import 'package:flutter_application_1/market/shop.dart';

class BottomBar extends StatefulWidget {
  final int initialIndex; // Add an initial index

  const BottomBar({Key? key, this.initialIndex = 0})
      : super(key: key); // Default to index 0

  @override
  // ignore: library_private_types_in_public_api
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  late int _selectedIndex; // Use a dynamic initial index
  final List<Widget> _screens = <Widget>[
    const Home(),
    const Porductnext(),
    const ShopHomePage(),
    const Profile(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex; // Set initial index from the widget
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 30,
              height: 30,
              child: Image.asset(
                'assets/icons/my-kaidian.png',
              ),
            ),
            label: 'Product',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 30,
              height: 30,
              child: Image.asset(
                _selectedIndex == 2
                    ? 'assets/icons/Money.png'
                    : 'assets/icons/money1.png',
              ),
            ),
            label: 'Market',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Mine',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFFFF0050),
        unselectedItemColor: Colors.white.withOpacity(0.6),
        backgroundColor: Colors.black,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        iconSize: 28,
        onTap: _onItemTapped,
        elevation: 10,
      ),
    );
  }
}
