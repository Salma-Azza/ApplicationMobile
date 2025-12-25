import 'package:bz/utils/app_text_style.dart';
import 'package:bz/utils/helpes.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  String name;
  String email;
  ContactItem({super.key, required this.name, required this.email});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1),
      ),
      child: ListTile(
        title: Text("Name: $name"),
        subtitle: Row(
          children: [
            Text('Email: '),
            InkWell(
              onTap: () => openEmail(email),
              child: Text(
                email,
                style:
                    AppTextStyle.withColor(
                      AppTextStyle().bodyLarge,
                      Colors.blueAccent,
                    ).copyWith(
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationColor: Colors.blueAccent,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
