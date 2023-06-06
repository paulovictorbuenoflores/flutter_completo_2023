import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EstruturaPage extends StatefulWidget {
  const EstruturaPage({super.key});

  @override
  State<EstruturaPage> createState() => _EstruturaPageState();
}

class _EstruturaPageState extends State<EstruturaPage> {
  void _getListagemAPI() {
    http.get(Uri.https('api.themoviedb.org', '/4/list/1'), headers: {
      'content-type': 'application/json;charset=utf-8',
      'authorization': 'Bearer '
    }).then((value) => print(value.body));
  }

  @override
  Widget build(BuildContext context) {
    _getListagemAPI();
    return Scaffold(
      appBar: AppBar(
        title: Text('ESTRUTURA INICIAL '),
      ),
    );
  }
}
