import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

import 'package:test_meet2go/bloc/blog/blog_bloc.dart';
import 'package:test_meet2go/models/blog_model.dart';

import 'package:test_meet2go/utils/routes.dart';

class BlogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    // Instancia del bloc
    final _blocEvent = BlocProvider.of<BlogBloc>(context);

    // Emitimos el evento inicial del bloc
    _blocEvent.add(OnGetData());

    final _header = _sliverHeader();

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
      body: BlocBuilder<BlogBloc, BlogState>(
        builder: (context, state) {
          if (state.blogsModel == null) {
            return Center(
                child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.yellow),
            ));
          } else {
            return CustomScrollView(
              slivers: <Widget>[
                if (_isPortrait) _header,
                SliverList(
                  delegate: SliverChildListDelegate([
                    SizedBox(height: 10.0),
                    ...List.generate(state.blogsModel.length,
                        (int i) => _CardBlogWidget(state.blogsModel[i])),
                  ]),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _sliverHeader() {
    return SliverAppBar(
      // elevation: 10.0,
      backgroundColor: Colors.transparent,
      expandedHeight: 250.0,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        background: FadeInImage(
          fit: BoxFit.fill,
          image: NetworkImage(
              "https://www.meet2go.com/wp-content/uploads/2020/12/cuadradoevento.jpg"),
          placeholder: AssetImage('assets/img/loading.gif'),
        ),
      ),
      // title: Text("Blog"),
    );
  }
}

class _CardBlogWidget extends StatelessWidget {
  const _CardBlogWidget(
    this.blogModel,
  );

  final BlogModel blogModel;

  Widget _titleBlog() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        blogModel.title.rendered,
        style: TextStyle(
          fontFamily: 'RobotoMono',
          fontSize: 20.0,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _imageBlog(bool _isPortrait, Size screenSize) {
    // Radius.zero

    return Container(
      margin: _isPortrait ? EdgeInsets.only(bottom: 10.0) : null,
      padding: !_isPortrait ? EdgeInsets.only(left: 10.0) : null,
      height: 200,
      width: _isPortrait ? double.infinity : screenSize.width * 0.5,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
          bottomLeft: _isPortrait ? Radius.zero : Radius.circular(14),
          bottomRight: _isPortrait ? Radius.zero : Radius.circular(14),
        ),
        child: FadeInImage(
          height: 200,
          image: NetworkImage(
              "https://www.meet2go.com/wp-content/uploads/2020/12/5.jpg"),
          placeholder: AssetImage('assets/img/loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _shortDescriptionblog() {
    return Container(
      child: Html(
        data: blogModel.excerpt.rendered,
        // blacklistedElements: ["[&hellip;]"],
        // shrinkWrap: true,
        style: {
          "p": Style(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            textAlign: TextAlign.justify,
          )
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    final _screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, AppRoutes.EVENT_DETAIL,
            arguments: blogModel),
        child: Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: _isPortrait
              ? Column(
                  children: <Widget>[
                    _imageBlog(_isPortrait, _screenSize),
                    _titleBlog(),
                    _shortDescriptionblog(),
                  ],
                )
              : Row(
                  children: <Widget>[
                    _imageBlog(_isPortrait, _screenSize),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 10.0),
                        child: Column(
                          children: <Widget>[
                            _titleBlog(),
                            _shortDescriptionblog(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
