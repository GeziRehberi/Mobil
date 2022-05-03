import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../core/components/voting.dart';
import '../../core/init/network/http_service.dart';
import '../../core/init/network/post_model.dart';

class OylamaSayfasi extends StatefulWidget {
  const OylamaSayfasi({Key? key}) : super(key: key);

  @override
  _OylamaSayfasiState createState() => _OylamaSayfasiState();
}

class _OylamaSayfasiState extends State<OylamaSayfasi> {
  final HttpService httpService = HttpService();
  final String urlVotingVisitPlaces =
      dotenv.env['urlVotingVisitPlaces'] ?? 'API_KEY not found';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Oylama',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: httpService.getPosts(urlVotingVisitPlaces),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            var postList = snapshot.data!;
            return ListView.builder(
                itemCount: postList.length,
                itemBuilder: (context, index) {
                  return Voting(
                    placeName: postList[index].visitPlace,
                    categoryName: postList[index].createdAt,
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
