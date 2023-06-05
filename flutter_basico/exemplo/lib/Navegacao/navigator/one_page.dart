import 'package:exemplo/Navegacao/navigator/two_page.dart';
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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const TwoPage(
                      args: '[Passando argumentos]',
                    ),
                  ),
                );
              },
              child: Text('Ir  para segunda pagina'))),
    );
  }
}
