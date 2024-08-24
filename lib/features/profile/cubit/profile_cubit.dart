import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Logger logger = Logger();
  Future<void> changeProfile(
      {String? email,
      String? newPassword,
      required String password,
      String? name}) async {
    emit(ProfileLoading());
    try {
      AuthCredential credential = EmailAuthProvider.credential(
        email: firebaseAuth.currentUser!.email!,
        password: password,
      );
      await firebaseAuth.currentUser!.reauthenticateWithCredential(credential);
      if (name != null) {
        logger.d("It should change the display name");
        await firebaseAuth.currentUser!.updateDisplayName(name);
      }
      if (email != null && email.isNotEmpty) {
        // ignore: deprecated_member_use
        await firebaseAuth.currentUser!.updateEmail(email);
      }
      if (newPassword != null && newPassword.isNotEmpty) {
        await firebaseAuth.currentUser!.updatePassword(newPassword);
      }
      emit(ProfileChanged());
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "":
          break;
        default:
      }
      logger.e(e);
      emit(ProfileFailure(message: e.code));
    }
  }
}
