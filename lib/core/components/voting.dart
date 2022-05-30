import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../view/home/katki_ekrani.dart';
import 'like_button.dart';
import 'widget/dislike_button.dart';

class Voting extends StatefulWidget {
  final String placeName;
  final String categoryName;

  const Voting({
    Key? key,
    required this.placeName,
    required this.categoryName,
  }) : super(key: key);

  @override
  State<Voting> createState() => _VotingState();
}

class _VotingState extends State<Voting> {
  bool colorChangedLike = false;
  bool colorChangedDislike = false;
  final TestState ekle = TestState();
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.placeName,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.blue.shade300,
              radius: 19,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 18,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      ekle.addCardWidget();
                    });
                  },
                  child: Icon(CupertinoIcons.bookmark, color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.categoryName),
            SizedBox(height: 10),
            Row(
              children: [
                LikeButtons(),
                SizedBox(width: 3),
                DislikeButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
