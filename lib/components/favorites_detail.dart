import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

import 'card_favorites.dart';
import 'icons.dart';
import 'widget/favorite_listTile.dart';

class FavoriteDetailPage extends StatelessWidget {
  final secilenYer;
  final String? name;
  final String? description;
  final String? hours;
  final String? address;
  final String? category;
  final int? price;
  final List<String>? imagePaths;

  const FavoriteDetailPage(
      {Key? key,
      required this.secilenYer,
      this.name,
      this.description,
      this.hours,
      this.address,
      this.category,
      this.price,
      this.imagePaths})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    CardFavorites cardFavorites;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "https://im.haberturk.com/2020/02/25/ver1582697783/2595195_1200x627.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Galata Kulesi',
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "#Tarihi Yer",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleIcon(
                              circleIcon: CupertinoIcons.arrow_up_right_diamond,
                              text: "Yol Tarifi",
                            ),
                            CircleIcon(
                              circleIcon: CupertinoIcons.bookmark,
                              text: "Kaydet",
                            ),
                            CircleIcon(
                              circleIcon: Icons.add,
                              text: "Yol Tarifi",
                            ),
                            CircleIcon(
                              circleIcon: CupertinoIcons.share,
                              text: "Paylaş",
                            ),
                          ],
                        ),
                        Divider(height: 25, thickness: 1.0),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                            children: [
                              TextSpan(
                                  text:
                                      'En üst katındaki restoranıyla boğaza tepeden'
                                      ' bakan, restore edilmiş 5. yüzyıl kulesi ve eski zindan.'),
                            ],
                          ),
                        ),
                        Divider(height: 25, thickness: 1.0),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FavoriteListTile(
                          icon: CupertinoIcons.location,
                          title:
                              'Bereketzade, Galata Kulesi, 34421 Beyoğlu/İstanbul',
                        ),
                        FavoriteListTile(
                          icon: CupertinoIcons.clock,
                          title: 'Çalışma saatleri: $hours',
                        ),
                        FavoriteListTile(
                          icon: Icons.money,
                          title: 'Fiyat: $price',
                        ),
                      ],
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
