import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:test_meet2go/environments/environment.dart';
import 'package:test_meet2go/models/blog_model.dart';

class BlogServiceExeption implements Exception {}

class BlogsService {
  Future<List<BlogModel>> getEvent() async {
    final response = await http.get(
        "${Environments.apiURL}/posts?fbclid=IwAR0eXPs33uApXuEwpA8mAYfNk_sFf7FcbhZAOHjaiw_ERWztDsqLzaSooQs",
        headers: {
          'Content-Type': 'application/json',
        });

    print(response.body);
    final List<dynamic> decodeData = json.decode(response.body);

    if (decodeData == null) {
      throw BlogServiceExeption();
    }

    final List<BlogModel> blogs =
        decodeData.map((blog) => BlogModel.fromJson(blog)).toList();

    return blogs;
  }
}
