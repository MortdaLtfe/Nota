import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:nota/features/authentication/cubit/authentication_cubit.dart';

class SignupController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Logger logger = Logger();
  BuildContext context;
  SignupController({required this.context});
  // Validators

  String? nameValidator(String? value) {
    if (value!.isEmpty) {
      return "Please enter email";
    }
    return null;
  }

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

  void onButtonClick() {
    if (formState.currentState!.validate()) {
      context.read<AuthenticationCubit>().signUp(
          displayName: nameController.text,
          email: emailController.text,
          password: passwordController.text);
    }
  }
}
