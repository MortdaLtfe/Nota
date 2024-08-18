class Note {
  late String id;
  late String title;
  late String content;
  late String uid;
  late String date;
  late String updatedAt;
  Note(
      {required this.id,
      required this.title,
      required this.content,
      required this.uid,
      required this.date,
      required this.updatedAt});
  // updatedAt = DateTime.now().toString();

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "content": content,
      "uid": uid,
      "date": date,
    };
  }
}
