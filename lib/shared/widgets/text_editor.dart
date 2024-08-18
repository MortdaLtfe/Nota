import 'package:flutter/material.dart';

/// This widget will change with time
/// this why i make class for it
class TextEditor extends StatefulWidget {
  final TextEditingController controller;
  const TextEditor({super.key, required this.controller});

  @override
  State<TextEditor> createState() => _TextEditorState();
}

class _TextEditorState extends State<TextEditor> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyLarge,
      maxLines: null,
      controller: widget.controller,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "The sun is shining",
          hintStyle: TextStyle(
              color: Colors.white54,
              fontFamily: Theme.of(context).textTheme.bodyLarge!.fontFamily,
              fontWeight: Theme.of(context).textTheme.bodyLarge!.fontWeight,
              fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize)),
    );
  }
}
