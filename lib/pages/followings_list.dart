import 'package:flutter/material.dart';

import '../components/widget/appBar_widget.dart';
import '../components/widget/follow_list.dart';

class FollowingsPage extends StatefulWidget {
  const FollowingsPage({Key? key}) : super(key: key);

  @override
  _FollowingsPageState createState() => _FollowingsPageState();
}

class _FollowingsPageState extends State<FollowingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Takip Edilenler'),
      body: ListView(children: [
        FollowList(
          name: 'Nuri',
          surName: 'Ulgen',
          photoPath: '',
          followTitle: 'Takip Ediliyor',
        ),
        FollowList(
          name: 'Mia',
          surName: 'Wong',
          photoPath: '',
          followTitle: 'Takip Ediliyor',
        ),
        FollowList(
          name: 'Jane',
          surName: 'Meldrum',
          photoPath: '',
          followTitle: 'Takip Ediliyor',
        ),
      ]),
    );
  }
}
