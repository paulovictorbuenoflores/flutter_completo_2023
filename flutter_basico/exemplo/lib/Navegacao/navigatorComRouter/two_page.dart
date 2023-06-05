import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class TwoPage extends StatelessWidget {
  const TwoPage({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          children: [
            LinearProgressIndicator(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  //para pushNamed
                  //Navigator.of(context).pop('retorno');

//verifica se é possivel voltar, se a tela ainda existe no contexto
                  if (Navigator.of(context).canPop()) {
                    Navigator.of(context).pop('retorno');
                  }
                },
                child: Text('Voltar [$args]'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
