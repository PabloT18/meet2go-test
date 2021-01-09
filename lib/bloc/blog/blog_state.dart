part of 'blog_bloc.dart';

@immutable
class BlogState {
  final List<BlogModel> blogsModel;

  BlogState({
    this.blogsModel,
  });

  BlogState copyWith({
    List<BlogModel> blogsModel,
  }) =>
      BlogState(blogsModel: blogsModel ?? this.blogsModel);
}
