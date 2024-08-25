import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());
  Logger logger = Logger();
  // TODO: Create Authentication  methods
  void signUp(
      {required String displayName,
      required String email,
      required String password}) async {
    final firebaseAuth = FirebaseAuth.instance;
    emit(AuthenticationSignupLoading());
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      await firebaseAuth.currentUser?.updateDisplayName(displayName);
      emit(AuthenticationSignupSuccess());
    } on FirebaseAuthException catch (e) {
      logger.e(e);
      switch (e.code) {
        case "email-already-exists":
          emit(AuthenticationSignupError(message: "Email already in use"));
          break;
        case "invalid-email":
          emit(AuthenticationSignupError(message: "Invalid email"));
          break;
        case "operation-not-allowed":
          emit(AuthenticationSignupError(message: "Operation not allowed"));
          break;
        case "weak-password":
          emit(AuthenticationSignupError(message: "Weak password"));
          break;
        default:
          emit(AuthenticationSignupError(message: "Something went wrong"));

          break;
      }
    }
  }

  void signIn({required String email, required String password}) async {
    final firebaseAuth = FirebaseAuth.instance;
    emit(AuthenticationSigninLoading());
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      emit(AuthenticationSigninSuccess());
    } on FirebaseAuthException catch (e) {
      logger.e(e);
      switch (e.code) {
        case "invalid-credential":
          emit(AuthenticationSigninError(message: "Email or password invalid"));
          break;
        case "too-many-requests":
          emit(AuthenticationSigninError(message: "Too many requests"));
          break;
        case "timed-out":
          emit(AuthenticationSigninError(message: "Timed out"));
          break;
        default:
          emit(AuthenticationSigninError(message: "Something went wrong"));
          break;
      }
    }
  }
}
