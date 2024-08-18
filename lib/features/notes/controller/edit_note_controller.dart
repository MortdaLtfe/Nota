import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/features/notes/bloc/note_bloc.dart';
import 'package:nota/features/notes/note.dart';

class EditNoteController {
  late TextEditingController titleController;
  late TextEditingController contentController;
  late Note note;
  late BuildContext context;

  EditNoteController({required this.context, required this.note});

  void onSave() {
    if (note.content == contentController.text &&
        note.title == titleController.text) {
      Navigator.pop(context);
      return;
    }
    context.read<NoteBloc>().add(NoteUpdateRequest(
        note: Note(
            id: note.id,
            title: titleController.text,
            content: contentController.text,
            date: note.date,
            uid: note.uid,
            updatedAt: DateTime.now().toString())));
    Navigator.pop(context);
  }

  onDelete() {
    context.read<NoteBloc>().add(NoteDeleteRequest(id: note.id));
    Navigator.pop(context);
  }
}
