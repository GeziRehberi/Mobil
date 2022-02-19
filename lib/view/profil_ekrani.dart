import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/model/user.dart';
import 'package:flutter_widgets/model/user_preferences.dart';

import '../pages/settings.dart';

class ProfilSayfasi extends StatefulWidget {
  const ProfilSayfasi({Key? key}) : super(key: key);

  @override
  _ProfilSayfasiState createState() => _ProfilSayfasiState();
}

class _ProfilSayfasiState extends State<ProfilSayfasi>
    with TickerProviderStateMixin {
  final icon = CupertinoIcons.moon_stars;
  late final TabController _tabController;
  String _logo =
      'https://cdn.pixabay.com/photo/2016/11/22/23/44/porsche-1851246_960_720.jpg';

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final user = UserPreferences.myUser;
    final user = UserPreferences.getUser();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black, size: 30),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Settings()));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(_logo),
                  radius: 50,
                ),
                const SizedBox(width: 15),
                Column(
                  children: [
                    buildName(user),
                    const SizedBox(height: 10),
                    NumbersWidget(),
                  ],
                )
              ],
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              child: Text('Takip Et'),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              child: TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                controller: _tabController,
                tabs: [
                  Tab(
                    icon: Icon(Icons.message),
                  ),
                  Tab(
                    icon: Icon(Icons.favorite),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.favorite,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 400,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Card(
                          elevation: 5,
                          shadowColor: Colors.grey,
                          color: Colors.white,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(_logo),
                              radius: 30,
                            ),
                            title: const Text('Nuri Ülgen'),
                            subtitle: const Text(
                                'Add Favorite Add FavoriteAdd FavoriteAdd FavoriteteAdd FavoriteAdd FavoriteAdd Favorite'),
                            trailing: const Text('15 m'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            contentPadding: const EdgeInsets.only(left: 8),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(),
                          child: Card(
                            elevation: 5,
                            shadowColor: Colors.grey,
                            color: Colors.white,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(_logo),
                                radius: 30,
                              ),
                              title: const Text('Nuri Ülgen'),
                              subtitle: const Text(
                                  'Add Favorite Add FavoriteAdd FavoriteAdd FavoriteteAdd FavoriteAdd FavoriteAdd Favorite'),
                              trailing: const Text('15 m'),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              contentPadding: const EdgeInsets.only(left: 8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text('hi'),
                  Text('hi'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildName(User user) => Column(
      children: [
        Text(
          user.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ],
    );

class NumbersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
