import 'package:flutter/material.dart';

void showDeleteConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('ยืนยันการลบบัญชี'),
        content: Text('คุณต้องการลบบัญชีนี้ออกจากระบบหรือไม่?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // ปิดป๊อปอัพ
            },
            child: Text('ยกเลิก'),
          ),
          TextButton(
            onPressed: () {
              // ลบบัญชีหรือทำการที่ต้องการที่นี่
              Navigator.of(context).pop(); // ปิดป๊อปอัพ
              // แสดงข้อความหรือดำเนินการอื่น
            },
            child: Text('ยืนยัน'),
          ),
        ],
      );
    },
  );
}
