import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final bool disable;
  final double? titlesize;
  const CustomButtonWidget(
      {super.key,
      required this.onPressed,
      required this.title,
      this.disable = false,
      this.titlesize});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disable ? null : onPressed,
      child: Text(title),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(MaterialState.disabled)) return Colors.red;
            if (states.contains(MaterialState.pressed)) return Colors.blue;
            return Colors.green;
          },
        ),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),

        //   textStyle: MaterialStateProperty.all(TextStyle(fontSize: titlesize)),
        textStyle: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed))
            return TextStyle(fontSize: titlesize != null ? titlesize! * 2 : 28);
          return TextStyle(fontSize: titlesize);
        }),
      ),
    );
  }
}
