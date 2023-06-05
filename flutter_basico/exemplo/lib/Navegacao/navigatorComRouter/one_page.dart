import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class OnePage extends StatelessWidget {
  const OnePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Primeira pagina')),
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                //usando o pushNamed, as telas ficam empilhadas, tendo a opcao de voltar
                //  Navigator.of(context).pushNamed('/2', arguments: 'argumentos').then((value) => print(value));
                //usando o pushNamedReplaceNamed a tela é empilhada, mas a antiga tela é removida da pilha antes
                Navigator.of(context)
                    .pushReplacementNamed('/2', arguments: 'argumentos')
                    .then((value) => print(value));
              },
              child: Text('Ir  para segunda pagina'))),
    );
  }
}
