import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:test_meet2go/environments/environment.dart';
import 'package:test_meet2go/models/blog_model.dart';

class BlogServiceExeption implements Exception {}

class BlogsService {
  Future<BlogModel> getEvent() async {
    final response = await http.get("${Environments.apiURL}", headers: {
      'Content-Type': 'application/json',
    });

    final List<dynamic> decodeData = json.decode(response.body);

    if (decodeData == null) {
      throw BlogServiceExeption();
    }

    final event = new BlogModel.fromJson(decodeData[0]);

    print(decodeData);
    print("dafadf ${event.title.rendered}");
    return event;
  }
}
