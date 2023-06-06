import 'package:flutter/material.dart';

import '../components/login/custom_login_button_component.dart';
import '../controllers/login_controller.dart';
import '../widgets/custom_text_field_widget.dart';

class LoginPage extends StatelessWidget {
  final LoginController _loginController = LoginController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(28),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.people,
                size: MediaQuery.of(context).size.height * 0.2,
              ),
              CustomTextFielWidget(
                  onChanged: _loginController.setLogin, label: 'Login'),
              CustomTextFielWidget(
                onChanged: _loginController.setPass,
                label: 'Password',
                obscureText: true,
              ),
              SizedBox(height: 15),
              CustomLoginButtonComponent(
                loginController: _loginController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
