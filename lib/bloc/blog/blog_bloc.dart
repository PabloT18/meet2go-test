import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_meet2go/models/blog_model.dart';
import 'package:test_meet2go/services/blogs_service.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  BlogBloc() : super(BlogState());

  //Instancias de los servicios REST
  BlogsService eventsService = BlogsService();

  @override
  Stream<BlogState> mapEventToState(BlogEvent event) async* {
    if (event is OnGetData) {
      yield* _getdata();
    }
  }

  Stream<BlogState> _getdata() async* {
    try {
      final blogs = await eventsService.getEvent();
      // eventsService.getEvent();
      yield state.copyWith(blogsModel: blogs);
    } on BlogServiceExeption {}
  }
}
