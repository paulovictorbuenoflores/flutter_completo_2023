//nome da API que estamos usando
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(this.userId, this.id, this.title, this.body);

  //tipo de construtor que vai fabricar um objeto
  factory Post.fromJson(Map map) {
    return Post(
      map['userId'],
      map['id'],
      map['title'],
      map['body'],
    );
  }

  @override
  String toString() {
    return 'Post(userId: $userId, id: $id, title: $title, body: )';
  }
}
