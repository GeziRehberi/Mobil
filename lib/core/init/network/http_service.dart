import 'dart:convert';

import 'package:http/http.dart';

import 'model/comments_model.dart';
import 'model/voting_visit_places_model.dart';

class HttpService {
  Future<List<Post>> getPosts(String url) async {
    var response = await get(Uri.parse(url),
        headers: {"Content-type": "application/json"});
    print(response);
    print(response.body);
    if (response.statusCode == 200) {
      List<dynamic> jsonBody = jsonDecode(response.body);
      List<Post> posts =
          jsonBody.map((dynamic item) => Post.fromMap(item)).toList();
      return posts;
    } else {
      throw Exception('Request failed with status: ${response.statusCode}');
    }
  }

  Future<List<Comments>> getComments(String url) async {
    var response = await get(Uri.parse(url),
        headers: {"Content-type": "application/json"});
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      List<dynamic> jsonBody = jsonDecode(response.body);
      List<Comments> posts =
          jsonBody.map((dynamic item) => Comments.fromMap(item)).toList();
      return posts;
    } else {
      throw Exception('Request failed with status: ${response.statusCode}');
    }
  }
}
