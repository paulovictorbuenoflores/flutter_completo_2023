import 'package:flutter/material.dart';
import 'package:posts_app/repositories/home_repository_imp.dart';

import '../controllers/home_controller.dart';
import '../models/post_model.dart';
import '../services/prefs_service.dart';
import '../utils/app_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _homeController = HomeController(HomeRepositoryImp());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _homeController.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
                PrefsService.logout();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(AppRoutes.LOGIN_PAGE, (_) => true);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: ValueListenableBuilder<List<PostModel>>(
        valueListenable: _homeController.posts,
        builder: (contexto, list, __) {
          return ListView.separated(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (_, idx) {
              return ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed(AppRoutes.DETAILS_POST_PAGE,
                      arguments: list[idx]);
                },
                leading: Text(list[idx].id.toString()),
                title: Text(list[idx].title),
                // leading: Icon(Icons.arrow_forward),
                trailing: Icon(Icons.arrow_forward),
              );
            },
            separatorBuilder: (_, __) => Divider(),
          );
        },
      ),
    );
  }
}
