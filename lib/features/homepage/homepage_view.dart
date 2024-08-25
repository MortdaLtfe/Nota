import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nota/features/notes/bloc/note_bloc.dart';
import 'package:nota/features/notes/views/add_note.dart';
import 'package:nota/features/notes/views/note_list_view.dart';
import 'package:nota/features/settings/settings_view.dart';
import 'package:nota/shared/widgets/search.dart';
import 'package:nota/utils/constants/styles.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: context.read<NoteBloc>(),
                  child: const AddNote(),
                ))),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100.0)),
        ),
        child: const Icon(
          Icons.add,
          size: 35,
          color: Colors.white,
        ),
      ),
      body: Container(
          padding: containerPadding,
          child: SingleChildScrollView(
            child: StaggeredGrid.count(
              crossAxisCount: 1,
              mainAxisSpacing: 20,
              crossAxisSpacing: 10,
              children: [
                Container(
                  height: 60,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Hello,\nMy Notes ",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      IconButton(
                          onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const SettingsView(),
                                ),
                              ),
                          iconSize: 40,
                          color: Colors.white,
                          icon: const Icon(Icons.settings_outlined))
                    ],
                  ),
                ),
                SearchInput(controller: searchController),
                NoteListView(),
              ],
            ),
          )),
    );
  }
}
