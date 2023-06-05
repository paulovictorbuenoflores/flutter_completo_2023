import 'package:flutter/material.dart';
import 'package:move_app/controllers/home_controller.dart';
import 'package:move_app/models/post_model.dart';
import 'package:move_app/repositories/home_repository_imp.dart';

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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ValueListenableBuilder<List<PostModel>>(
              valueListenable: _homeController.posts,
              builder: (contexto, list, __) {
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (_, idx) {
                    return ListTile(
                      title: Text(list[idx].title),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
