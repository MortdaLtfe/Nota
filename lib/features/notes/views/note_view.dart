import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/features/notes/bloc/note_bloc.dart';
import 'package:nota/features/notes/note.dart';
import 'package:nota/features/notes/views/edit_note.dart';

class NoteView extends StatefulWidget {
  final Note note;
  const NoteView({super.key, required this.note});

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => BlocProvider<NoteBloc>.value(
                      value: context.read<NoteBloc>(),
                      child: EditNote(
                        note: widget.note,
                      ))));
        },
        splashColor: Colors.black,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(9),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  '${DateTime.parse(widget.note.date).month}/${DateTime.parse(widget.note.date).day}/${DateTime.parse(widget.note.date).year}',
                  style: const TextStyle(
                      fontFamily: 'Sofia',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.white60),
                ),
              ),
              // IconButton(
              //   onPressed: () {},
              //   icon: const Icon(Icons.ios_share_outlined),
              //   color: Colors.white60,
              // )

              Text(
                widget.note.title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Container(
                height: 10,
              ),
              Text(
                widget.note.content.length > 40
                    ? "${widget.note.content.substring(0, 40)}..."
                    : widget.note.content,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  DateTime.now()
                              .difference(DateTime.parse(widget.note.updatedAt))
                              .inMinutes <
                          1
                      ? "Just now"
                      : DateTime.now()
                                  .difference(
                                      DateTime.parse(widget.note.updatedAt))
                                  .inMinutes >
                              60
                          ? "${DateTime.now().difference(DateTime.parse(widget.note.updatedAt)).inHours} hours ago"
                          : DateTime.now()
                                      .difference(
                                          DateTime.parse(widget.note.updatedAt))
                                      .inHours >
                                  24
                              ? "${DateTime.now().difference(DateTime.parse(widget.note.updatedAt)).inDays} days ago"
                              : "${DateTime.now().difference(DateTime.parse(widget.note.updatedAt)).inMinutes} minutes ago",
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ));
  }
}
