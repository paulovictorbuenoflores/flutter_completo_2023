// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';

class LoginController {
  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  String? _login;
  setLogin(String value) => _login = value;

  String? _pass;
  setPass(String value) => _pass = value;

  Future<bool> auth() async {
    inLoader.value = true;
    await Future.delayed(Duration(seconds: 3));
    print('LoginController(_login: $_login, _pass: $_pass)');
    inLoader.value = false;
    return _login == 'admin' && _pass == '123';
  }
}
