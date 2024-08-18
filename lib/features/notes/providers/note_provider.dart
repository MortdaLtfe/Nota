import 'package:hive/hive.dart';
import 'package:nota/features/notes/note.dart';
import 'package:nota/utils/constants/strings.dart';
import 'package:uuid/uuid.dart';

class NoteProvider {
  Uuid uuid = const Uuid();
  final db = Hive.box<Note>(NOTE_DATABASE);
  Future<List<Note>> find() async {
    return db.values.toList();
  }

  update({required Note note}) async {
    return db.put(note.id, note);
  }

  delete({required String id}) async {
    return db.delete(id);
  }

  create(
      {required String title, required String content, required String uid}) {
    String uuid = this.uuid.v4();

    return db.put(
        uuid,
        Note(
          content: content,
          title: title,
          uid: uid,
          id: uuid,
          date: DateTime.now().toString(),
          updatedAt: DateTime.now().toString(),
        ));
  }
}
