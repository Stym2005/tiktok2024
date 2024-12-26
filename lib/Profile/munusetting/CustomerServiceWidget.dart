import 'package:flutter/material.dart';
import 'package:flutter_application_1/Profile/munusetting/settingtiktok/SettingsPage.dart';
import 'package:flutter_application_1/Profile/munusetting/help.dart';

class CustomerServiceWidget extends StatefulWidget {
  const CustomerServiceWidget({Key? key}) : super(key: key);

  @override
  State<CustomerServiceWidget> createState() => _CustomerServiceWidgetState();
}

class _CustomerServiceWidgetState extends State<CustomerServiceWidget> {
  void _handleTileTap(String title) {
    setState(() {
      print('$title tapped!');
    });

    // Example: Navigate to a new page
    // Navigator.push(context, MaterialPageRoute(builder: (_) => SomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0), // Changed for better visuals
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5.0,
            spreadRadius: 2.0,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          CustomListTile(
            icon: Icons.headset_mic_outlined,
            title: 'Customer service',
            onTap: () => _handleTileTap('Customer service'),
          ),
          const Divider(height: 1),
          CustomListTile(
            icon: Icons.help_outline,
            title: 'Help',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Help()),
              );
            },
          ),
          const Divider(height: 1),
          CustomListTile(
            image: Image.asset(
              'assets/icons/my-pingjia.png', // Replace with your icon's path
              width: 24,
              height: 24,
            ),
            title: 'Comments',
            onTap: () => _handleTileTap('Comments'),
          ),
          const Divider(height: 1),
          CustomListTile(
            icon: Icons.settings_outlined,
            title: 'Settings',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final IconData? icon;
  final Image? image;
  final String title;
  final VoidCallback onTap;

  const CustomListTile({
    Key? key,
    this.icon,
    this.image,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon != null
          ? Icon(
              icon,
              size: 24.0,
              color: Colors.black87,
            )
          : image, // Displays the image if `icon` is null
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16.0,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
    );
  }
}
