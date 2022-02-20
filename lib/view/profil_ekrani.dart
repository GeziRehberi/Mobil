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
      'https://pbs.twimg.com/profile_images/1408322029061824512/7oNDK2Tb_400x400.jpg';

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final user = UserPreferences.myUser;
    final user = UserPreferences.getUser();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Nuri Ülgen',
            style: TextStyle(color: Colors.black),
          ),
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
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(_logo),
                              radius: 50,
                            ),
                            const SizedBox(width: 20),
                            NumbersWidget(),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Container(
                          width: 360,
                          child: ElevatedButton(
                            child: Text('Takip Et'),
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.grey,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  delegate: _SliverAppBarDelegate(
                    const TabBar(
                      labelColor: Colors.black87,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(
                          icon: Icon(
                            Icons.message,
                            size: 30,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            CupertinoIcons.star_fill,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  pinned: true,
                ),
              ];
            },
            body: Container(
              width: double.infinity,
              height: 400,
              child: TabBarView(
                children: [
                  // yorumlarım bölümü

                  //favori mekanlar bölümü
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
      color: Colors.white,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
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
