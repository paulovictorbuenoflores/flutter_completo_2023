import 'package:flutter/material.dart';

import '../services/prefs_service.dart';
import '../utils/app_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    //consigo passar uma lista de futures para ele aguardar ela processar
    Future.wait([
      PrefsService.isAuth(),
      Future.delayed(Duration(seconds: 3)),
    ]).then((value) => value[0]
        ? Navigator.of(context).pushReplacementNamed(AppRoutes.HOME_PAGE)
        : Navigator.of(context).pushReplacementNamed(AppRoutes.LOGIN_PAGE));

    // Future.delayed(Duration(seconds: 3)).then((value) =>
    // Navigator.of(context).pushReplacementNamed(AppRoutes.LOGIN_PAGE));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.shade700,
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.white54,
        ),
      ),
    );
  }
}
