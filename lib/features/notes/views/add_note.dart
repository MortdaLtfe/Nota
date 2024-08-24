import 'package:flutter/material.dart';
import 'package:nota/features/notes/controller/add_note_controller.dart';
import 'package:nota/shared/widgets/text_editor.dart';
import 'package:nota/utils/constants/styles.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  late AddNoteController addNoteController;
  @override
  void initState() {
    addNoteController = AddNoteController(context: context);
    addNoteController.contentController = TextEditingController();
    addNoteController.titleController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    addNoteController.contentController.dispose();
    addNoteController.titleController.dispose();

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
            "Add Note",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: addNoteController.onSave,
            ),
            IconButton(
              icon: const Icon(Icons.more_horiz_outlined),
              onPressed: () {},
            ),
          ]),
      body: Container(
        padding: containerPadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                style: Theme.of(context).textTheme.headlineMedium,
                controller: addNoteController.titleController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Title here...",
                    hintStyle: TextStyle(
                        color: Colors.white54,
                        fontFamily: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .fontFamily,
                        fontWeight: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .fontWeight,
                        fontSize: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .fontSize)),
              ),
              const SizedBox(
                height: 10,
              ),
              TextEditor(
                controller: addNoteController.contentController,
              )
            ],
          ),
        ),
      ),
    );
  }
}
