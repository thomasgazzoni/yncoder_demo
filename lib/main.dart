import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:yncoder_demo/data/data.dart';
import 'package:yncoder_demo/drawer/drawer.dart';
import 'package:yncoder_demo/model/blog_post.dart';
import 'package:yncoder_demo/themes/dynamic_theme.dart';
import 'package:yncoder_demo/widgets/avatar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.light,
      theme: (brightness) => ThemeData(
            brightness: brightness,
            primarySwatch: Colors.blue,
            backgroundColor:
                brightness == Brightness.dark ? Colors.grey : Colors.white,
            primaryColor: brightness == Brightness.dark
                ? Color(0xFF0d98c8)
                : Color(0xFF0d98ff),
          ),
      builder: (context, theme) => MaterialApp(
            title: 'Yncoder',
            theme: theme,
            home: MyHomePage(title: 'Yncoder Blog Articles'),
          ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // State variables
  List<BlogPostModel> data = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = getBlogPosts();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: MyDrawer(),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return BlogArticle(post: data[index]);
          }),
    );
  }
}

class BlogArticle extends StatelessWidget {
  final BlogPostModel post;

  BlogArticle({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            offset: Offset(1, 1),
            color: Theme.of(context).primaryColor.withOpacity(0.3),
          )
        ],
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50.0),
            bottomRight: Radius.circular(15.0),
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(50.0)),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.5,
              1,
            ],
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).cardColor,
            ]),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50.0),
            bottomRight: Radius.circular(15.0),
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(50.0)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    post.title,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.title,
                  ),
                  Text(
                    post.content,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.body1,
                  ),
                  Divider(height: 16, color: Colors.white),
                  Row(
                    children: <Widget>[
                      AuthorAvatar(
                          url: post.authorUrl, fullname: post.authorName),
                      Divider(indent: 16),
                      Text(post.authorName),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
