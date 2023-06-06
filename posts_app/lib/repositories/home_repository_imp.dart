import 'package:dio/dio.dart';

import '../models/post_model.dart';
import 'home_repository.dart';

class HomeRepositoryImp implements HomeRepository {
  @override
  Future<List<PostModel>> getList() async {
    try {
      //diferenca basica do dio para http nao precisa fazer o jsondecode porque o dio ja faz isso
      var response =
          await Dio().get('https://jsonplaceholder.typicode.com/posts');
      print(response);
      return (response.data as List).map((e) => PostModel.fromJson(e)).toList();
    } catch (e) {
      print(e);
    }
    return [];
  }
}
