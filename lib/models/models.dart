class blogModel {
  String? id;
   String content;
   String author;
   String timestamp;

  blogModel({required this.content, required this.author, required this.timestamp,required this.id});

  blogModel.fromJson(Map<String,dynamic>json):
      id = json['id'],
        content = json['content'],
        author = json['author'],
        timestamp = json['timestamp'];

  Map<String,dynamic> toJson() => {
    'content' : content,
    'author' : author,
    'timestamp' : timestamp,
    'id' : id,
  };
}
