import 'package:flutter/material.dart';

import '../components/widget/appBar_widget.dart';
import '../components/widget/follow_list.dart';

class FollowersPage extends StatefulWidget {
  const FollowersPage({Key? key}) : super(key: key);

  @override
  _FollowersPageState createState() => _FollowersPageState();
}

class _FollowersPageState extends State<FollowersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Takipçiler'),
      body: ListView(children: [
        FollowList(
          name: 'Nuri',
          surName: 'Ulgen',
          photoPath: '',
          followTitle: 'Takip Et',
        ),
        FollowList(
          name: 'Nuri',
          surName: 'Ulgen',
          photoPath: '',
          followTitle: 'Takip Ediliyor',
        ),
        FollowList(
          name: 'Nuri',
          surName: 'Ulgen',
          photoPath: '',
          followTitle: 'Takip Et',
        ),
      ]),
    );
  }
}
