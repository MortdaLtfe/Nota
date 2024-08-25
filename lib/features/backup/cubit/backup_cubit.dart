import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:nota/features/backup/repositories/backup_repositories.dart';

part 'backup_state.dart';

class BackupCubit extends Cubit<BackupState> {
  BackupCubit() : super(BackupInitial());
  final Logger _logger = Logger();
  final BackupRepository _backupRepository = BackupRepository();

  Future<void> backup() async {
    try {
      emit(BackupLoading());
      await _backupRepository.backup();
      emit(BackupSuccess());
    } catch (e) {
      _logger.d(e);
    }
  }

  Future<void> restore() async {
    try {
      emit(RestoreLoading());
      await _backupRepository.restore();
      emit(RestoreSuccess());
    } catch (e) {
      _logger.d(e);
    }
  }
}
