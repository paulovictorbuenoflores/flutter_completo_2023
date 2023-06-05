// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

void main(List<String> args) => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EstruturaInicial(),
    );
  }
}

class EstruturaInicial extends StatefulWidget {
  const EstruturaInicial({super.key});

  @override
  State<EstruturaInicial> createState() => _EstruturaInicialState();
}

class _EstruturaInicialState extends State<EstruturaInicial> {
  ValueNotifier<List<Post>> posts = ValueNotifier<List<Post>>([]);
  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

//https://jsonplaceholder.typicode.com/posts
  callAPI() async {
    var client = http.Client();
    try {
      inLoader.value = true;
      var response = await client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      //var response =          await client.get(Uri.parse('http://localhost:8080/localEsportes'));

      var decodedResponse = jsonDecode(response.body) as List;
      // print(decodedResponse);
      //List<Post> posts = decodedResponse.map((e) => Post.fromJson(e)).toList();
      posts.value = decodedResponse.map((e) => Post.fromJson(e)).toList();

      // print('Tamanho da lista: ${posts.length}');
      // posts.forEach(print);

      // print(posts.toString());

      /*
      var response = await client.post(
          Uri.https('example.com', 'whatsit/create'),
          body: {'name': 'doodle', 'color': 'blue'});
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      var uri = Uri.parse(decodedResponse['uri'] as String);
      print(await client.get(uri));*/
    } finally {
      inLoader.value = false;
      client.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Metodo build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Estrutura inicial'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // child: ValueListenableBuilder<List<Post>>(
                child: AnimatedBuilder(
                  animation: Listenable.merge([posts, inLoader]),
                  builder: (_, __) => inLoader.value
                      ? LinearProgressIndicator()
                      : ListView.builder(
                          physics:
                              NeverScrollableScrollPhysics(), //desabilita a rolagem da lista
                          shrinkWrap:
                              true, //para o tamanho so oculpar o tamanho da lista que ela tiver
                          itemCount: posts.value.length,
                          itemBuilder: (context, index) => ListTile(
                            title: Text(posts.value[index].title),
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => callAPI(),
        child: Icon(Icons.api),
      ),
    );
  }
}

/* <uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />*/

/*
{
    "userId": 1,
    "id": 1,
    "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
  }
*/
//nome da API que estamos usando
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(this.userId, this.id, this.title, this.body);

  //tipo de construtor que vai fabricar um objeto
  factory Post.fromJson(Map map) {
    return Post(
      map['userId'],
      map['id'],
      map['title'],
      map['body'],
    );
  }

  @override
  String toString() {
    return 'Post(userId: $userId, id: $id, title: $title, body: )';
  }
}
