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
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      left: 2.0,
                      right: 2.0,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25)),
                            child: Card(
                              elevation: 5,
                              shadowColor: Colors.grey,
                              color: Colors.white,
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(_logo),
                                ),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '@Nuri Ulgen',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      '18 hour',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                        ),
                                        children: [
                                          TextSpan(
                                              text:
                                                  'Contrary to popular belief, Lorem Ipsum is not simply random text.'
                                                  ' It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.'),
                                        ]),
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
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
                                ),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '@Nuri Ulgen',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      '7 minute',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                        ),
                                        children: [
                                          TextSpan(
                                              text:
                                                  'There are many variations of passages of Lorem Ipsum available, '
                                                  'but the majority have suffered alteration in some form, by injected humour, or randomised words which.'),
                                        ]),
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Card(
                              elevation: 5,
                              shadowColor: Colors.grey,
                              color: Colors.white,
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(_logo),
                                ),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '@Nuri Ulgen',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      'right now',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                        ),
                                        children: [
                                          TextSpan(
                                              text:
                                                  'Various versions have evolved over the years, sometimes by accident, '
                                                  'sometimes on purpose (injected humour and the like).'),
                                        ]),
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //favori mekanlar bölümü
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(),
                          child: Card(
                            elevation: 5,
                            shadowColor: Colors.grey,
                            color: Colors.white,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://i4.hurimg.com/i/hurriyet/75/0x0/5f19d22bc9de3d25681fae31.jpg'),
                              ),
                              title: Text(
                                'Ayasofya Müzesi',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                              color: Colors.grey.shade600,
                                            ),
                                            children: [
                                              TextSpan(
                                                  text:
                                                      'Ayasofya veya resmî ismiyle Ayasofya-i Kebîr Câmi-i Şerîfi, eski ismiyle Ayasofya Kilisesi veya Ayasofya Müzesi,'
                                                      'İstanbul da yer alan bir cami, eski bazilika, katedral ve müze.'),
                                            ]),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Çalışma Saatleri:24 saat açık',
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 13),
                                      )
                                    ],
                                  )),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
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
                                backgroundImage: NetworkImage(
                                    'https://www.gezilesiyer.com/wp-content/uploads/2018/12/topkapi-sarayi-03.jpg'),
                              ),
                              title: Text(
                                'Topkapı Sarayı',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                              color: Colors.grey.shade600,
                                            ),
                                            children: [
                                              TextSpan(
                                                  text:
                                                      'Topkapı Sarayı, İstanbul Sarayburnu nda, Osmanlı İmparatorluğu nun 600 yıllık tarihinin 400 yılı boyunca,'
                                                      ' devletin idare merkezi olarak kullanılan ve Osmanlı padişahlarının yaşadığı saraydır. '
                                                      'Bir zamanlar içinde 4.000e yakın insan yaşamıştır..'),
                                            ]),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Çalışma Saatleri:10:00–16:00',
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 13),
                                      )
                                    ],
                                  )),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
