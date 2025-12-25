import 'package:bz/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  IconData icon;
  String title;
  Widget widget;
  DrawerItem({
    super.key,
    required this.icon,
    required this.title,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            offset: Offset(0, 2),
            color: Colors.grey.withOpacity(0.1),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title, style: AppTextStyle().bodyLarge),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 17),
      ),
    );
  }
}
