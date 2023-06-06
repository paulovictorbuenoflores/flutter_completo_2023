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
      'authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyYTJlZTEyZmIzZmUxZDIzYmE2ZTEzZTYyMDg4ZTU5YiIsInN1YiI6IjY0N2IzOGY1Y2Y0YjhiMDEwMzFlNDNkMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.8txYqf4LRuHdXtkRC3-zFe8CdIp-M_vRRlNtJrN-0VU'
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
