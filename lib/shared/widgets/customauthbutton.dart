import 'package:flutter/material.dart';
import 'package:nota/utils/constants/colors.dart';

class CustomAuthButton extends StatefulWidget {
  final Widget child;
  final Function() onPressed;
  const CustomAuthButton(
      {super.key, required this.child, required this.onPressed});

  @override
  State<CustomAuthButton> createState() => _CustomAuthButtonState();
}

class _CustomAuthButtonState extends State<CustomAuthButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
            onPressed: widget.onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: sageGreen,
            ),
            child: widget.child));
  }
}
