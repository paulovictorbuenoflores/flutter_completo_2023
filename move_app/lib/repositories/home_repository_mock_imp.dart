import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:move_app/models/post_model.dart';
import 'package:move_app/repositories/home_repository.dart';

//sabe buscar os dados de homeRepository
class HomeRepositoryMockImp implements HomeRepository {
  @override
  Future<List<PostModel>> getList() async {
    //para ler o jsons que esta em (assets/data.json)
    //rootBundle vai conseguir identificar tudo que esta dentro de assets
    var value = await rootBundle.loadString('assets/data.json');
    List<dynamic> postJson = jsonDecode(value);
    return postJson.map((e) => PostModel.fromJson(e)).toList();
  }
}
