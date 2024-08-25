import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:nota/features/authentication/cubit/authentication_cubit.dart';

class SigninController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  Logger logger = Logger();
  BuildContext context;

  SigninController({required this.context});
  // Vaidators
  String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return "Please enter email";
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return "Please enter password";
    }
    if (value.length < 7) {
      return "Password must be at least 7 characters";
    }
    return null;
  }

  // Events
  void onButtonClick() async {
    if (formState.currentState!.validate()) {
      context.read<AuthenticationCubit>().signIn(
          email: emailController.text, password: passwordController.text);
    }
  }
}
