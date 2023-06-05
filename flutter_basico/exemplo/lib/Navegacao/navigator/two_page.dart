import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class TwoPage extends StatelessWidget {
  final String args;
  const TwoPage({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
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
                  Navigator.of(context).pop();
                },
                child: Text('Voltar $args'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
