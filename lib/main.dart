import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_meet2go/bloc/blog/blog_bloc.dart';
import 'package:test_meet2go/utils/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BlogBloc(),
      child: MaterialApp(
        title: 'Material App',
        initialRoute: AppRoutes.EVENT,
        routes: AppRoutes.getApplicationRoutes(),
      ),
    );
  }
}
