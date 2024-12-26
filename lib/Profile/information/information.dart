import 'package:flutter/material.dart';

class Information extends StatefulWidget {
  const Information({super.key});

  @override
  _TikTokShopPageState createState() => _TikTokShopPageState();
}

class _TikTokShopPageState extends State<Information> {
  final TextEditingController _emailController = TextEditingController();
  bool _isEmailValid = true;

  void _onSubscribe() {
    setState(() {
      _isEmailValid = _emailController.text.contains('@');
    });
    if (_isEmailValid) {
      // Perform the subscription logic here
      print('Subscribed with email: ${_emailController.text}');
    } else {
      // Show a message if the email is invalid
      print('Invalid email');
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          _emailSubscriptionSection(),
          const SizedBox(height: 20),
          _serviceSection(),
          const SizedBox(height: 20),
          _footerSection(),
          const SizedBox(height: 20),
          _footerSection0(),
          const Divider(),
          const SizedBox(height: 20),
          _footerSection1(),
        ],
      ),
    );
  }

  Widget _emailSubscriptionSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('รับคูปองของคุณมากขึ้น',
              style: TextStyle(color: Color(0xFFE6005C), fontSize: 18)),
          const SizedBox(height: 10),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              hintText: 'อีเมลของคุณ',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: const Color.fromARGB(255, 209, 208, 208),
              errorText: !_isEmailValid ? 'กรุณากรอกอีเมลที่ถูกต้อง' : null,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: _onSubscribe,
            child: const Text('สมัครสมาชิก'),
          ),
        ],
      ),
    );
  }

  Widget _serviceSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _serviceColumn(
            'บริการลูกค้า',
            [
              'บริการออนไลน์',
              'ติดต่อเรา',
              'ดาวน์โหลดแอพ (ฝั่งผู้ซื้อ)',
              'ดาวน์โหลดแอพ (ฝั่งผู้ขาย)'
            ],
          ),
          _serviceColumn(
            'การคืนสินค้าและการแลกเปลี่ยน',
            [
              'นโยบายความเป็นส่วนตัว',
              'นโยบายการคืนสินค้า',
              'จัดส่งและรับของ',
              'นโยบายผู้ขาย'
            ],
          ),
        ],
      ),
    );
  }

  Widget _serviceColumn(String title, List<String> items) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(fontSize: 16, color: Color(0xFFE6005C))),
          const SizedBox(height: 10),
          for (var item in items)
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(item, style: const TextStyle(fontSize: 14)),
            ),
        ],
      ),
    );
  }

  Widget _footerSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _serviceColumn('ศุุนย์ผู้ใช้', [
            'การลงทะเบียน',
            'หารติดตามคำสั่งชื้อสินค้า',
            'คอลเลกชันสินค้า',
            'กระเป๋าสตางของฉัน',
          ]),
          _serviceColumn(
            'เกี่ยวกับเรา',
            [
              'เกี่ยวกับเรา',
              'รับสมัครสมาชิก',
              'ข่าวสาร',
              'ติดต่อเรา',
            ],
          ),
        ],
      ),
    );
  }

  Widget _footerSection0() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tiktok shop',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              // Updated the color to a valid format
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Tiktok shop ผู้ใช้เว็บไซต์ทั่วโลกมากกว่า 103 ประเทศทั่วโลก\n'
            'และใช้ USDT/ETH/BTC ในการชำระบัญชี USDT/ETH/BTC\n'
            'เป็นวิธีการทำธุรกรรมแบบไร้พรมแดนที่ช่วยให้สามารถทำธุรกรรม\n'
            'ด้วยต้นทุนต่ำทั่วโลกได้ทันที ไม่ต้องรอ และไม่มีค่าธรรมเนียม\n'
            'ระหว่างประเทศ',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey, // Updated the color to a valid format
            ),
          ),
        ],
      ),
    );
  }

  Widget _footerSection1() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ByteDance Technology Co., Ltd. 2012 สงวนลิขสิทธิ์',
            style: TextStyle(color: Colors.grey[600], fontSize: 12),
          ),
          const SizedBox(height: 10),
          Text(
            'เข้าร่วมอีคอมเมิร์ซของ TikTok เพื่อกระตุ้นความสนใจและเข้าไปสู่การเติบโต TikTok มีผู้ใช้งานมากกว่า 600 ล้านรายต่อวัน:',
            style: TextStyle(color: Colors.grey[600], fontSize: 14),
          ),
          const SizedBox(height: 10),
          Text(
            '1. ปรับมาใช้ที่ปรับขนาดได้ (ระบุบนเนื้อหา) ที่เจริญรุ่งเรือง\n'
            '2. ความสามารถทางการตลาดชั้นนำ\n'
            '3. ลดความซับซ้อนของการจัดการคำสั่งซื้อที่ควบคุม\n'
            '4. การทำงานแบบครบวงจรแบบครบวงจร',
            style: TextStyle(color: Colors.grey[600], fontSize: 14),
          ),
        ],
      ),
    );
  }
}
