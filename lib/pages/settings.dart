import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4.0, left: 12.0, right: 12.0),
            child: Container(
              color: Colors.white,
              height: 280,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 12.0, bottom: 2),
            child: Text(
              'Settings',
              style: TextStyle(fontSize: 18, color: Colors.grey.shade800),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0, left: 12.0, right: 12.0),
            child: Container(
              color: Colors.white,
              height: 280,
              child: Column(
                children: [
                  SizedBox(height: 15),
                  ListTile(
                    leading: Icon(
                      Icons.language_outlined,
                      color: Colors.grey.shade600,
                      size: 30,
                    ),
                    title: Text('Language'),
                    trailing: IconButton(
                      icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
                      onPressed: () {},
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      CupertinoIcons.shield_fill,
                      color: Colors.grey.shade600,
                      size: 30,
                    ),
                    title: const Text(
                      'Privacy',
                      style: TextStyle(color: Colors.black),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
                      onPressed: () {},
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      CupertinoIcons.question_circle,
                      color: Colors.grey.shade600,
                      size: 30,
                    ),
                    title: const Text(
                      'Help & Support',
                      style: TextStyle(color: Colors.black),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
                      onPressed: () {},
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      CupertinoIcons.person_add_solid,
                      color: Colors.grey.shade600,
                      size: 30,
                    ),
                    title: const Text(
                      'Invite a Friend',
                      style: TextStyle(color: Colors.black),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 57,
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Color(0xA0A4BFFF),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Icon(CupertinoIcons.person),
                  ),
                  title: const Text(
                    'Account Settings',
                    style: TextStyle(color: Colors.black),
                  ),
                  subtitle: const Text(
                    'Privacy,Language',
                    style: TextStyle(color: Colors.black, fontSize: 11),
                  ),
                  trailing: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.transparent,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios,
                          size: 17, color: Colors.black),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                height: 55,
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Color(0xA0A4BFFF),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ListTile(
                  title: const Text(
                    'Privacy',
                    style: TextStyle(color: Colors.black),
                  ),
                  leading: const CircleAvatar(
                    backgroundColor: Colors.purpleAccent,
                    child: Icon(CupertinoIcons.shield_fill),
                  ),
                  trailing: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.transparent,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios,
                          size: 17, color: Colors.black),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                height: 55,
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Color(0xA0A4BFFF),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ListTile(
                  title: const Text(
                    'Help & Support',
                    style: TextStyle(color: Colors.black),
                  ),
                  leading: const CircleAvatar(
                    backgroundColor: Colors.teal,
                    child: Icon(CupertinoIcons.question_circle),
                  ),
                  trailing: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.transparent,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios,
                          size: 17, color: Colors.black),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                height: 55,
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Color(0xA0A4BFFF),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ListTile(
                  title: const Text(
                    'Invite a Friend',
                    style: TextStyle(color: Colors.black),
                  ),
                  leading: const CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    child: Icon(CupertinoIcons.person_add_solid),
                  ),
                  trailing: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.transparent,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios,
                          size: 17, color: Colors.black),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                height: 55,
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Color(0xA0A4BFFF),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ListTile(
                  title: const Text(
                    'Logout',
                    style: TextStyle(color: Colors.black),
                  ),
                  leading: const CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.logout),
                  ),
                  trailing: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.transparent,
                    ),
                    child: IconButton(
                      onPressed: () {
                        showMyDialog(context);
                      },
                      icon: Icon(Icons.arrow_forward_ios,
                          size: 17, color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
 */
