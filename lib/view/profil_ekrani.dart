import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/components/card_favorites.dart';
import 'package:flutter_widgets/model/user_preferences.dart';

import '../authentication/login/giris_yap_ekrani.dart';
import '../components/card_comments.dart';
import '../components/widget/numbers_widget.dart';
import '../components/widget/profile_widget.dart';
import '../data/menu_items.dart';
import '../model/menu_item.dart';
import '../pages/edit_profile_page.dart';
import '../pages/settings.dart';

class ProfilSayfasi extends StatefulWidget {
  const ProfilSayfasi({Key? key}) : super(key: key);

  @override
  _ProfilSayfasiState createState() => _ProfilSayfasiState();
}

class _ProfilSayfasiState extends State<ProfilSayfasi>
    with TickerProviderStateMixin {
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
    final user = UserPreferences.getUser();

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) => SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Text(
                'Nuri Ülgen',
                style: TextStyle(color: Colors.black),
              ),
              iconTheme: IconThemeData(color: Colors.black),
              elevation: 0,
              actions: [
                PopupMenuButton<MenuItem>(
                  onSelected: (item) => onSelected(context, item),
                  itemBuilder: (context) => [
                    ...MenuItems.itemFirst.map(buildItem).toList(),
                    PopupMenuDivider(),
                    ...MenuItems.itemSecond.map(buildItem).toList(),
                  ],
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
                                ProfileWidget(
                                  imagePath: user.imagePath,
                                  onClicked: () async {
                                    await Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditProfilePage()),
                                    );
                                    setState(() {});
                                  },
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
                        TabBar(
                          controller: _tabController,
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
                    controller: _tabController,
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
                              CardComments(
                                logo:
                                    'https://pbs.twimg.com/profile_images/1408322029061824512/7oNDK2Tb_400x400.jpg',
                                name: 'Nuri',
                                comment:
                                    'There are many variations of passages of Lorem Ipsum available, '
                                    'but the majority have suffered alteration in some form, by injected humour, or randomised words which.',
                                date: '1 m ago',
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              CardComments(
                                logo:
                                    'https://pbs.twimg.com/profile_images/1408322029061824512/7oNDK2Tb_400x400.jpg',
                                name: 'Nuri',
                                comment:
                                    'Various versions have evolved over the years, sometimes by accident, '
                                    'sometimes on purpose (injected humour and the like).',
                                date: 'right now',
                              ),
                            ],
                          ),
                        ),
                      ),
                      //favori mekanlar bölümü
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              CardFavorites(
                                placeName: 'Galata Kulesi',
                                resimUrl:
                                    'https://im.haberturk.com/2020/02/25/ver1582697783/2595195_1200x627.jpg',
                                descriptionCard:
                                    'Topkapı Sarayı, İstanbul Sarayburnu nda, Osmanlı İmparatorluğu nun 600 yıllık tarihinin 400 yılı boyunca,'
                                    ' devletin idare merkezi olarak kullanılan ve Osmanlı padişahlarının yaşadığı saraydır. '
                                    'Bir zamanlar içinde 4.000e yakın insan yaşamıştır..',
                                workingHours: 'Çalışma Saatleri: 10:00–16:00',
                                addressCard:
                                    'Bereketzade, Galata Kulesi, 34421 Beyoğlu/İstanbul',
                                categoryCard: 'Tarihi Yer',
                                priceCard: '100 tl',
                              ),
                              SizedBox(height: 15),
                              CardFavorites(
                                placeName: 'Ayasofya',
                                resimUrl:
                                    'https://i4.hurimg.com/i/hurriyet/75/0x0/5f19d22bc9de3d25681fae31.jpg',
                                descriptionCard:
                                    'Ayasofya veya resmî ismiyle Ayasofya-i Kebîr Câmi-i Şerîfi, eski ismiyle Ayasofya Kilisesi veya Ayasofya Müzesi,'
                                    'İstanbul da yer alan bir cami, eski bazilika, katedral ve müze.',
                                workingHours: 'Çalışma Saatleri: 24 saat açık',
                                addressCard: 'Fatih/İstanbul',
                                categoryCard: 'Cami/Müze',
                                priceCard: 'Ücretsiz',
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem<MenuItem>(
        value: item,
        child: Row(
          children: [
            Icon(item.icon, color: Colors.black, size: 20),
            const SizedBox(width: 12),
            Text(item.text),
          ],
        ),
      );

  onSelected(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.itemSettings:
        Navigator.push(context, MaterialPageRoute(builder: (_) => Settings()));
        break;
      case MenuItems.itemSignOut:
        showMyDialog(context);
    }
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

Future<bool?> showMyDialog(BuildContext context) => showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Çıkış yapmak istediğinizden emin misiniz?',
            style: TextStyle(color: Colors.grey),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: const Text('VAZGEÇ')),
            TextButton(
                onPressed: () {
                  //Giriş yap sayfasına yönlendirir ve geriye dönmesini engeller
                  Navigator.of(context).pushAndRemoveUntil(
                    CupertinoPageRoute(builder: (context) => GirisYapEkrani()),
                    (_) => false,
                  );
                  /*SystemChannels.platform.invokeMethod(
                        'SystemNavigator.pop');*/ //evet butonuna basınca direkt uygulamadan çıkış yapıyor
                },
                child: const Text('ÇIKIŞ YAP')),
          ],
        );
      },
    );
