import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class One extends StatefulWidget {
  const One({super.key});

  @override
  State<One> createState() => _OneState();
}

class _OneState extends State<One> {
  ValueNotifier<int> valorAleatorio = ValueNotifier<int>(0);
  random() async {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 1));

      valorAleatorio.value = Random().nextInt(1000);
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerencia de estado'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
                height: 100,
                margin: EdgeInsets.all(16),
                child: /*Text('Valor eh: $valorAleatorio' , style: TextStyle(fontSize: 20)),*/
                    ValueListenableBuilder(
                  valueListenable: valorAleatorio,
                  builder: (_, value, __) => Text(
                    'Valor eh: $value',
                    style: TextStyle(fontSize: 20),
                  ),
                )),
            ElevatedButton(
              onPressed: () => random(),
              child: Text('BT'),
            ),
          ],
        ),
      ),
    );
  }
}
