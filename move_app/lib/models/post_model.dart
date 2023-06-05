class PostModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel(this.userId, this.id, this.title, this.body);

  //basicamente, pego o json que é um map, e vou construir um objeto, que é um map
  factory PostModel.fromJson(Map mapJson) {
    return PostModel(
      mapJson['userId'],
      mapJson['id'],
      mapJson['title'],
      mapJson['body'],
    );
  }
}
