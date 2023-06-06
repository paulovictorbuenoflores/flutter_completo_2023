// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../controllers/login_controller.dart';
import '../../utils/app_routes.dart';

class CustomLoginButtonComponent extends StatelessWidget {
  final LoginController loginController;
  CustomLoginButtonComponent({super.key, required this.loginController});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: loginController.inLoader,
        builder: (_, inLoader, __) {
          return inLoader
              ? CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () {
                    loginController.auth().then((result) {
                      if (result) {
                        Navigator.of(context)
                            .pushReplacementNamed(AppRoutes.HOME_PAGE);
                        print('Sucess');
                      } else {
                        print('No Sucess');
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Falha ao realizar login'),
                          duration: Duration(seconds: 2),
                          // action: SnackBarAction(label: 'OK', onPressed: () {}),
                        ));
                      }
                    });
                  },
                  child: Text('Login'));
        });
  }
}
