import 'package:flutter/material.dart';

class SettingsListTile extends StatelessWidget {
  final IconData icon;
  final Widget title;
  final VoidCallback onPressed;

  const SettingsListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.grey.shade600,
        size: 30,
      ),
      title: title,
      trailing: IconButton(
        onPressed: onPressed,
        icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
      ),
    );
  }
}
