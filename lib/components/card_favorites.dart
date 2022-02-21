import 'package:flutter/material.dart';

class CardFavorites extends StatelessWidget {
  final String resimUrl;
  final Color? color;
  final Widget? child;
  final double? elevation;
  final double? radius;
  final Color? shadowColor;
  final String placeName;

  final String comment;
  final String workingHours;

  CardFavorites(
      {Key? key,
      this.elevation,
      this.shadowColor,
      this.color,
      this.child,
      this.radius,
      required this.resimUrl,
      required this.placeName,
      required this.comment,
      required this.workingHours})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(radius ?? 10),
      elevation: elevation ?? 5,
      shadowColor: shadowColor ?? Colors.grey,
      color: color ?? Colors.white,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(resimUrl),
        ),
        title: Text(
          placeName,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        subtitle: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                      children: [
                        TextSpan(text: comment),
                      ]),
                ),
                SizedBox(height: 5),
                Text(
                  workingHours,
                  style: TextStyle(color: Colors.black87, fontSize: 13),
                )
              ],
            )),
      ),
    );
  }
}
