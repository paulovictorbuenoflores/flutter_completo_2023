import 'package:exemplo/widgetPersonalizados/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class OnePage extends StatelessWidget {
  const OnePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('P 1'),
      ),
      body: Center(
        child: CustomButtonWidget(
          onPressed: () {},
          title: 'Botao Customizado',
          disable: false,
          titlesize: 18,
        ),
      ),
    );
  }
}
