import 'package:flutter/material.dart';

class CardComments extends StatelessWidget {
  final String logo;
  final Color? color;
  final Widget? child;
  final double? elevation;
  final double? radius;
  final Color? shadowColor;
  final String name;
  final String date;
  final String comment;

  CardComments({
    Key? key,
    this.elevation,
    this.shadowColor,
    this.color,
    this.child,
    required this.logo,
    required this.name,
    required this.date,
    required this.comment,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(radius ?? 10),
      elevation: elevation ?? 5,
      shadowColor: shadowColor ?? Colors.grey,
      color: color ?? Colors.white,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(logo),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            Text(
              date,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
              children: [
                TextSpan(text: comment),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
