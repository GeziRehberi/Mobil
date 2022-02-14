import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/login_pages/giris_yap_ekrani.dart';
import 'package:flutter_widgets/model/user.dart';
import 'package:flutter_widgets/model/user_preferences.dart';
import 'package:flutter_widgets/pages/edit_profile_page.dart';

class ProfilSayfasi extends StatefulWidget {
  const ProfilSayfasi({Key? key}) : super(key: key);

  @override
  _ProfilSayfasiState createState() => _ProfilSayfasiState();
}

class _ProfilSayfasiState extends State<ProfilSayfasi> {
  final icon = CupertinoIcons.moon_stars;

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showMyDialog(context);
        return shouldPop ?? false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(icon, color: Colors.black, size: 30),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                imagePath: user.imagePath,
                onClicked: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => EditProfilePage()));
                },
              ),
              const SizedBox(height: 24),
              buildName(user),
              const SizedBox(height: 20),
              NumbersWidget(),
              const SizedBox(height: 15),
              ListTile(
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
              const SizedBox(height: 10),
              ListTile(
                title: const Text(
                  'Send Feedback',
                  style: TextStyle(color: Colors.black),
                ),
                leading: const CircleAvatar(
                  backgroundColor: Colors.purpleAccent,
                  child: Icon(Icons.messenger_outlined),
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
              const SizedBox(height: 10),
              ListTile(
                title: const Text(
                  'Report a Bug',
                  style: TextStyle(color: Colors.black),
                ),
                leading: const CircleAvatar(
                  backgroundColor: Colors.teal,
                  child: Icon(Icons.bug_report),
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
              const SizedBox(height: 10),
              ListTile(
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
            ],
          ),
        ),
      ),
    );
  }

  Future<bool?> showMyDialog(BuildContext context) => showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Emin Misin?'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text('Hayır')),
              TextButton(
                  onPressed: () {
                    //Giriş yap sayfasına yönlendirir ve geriye dönmesini engeller
                    Navigator.of(context).pushAndRemoveUntil(
                      CupertinoPageRoute(
                          builder: (context) => GirisYapEkrani()),
                      (_) => false,
                    );
                    /*SystemChannels.platform.invokeMethod(
                        'SystemNavigator.pop');*/ //evet butonuna basınca direkt uygulamadan çıkış yapıyor
                  },
                  child: const Text('Evet')),
            ],
          );
        },
      );
}

Widget buildName(User user) => Column(
      children: [
        Text(
          user.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 4),
        Text(
          user.email,
          style: TextStyle(color: Colors.grey),
        )
      ],
    );

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final bool isEdit;
  final VoidCallback onClicked;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
    this.isEdit = false,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(color),
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    final image = NetworkImage(imagePath);

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(onTap: onClicked),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 8,
          child: Icon(
            isEdit ? Icons.add_a_photo : Icons.edit,
            color: Colors.white,
            size: 20,
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}

class NumbersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildButton(context, '13', 'Yorumlarım'),
          buildDivider(),
          buildButton(context, '35', 'Takip'),
          buildDivider(),
          buildButton(context, '82', 'Takipçiler'),
        ],
      );
  Widget buildDivider() => Container(
        height: 32,
        child: VerticalDivider(),
      );

  Widget buildButton(BuildContext context, String value, String text) =>
      MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              value,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 2),
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
}
