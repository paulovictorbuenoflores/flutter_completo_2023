import 'package:exemplo/app_routers.dart';
import 'package:exemplo/my_widgets_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DrawerApp extends StatefulWidget {
  PageController controller;
  Function m;
  DrawerApp(this.controller, this.m);

  @override
  State<DrawerApp> createState() => _DrawerAppState();
}

class _DrawerAppState extends State<DrawerApp> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Paulo'),
            accountEmail: const Text('paulo@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: Text('P'),
            ),
          ),
          ListTile(
            title: Text('Page 1'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              widget.m(0);

              Navigator.of(
                context,
              ).pop(AppRouters.MY_WIDGETS_APP);
            },
          ),
          ListTile(
            title: Text('Page 2'),
            onTap: () {
              widget.m(1);
              Navigator.of(
                context,
              ).pop(AppRouters.MY_WIDGETS_APP);
            },
          ),
          ListTile(
            title: Text('Page 3'),
            onTap: () {
              widget.m(2);
              Navigator.of(
                context,
              ).pop(AppRouters.MY_WIDGETS_APP);
            },
          ),
        ],
      ),
    );
  }
}
