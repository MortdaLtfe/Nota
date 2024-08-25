part of 'backup_cubit.dart';

@immutable
sealed class BackupState {}

final class BackupInitial extends BackupState {}

final class BackupLoading extends BackupState {}

final class RestoreLoading extends BackupState {}

final class RestoreSuccess extends BackupState {}

final class BackupSuccess extends BackupState {}
