import 'package:flutter/material.dart';
import 'package:nota/features/notes/controller/edit_note_controller.dart';
import 'package:nota/features/notes/note.dart';
import 'package:nota/shared/widgets/text_editor.dart';
import 'package:nota/utils/constants/styles.dart';

class EditNote extends StatefulWidget {
  final Note note;
  const EditNote({super.key, required this.note});

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  late EditNoteController editNoteController;
  @override
  void initState() {
    editNoteController =
        EditNoteController(context: context, note: widget.note);
    editNoteController.contentController =
        TextEditingController(text: widget.note.content);
    editNoteController.titleController =
        TextEditingController(text: widget.note.title);
    super.initState();
  }

  @override
  void dispose() {
    editNoteController.contentController.dispose();
    editNoteController.titleController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1f1f1f),
      appBar: AppBar(
          actionsIconTheme:
              const IconThemeData(color: Colors.white54, size: 28),
          iconTheme: const IconThemeData(color: Colors.white54),
          backgroundColor: const Color(0xff1f1f1f),
          leading: Row(children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ]),
          title: Text(
            "Edit Note",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: editNoteController.onSave,
            ),
            IconButton(
              icon: const Icon(Icons.delete_outlined),
              onPressed: editNoteController.onDelete,
            ),
          ]),
      body: Container(
        padding: containerPadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  '${DateTime.parse(widget.note.date).year}/${DateTime.parse(widget.note.date).month}/${DateTime.parse(widget.note.date).day}/${DateTime.parse(widget.note.date).hour}:${DateTime.parse(widget.note.date).minute}',
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                    fontFamily:
                        Theme.of(context).textTheme.bodyMedium?.fontFamily,
                    fontWeight:
                        Theme.of(context).textTheme.bodyMedium?.fontWeight,
                  )),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                style: Theme.of(context).textTheme.headlineMedium,
                controller: editNoteController.titleController,
                decoration: const InputDecoration(border: InputBorder.none),
              ),
              const SizedBox(
                height: 10,
              ),
              TextEditor(
                controller: editNoteController.contentController,
              )
            ],
          ),
        ),
      ),
    );
  }
}
