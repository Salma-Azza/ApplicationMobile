import 'package:flutter/material.dart';

class DismissibleItem extends StatelessWidget {
  final Widget child;
  ConfirmDismissCallback confirmDismiss;
  int id;
  DismissibleItem({
    super.key,
    required this.id,
    required this.child,
    required this.confirmDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(id.toString()),
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.red,
        ),
        padding: EdgeInsets.only(left: 20),
        // margin: EdgeInsets.all(12),
        alignment: Alignment.centerLeft,
        child: Icon(Icons.delete, color: Colors.white),
      ),
      secondaryBackground: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.orangeAccent,
        ),
        padding: EdgeInsets.only(right: 20),
        alignment: Alignment.centerRight,
        child: Icon(Icons.edit_outlined, color: Colors.white),
      ),
      confirmDismiss: confirmDismiss,
      child: child,
    );
  }
}
