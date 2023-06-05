import 'package:flutter/material.dart';
import 'package:move_app/pages/home_page.dart';
import 'package:move_app/pages/login_page.dart';
import 'package:move_app/pages/splash_page.dart';
import 'package:move_app/utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: AppRoutes.SPLASH_PAGE,
      routes: {
        AppRoutes.SPLASH_PAGE: (context) => SplashPage(),
        AppRoutes.LOGIN_PAGE: (context) => LoginPage(),
        AppRoutes.HOME_PAGE: (context) => HomePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
