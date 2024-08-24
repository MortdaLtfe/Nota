import 'package:flutter/material.dart';

class CustomAuthField extends StatefulWidget {
  final String? hint;
  final String title;
  final TextEditingController controller;
  final String? Function(String? value)? validator;
  final bool? disabled;
  const CustomAuthField(
      {super.key,
      this.hint,
      this.disabled,
      required this.title,
      required this.controller,
      required this.validator});

  @override
  State<CustomAuthField> createState() => _CustomAuthFieldState();
}

class _CustomAuthFieldState extends State<CustomAuthField> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10.0,
      children: [
        Text(
          widget.title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        TextFormField(
          enabled: widget.disabled,
          validator: widget.validator,
          controller: widget.controller,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.white),
          decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).textTheme.labelSmall!.color),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white10))),
        )
      ],
    );
  }
}
