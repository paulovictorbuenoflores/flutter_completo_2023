import 'package:move_app/models/post_model.dart';

abstract class HomeRepository {
  Future<List<PostModel>> getList();
}
