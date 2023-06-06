// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  @override
  String toString() {
    return 'PostModel(userId: $userId, id: $id, title: $title, body: $body)';
  }
}
