import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yncoder_demo/themes/dynamic_theme.dart';

class MyDrawer extends StatefulWidget {
  final Widget child;

  MyDrawer({Key key, this.child}) : super(key: key);

  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool isLight;

  @override
  void initState() {
    super.initState();
    isLight = DynamicTheme.of(context).getBrightness() == Brightness.light;
  }

  void changeBrightness() {
    setState(() {
      isLight = !isLight;
      DynamicTheme.of(context)
          .setBrightness(isLight ? Brightness.light : Brightness.dark);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Theme Switch-ers',
                  style: Theme.of(context)
                      .textTheme
                      .display1
                      .apply(color: Colors.white),
                ),
                Text(
                  'Mode is: ${isLight ? 'Light' : 'Dark'}',
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .apply(color: Colors.white),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          ListTile(
            title: Text('Material Switch'),
            trailing: Switch(
              value: isLight,
              onChanged: (val) {
                changeBrightness();
              },
            ),
          ),
          ListTile(
            title: Text('Cupertino Switch'),
            trailing: CupertinoSwitch(
              value: isLight,
              onChanged: (val) {
                changeBrightness();
              },
            ),
          ),
          ListTile(
            title: Text('Adaptive Switch'),
            trailing: Switch.adaptive(
              value: isLight,
              onChanged: (val) {
                changeBrightness();
              },
            ),
          ),
          ListTile(
            title: Text('Close'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
