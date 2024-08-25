import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:nota/features/profile/cubit/profile_cubit.dart';

class ProfileController {
  final BuildContext context;
  final Logger logger = Logger();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final User user = FirebaseAuth.instance.currentUser!;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController newPasswordController;
  late TextEditingController passwordController;
  late List inputs;
  ProfileController({required this.context});
  void initState() {
    nameController =
        TextEditingController(text: firebaseAuth.currentUser!.displayName);
    emailController =
        TextEditingController(text: firebaseAuth.currentUser!.email);
    newPasswordController = TextEditingController();
    passwordController = TextEditingController();
    inputs = [
      {
        "title": "Name*",
        "hint": "",
        "validator": nameValidator,
        "controller": nameController,
        "disabled": true,
      },
      {
        "title": "Email*",
        "hint": "",
        "disabled": false,
        "validator": emailValidator,
        "controller": emailController,
      },
      {
        "title": "Your Password*",
        "hint": "",
        "validator": passwordValidator,
        "controller": passwordController,
        "disabled": true,
      },
      {
        "title": "New Password",
        "hint": "",
        "validator": newPasswordValidator,
        "controller": newPasswordController,
        "disabled": true,
      },
    ];
  }

  void dispose() {
    nameController.dispose();
    emailController.dispose();
    newPasswordController.dispose();
  }

  // TODO: Create Validators for inputs
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter Email";
    }
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Invalid Email';
    }
    return null;
  }

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter Name";
    }
    if (value.length < 2) {
      return "Name length must be 2 or more";
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter new password";
    }
    if (value.length < 8) {
      return "New password length must be 7 charchters or more";
    }

    return null;
  }

  String? newPasswordValidator(String? value) {
    if (value == null) {
      return null;
    }

    if (value.length > 1 && value.length < 8) {
      return "New password length must be 7 charchters or more";
    }

    return null;
  }

  onButtonClicked() {
    if (formKey.currentState!.validate()) {
      context.read<ProfileCubit>().changeProfile(
          password: passwordController.text,
          name: nameController.text,
          email: emailController.text,
          newPassword: newPasswordController.text);
    }
  }
}
