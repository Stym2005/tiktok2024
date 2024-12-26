import 'package:flutter/material.dart';
import 'package:flutter_application_1/Profile/information/information.dart';

class Tikokabout extends StatefulWidget {
  @override
  _TikokaboutState createState() => _TikokaboutState();
}

class _TikokaboutState extends State<Tikokabout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'เกี่ยวกับเรา',
          style: TextStyle(fontSize: 20),
        ),
         centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Image and Title
            Stack(
              alignment: Alignment.center,
              children: [
                Image.network(
                  'https://lf-tt4b.tiktokcdn.com/obj/i18nblog/tt4b_cms/en-US/tipdilz7wysq-7guTLYnj7lsPZWx14vRGkp.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                ),
                const Positioned(
                  top: 10,
                  left: 10,
                  child: Text(
                    'Tiktok Shop',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Description Content
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'เกี่ยวกับเรา',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'TikTok Shop เป็นธุรกิจอีคอมเมิร์ซที่ใช้ TikTok ช่วยให้ผลิตภัณฑ์ของผู้ขายเข้าถึงผู้บริโภคได้โดยตรงผ่านฟังก์ชันแนะนำเนื้อหาที่น่าสนใจ ดอกเบี้ยชอปปิ้ง.',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'ร้าน TikTok เป็นเครื่องมืออีคอมเมิร์ซที่ ByteDance เปิดตัว มันเป็นวิธีการอีคอมเมิร์ซใหม่ล่าสุด มันผสานรวมแอพ TikTok และบัญชี TikTok สำหรับธุรกิจอย่างลึกซึ้ง',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'แตกต่างจากแพลตฟอร์มอีคอมเมิร์ซแบบดั้งเดิม เช่น Amazon, eBay ฯลฯ ร้านค้า TikTok ละทิ้งรูปแบบดั้งเดิมและอาศัยคำแนะนำและวิดีโอส่วนบุคคลแทนเพื่อรับปริมาณการเข้าชมเพื่อสร้าง Conversion',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  Text(
                    "แม้ว่าจะยังไม่แยกออกจากตรรกะพื้นฐานของอีคอมเมิร์ซแบบดั้งเดิม แต่ก็เป็นนวัตกรรมที่สำคัญในการพัฒนาอีคอมเมิร์ซในช่วงไม่กี่ปีที่ผ่านมา",
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  Text(
                    "ร้าน TikTok มีกลยุทธ์การจัดส่ง 3 แบบ ได้แก่ การจัดส่งแบบกำหนดเป้าหมาย การจัดส่งที่แม่นยำ และการจัดส่งอัตโนมัติ",
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  Text(
                    "การส่งมอบตามเป้าหมายคือการส่งมอบโฆษณาที่ตรงเป้าหมายไปยังผู้ใช้ TikTok ตามความต้องการของผู้ลงโฆษณา เพื่อปรับปรุงการแสดงผลและเอฟเฟกต์การส่งมอบของโฆษณา",
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  Text(
                    "การส่งมอบที่แม่นยำคือการใช้ข้อมูลผู้ใช้และพฤติกรรมพฤติกรรมและข้อมูลอื่น ๆ ของ TikTok เพื่อค้นหาและส่งมอบกลุ่มเป้าหมายได้แม่นยำยิ่งขึ้น เพื่อปรับปรุงความแม่นยำและประสิทธิผลของการโฆษณา",
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  Text(
                    "การจัดตำแหน่งอัตโนมัติช่วยให้ TikTok สามารถเลือกพารามิเตอร์ เช่น เวลาและตำแหน่งโฆษณา เพื่อเพิ่มประสิทธิภาพเอฟเฟกต์การโฆษณาและลดต้นทุนการโฆษณา",
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ],
              ),
            ),
            Information(),
          ],
        ),
      ),
    );
  }
}
