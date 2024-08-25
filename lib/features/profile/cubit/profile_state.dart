part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileChanged extends ProfileState {}

final class ProfileFailure extends ProfileState {
  final String message;
  ProfileFailure({required this.message});
}
