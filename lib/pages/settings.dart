import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widgets/components/settings_listTile.dart';

import '../model/user_preferences.dart';
import '../view/profil_ekrani.dart';
import 'edit_profile_page.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String data = '';
  fetchFileData() async {
    String responseText;
    responseText = await rootBundle.loadString('assets/gizlilk.txt');
    setState(() {
      data = responseText;
    });
  }

  @override
  void initState() {
    fetchFileData();
    super.initState();
    // Add code after super
  }

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
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 15.0, bottom: 8),
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
              height: 270,
              child: Column(
                children: [
                  SizedBox(height: 15),
                  SettingsListTile(
                    icon: Icons.language_outlined,
                    title: Text('Language'),
                    onPressed: () {},
                  ),
                  SettingsListTile(
                    icon: CupertinoIcons.shield_fill,
                    title: Text('Privacy'),
                    onPressed: () {
                      showMyDialog(context);
                    },
                  ),
                  SettingsListTile(
                    icon: CupertinoIcons.question_circle,
                    title: Text('Help & Support'),
                    onPressed: () {},
                  ),
                  SettingsListTile(
                    icon: CupertinoIcons.person_add_solid,
                    title: Text('Invite a Friend'),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> showMyDialog(BuildContext context) => showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return ListView(
            children: [
              AlertDialog(
                title: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                    children: [
                      TextSpan(text: data),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Kabul Ediyorum')),
                ],
              ),
            ],
          );
        },
      );
}
