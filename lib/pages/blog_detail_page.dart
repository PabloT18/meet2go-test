import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:test_meet2go/models/blog_model.dart';

class BlogDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BlogModel blogModel = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Container(
          height: 45,
          child: Image(
            fit: BoxFit.fill,
            image:
                NetworkImage('https://www.meet2go.com/_nuxt/img/6a66ced.png'),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Html(
          data: blogModel.content.rendered,
        ),
      ),
    );
  }
}
