import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/features/backup/cubit/backup_cubit.dart';
import 'package:nota/features/notes/bloc/note_bloc.dart';

class BackupController {
  final BuildContext context;

  BackupController({required this.context});
  void backup() {
    context.read<BackupCubit>().backup();
  }

  Future<void> restore() async {
    await context.read<BackupCubit>().restore();
    // ignore: use_build_context_synchronously
    context.read<NoteBloc>().add(FetchNotes());
  }
}
