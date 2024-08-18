import 'package:hive/hive.dart';
import 'package:nota/features/notes/note.dart';

class NoteAdapter extends TypeAdapter<Note> {
  @override
  final typeId = 1;

  @override
  Note read(BinaryReader reader) {
    return Note(
        id: reader.readString(),
        title: reader.readString(),
        content: reader.readString(),
        uid: reader.readString(),
        date: reader.readString(),
        updatedAt: reader.read());
  }

  @override
  void write(BinaryWriter writer, Note obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.title);
    writer.writeString(obj.content);
    writer.writeString(obj.uid);
    writer.writeString(obj.date);
    writer.write(obj.updatedAt);
  }
}
