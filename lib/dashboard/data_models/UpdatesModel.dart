//"id": 38226,
//"date": "2019-07-16 14:32:21",
//"title": "Shrines, Cathedrals and Basilicas",
//"excerpt": "A basilica may be a shrine, and a cathedral may be a basilica",
//"author_name": "Kristine Tuting",
//"author_image": "http://1.gravatar.com/avatar/?s=96&d=mm&r=g",
//"thumbnail": "https://i1.wp.com/aranzazushrine.ph/home/wp-content/uploads/2019/07/article-shrine.jpg?fit=1262%2C757"
class UpdatesModel {
  final int id;
  final String date;
  final String title;
  final String excerpt;
  final String authorName;
  final String authorImage;
  final String thumbnail;

  UpdatesModel(
      {this.id,
      this.date,
      this.title,
      this.excerpt,
      this.authorName,
      this.authorImage,
      this.thumbnail});

  factory UpdatesModel.fromJson(Map<String, dynamic> json) {
    return UpdatesModel(
        id: json['id'] as int,
        date: json['date'] as String,
        title: json['title'] as String,
        excerpt: json['excerpt'] as String,
        authorName: json['author_name'] as String,
        authorImage: json['author_image'] as String,
        thumbnail: json['thumbnail'] as String);
  }
}
