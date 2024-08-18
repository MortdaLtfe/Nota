import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/features/notes/bloc/note_bloc.dart';

class SearchInput extends StatefulWidget {
  final TextEditingController controller;
  const SearchInput({super.key, required this.controller});

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextFormField(
          onChanged: (val) {
            context.read<NoteBloc>().add(NoteSearchRequest(query: val));
          },
          style: const TextStyle(color: Color(0xffe0e0e0), fontFamily: "Sofia"),
          decoration: const InputDecoration(
            fillColor: Color(0xff1f1f1f),
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(9.0)),
            ),
            hintText: 'Search Here',
            hintStyle: TextStyle(
              fontFamily: "Sofia",
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: ThemeMode.dark == ThemeMode.dark
                  ? Colors.white54
                  : Colors.black,
            ),
            prefixIcon: Icon(
              Icons.search_outlined,
              size: 30,
              color: Colors.white54,
            ),
          )),
    );
  }
}
