import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/user_preferences.dart';
import '../view/profil_ekrani.dart';
import 'edit_profile_page.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();
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
            padding: const EdgeInsets.only(top: 3.0, left: 12.0, right: 12.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              height: 280,
              child: Column(
                children: [
                  SizedBox(height: 15),
                  ProfileWidget(
                    imagePath: user.imagePath,
                    onClicked: () {},
                  ),
                  const SizedBox(height: 20),
                  buildName(user),
                  Container(
                    width: 170,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => EditProfilePage()),
                        );
                      },
                      child: Text('Edit Profile'),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 15.0, bottom: 2),
            child: Text(
              'Settings',
              style: TextStyle(fontSize: 18, color: Colors.grey.shade800),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0, left: 12.0, right: 12.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
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
