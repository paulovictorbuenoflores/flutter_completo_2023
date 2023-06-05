import 'package:exemplo/gerencia%20de%20estado/one.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

void main(List<String> args) => runApp(MyApp());

//o problema é que estamos recriando varias vezes o build da classe one,
// e estamos apenas mudando um valor do contador
//o resto da pagina nao muda nada

class MyApp extends StatelessWidget {
  const MyApp({super.key});
//
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: One(),
    );
  }
}
