import 'package:flutter/material.dart';
import 'package:test_meet2go/pages/blog_detail_page.dart';
import 'package:test_meet2go/pages/blog_page.dart';

class AppRoutes {
  static const String EVENT = 'event';
  static const String EVENT_DETAIL = 'event_detail';

  static Map<String, WidgetBuilder> getApplicationRoutes() {
    return <String, WidgetBuilder>{
      EVENT: (BuildContext context) => BlogPage(),
      EVENT_DETAIL: (BuildContext context) => BlogDetailPage(),
    };
  }
}
