import 'package:exemplo/Navegacao/navigatorComRouter/one_page.dart';
import 'package:exemplo/Navegacao/navigatorComRouter/two_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

void main(List<String> args) => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnePage(),
      initialRoute: '/',
      routes: {
        '/1': (context) => const OnePage(),
        '/2': (context) => const TwoPage()
      },
    );
  }
}
