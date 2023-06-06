import 'package:flutter/material.dart';
import 'package:posts_app/models/post_model.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    PostModel args = ModalRoute.of(context)!.settings.arguments as PostModel;
    return Scaffold(
      appBar: AppBar(
        title: Text('idPost ${args.id}'),
      ),
      body: Container(
        padding: EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              args.title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 24),
            Text(
              args.body,
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.normal,
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Autor: ${args.userId.toString()}, Post: ${args.id.toString()}',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
