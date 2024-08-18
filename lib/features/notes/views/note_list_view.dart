import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nota/features/notes/bloc/note_bloc.dart';
import 'package:nota/features/notes/controller/note_list_controller.dart';
import 'package:nota/features/notes/views/note_view.dart';

class NoteListView extends StatefulWidget {
  NoteListView({super.key});

  @override
  State<NoteListView> createState() => _NoteListViewState();
}

class _NoteListViewState extends State<NoteListView> {
  NoteListController noteListController = NoteListController();
  @override
  void initState() {
    super.initState();

    context.read<NoteBloc>().add(FetchNotes());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteBloc, NoteState>(
      listener: (context, state) {
        if (state is NoteDeleted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              showCloseIcon: true,
              backgroundColor: Color(0xff1f1f1f),
              content: Text(
                "Note Deleted Successfully",
                style: Theme.of(context).textTheme.bodyMedium,
              )));
        }
      },
      builder: (context, state) {
        if (state is NoteLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is NotesLoaded) {
          return StaggeredGrid.count(
            crossAxisCount: 1,
            mainAxisSpacing: 10,
            children: state.notes.length > 0
                ? state.notes
                    .map((note) => NoteView(
                          note: note,
                        ))
                    .toList()
                : [],
          );
        }
        if (state is NoteSearch) {
          return StaggeredGrid.count(
            crossAxisCount: 1,
            mainAxisSpacing: 10,
            children: state.notes.length > 0
                ? state.notes
                    .map((note) => NoteView(
                          note: note,
                        ))
                    .toList()
                : [],
          );
        }
        return const Text("Something went Wrong");
      },
    );
  }
}
