part of 'blog_bloc.dart';

@immutable
class BlogState {
  final BlogModel blogModel;

  BlogState({
    this.blogModel,
  });

  BlogState copyWith({
    BlogModel blogModel,
  }) =>
      BlogState(blogModel: blogModel ?? this.blogModel);
}
