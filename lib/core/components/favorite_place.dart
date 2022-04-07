import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Voting extends StatefulWidget {
  final String placeName;
  final String categoryName;

  final void Function()? onPressed;

  const Voting({
    Key? key,
    required this.placeName,
    required this.categoryName,
    this.onPressed,
  }) : super(key: key);

  @override
  State<Voting> createState() => _VotingState();
}

class _VotingState extends State<Voting> {
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
                child: IconButton(
                  onPressed: widget.onPressed,
                  icon: Icon(CupertinoIcons.bookmark, color: Colors.blue),
                  iconSize: 22,
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
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.thumb_up_alt_outlined),
                  color: Colors.blue,
                  iconSize: 30,
                ),
                SizedBox(width: 3),
                GestureDetector(
                  onTap: () {},
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.thumb_down_alt_outlined),
                    iconSize: 30,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
