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
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                "Delete Note?",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(fontSize: 30),
              ),
              backgroundColor: Color(0xff1f1f1f),
              content: const Text("Are you sure you want to delete this note?"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel",
                        style: Theme.of(context).textTheme.bodyMedium)),
                TextButton(
                    onPressed: () {
                      context
                          .read<NoteBloc>()
                          .add(NoteDeleteRequest(id: note.id));
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Delete",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.red,
                          ),
                    ))
              ],
            ));
  }
}
