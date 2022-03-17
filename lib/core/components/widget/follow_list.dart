import 'package:flutter/material.dart';

class FollowList extends StatelessWidget {
  final String name;
  final String surName;
  final String photoPath;
  final TextButton? button;
  final Widget? child;
  final String followTitle;

  const FollowList({
    Key? key,
    required this.name,
    required this.surName,
    required this.photoPath,
    this.button,
    this.child,
    required this.followTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(6.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                photoPath,
              ),
              radius: 23,
            ),
            title: Text(
              name + " " + surName,
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
              ),
            ),
            trailing: ElevatedButton(
              child: Text(followTitle),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF3949AB),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
