import 'package:exemplo/app_routers.dart';
import 'package:exemplo/todo_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'my_widgets_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EXEMPLOS',
      theme: ThemeData(),
      home: MyWidgetsApp(),
      routes: {
        AppRouters.MY_WIDGETS_APP: (context) => MyWidgetsApp(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
