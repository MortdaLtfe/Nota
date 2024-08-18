import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/features/notes/bloc/note_bloc.dart';

class AddNoteController {
  late BuildContext context;

  late TextEditingController titleController;
  late TextEditingController contentController;

  AddNoteController({required this.context});
  void onSave() async {
    context.read<NoteBloc>().add(NoteAddRequest(
        content: contentController.text,
        title: titleController.text,
        uid: "44"));

    Navigator.pop(context);
  }
}
