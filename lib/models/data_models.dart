class Hashtags {
  final String title;

  Hashtags({required this.title});
}

class Blog {
  int id;
  String imageUrl;
  String title;
  String writerImageUrl;
  String writer;
  String date;
  String content;
  String views;

  Blog(
      {required this.id,
      required this.imageUrl,
      required this.title,
      required this.writerImageUrl,
      required this.writer,
      required this.date,
      required this.content,
      required this.views});
}
