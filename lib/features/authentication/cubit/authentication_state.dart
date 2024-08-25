part of 'authentication_cubit.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationSignupError extends AuthenticationState {
  final String message;

  AuthenticationSignupError({required this.message});
}

final class AuthenticationSignupSuccess extends AuthenticationState {}

final class AuthenticationSignupLoading extends AuthenticationState {}

final class AuthenticationSigninError extends AuthenticationState {
  final String message;

  AuthenticationSigninError({required this.message});
}

final class AuthenticationSigninSuccess extends AuthenticationState {}

final class AuthenticationSigninLoading extends AuthenticationState {}
