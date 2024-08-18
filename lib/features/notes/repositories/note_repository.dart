import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nota/features/notes/note.dart';
import 'package:nota/features/notes/providers/note_provider.dart';

class NoteRepository {
  NoteProvider noteProvider;

  NoteRepository({required this.noteProvider});

  Future<List<Note>> find() async {
    Future<List<Note>> notes = noteProvider.find();
    return notes;
  }

  delete({required String id}) {
    return noteProvider.delete(id: id);
  }

  create(
      {required String uid,
      required String title,
      required String content}) async {
    return noteProvider.create(uid: uid, title: title, content: content);
  }

  update(Note note) async {
    return noteProvider.update(note: note);
  }
}
