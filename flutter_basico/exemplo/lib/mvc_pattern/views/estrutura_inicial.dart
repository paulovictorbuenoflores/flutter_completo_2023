import 'package:exemplo/mvc_pattern/controllers/post_controller.dart';
import 'package:flutter/material.dart';

class EstruturaInicial extends StatefulWidget {
  const EstruturaInicial({super.key});

  @override
  State<EstruturaInicial> createState() => _EstruturaInicialState();
}

class _EstruturaInicialState extends State<EstruturaInicial> {
  final PostController _postController = PostController();
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
                child: AnimatedBuilder(
                  animation: Listenable.merge(
                      [_postController.posts, _postController.inLoader]),
                  builder: (_, __) => _postController.inLoader.value
                      ? LinearProgressIndicator()
                      : ListView.builder(
                          physics:
                              NeverScrollableScrollPhysics(), //desabilita a rolagem da lista
                          shrinkWrap:
                              true, //para o tamanho so oculpar o tamanho da lista que ela tiver
                          itemCount: _postController.posts.value.length,
                          itemBuilder: (context, index) => ListTile(
                            title:
                                Text(_postController.posts.value[index].title),
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _postController.callAPI(),
        child: Icon(Icons.api),
      ),
    );
  }
}
