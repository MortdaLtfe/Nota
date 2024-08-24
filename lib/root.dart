import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/features/authentication/cubit/authentication_cubit.dart';
import 'package:nota/features/backup/cubit/backup_cubit.dart';
import 'package:nota/features/homepage/homepage_view.dart';
import 'package:nota/features/notes/bloc/note_bloc.dart';
import 'package:nota/features/notes/providers/note_provider.dart';
import 'package:nota/features/notes/repositories/note_repository.dart';
import 'package:nota/features/profile/cubit/profile_cubit.dart';
import 'package:nota/utils/theme/app_theme.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => NoteBloc(
                  noteRepository:
                      NoteRepository(noteProvider: NoteProvider()))),
          BlocProvider(create: (context) => AuthenticationCubit()),
          BlocProvider(create: (context) => ProfileCubit()),
          BlocProvider(create: (context) => BackupCubit()),
        ],
        child: MaterialApp(
          theme: AppTheme.lightTheme,
          themeMode: ThemeMode.dark,
          darkTheme: AppTheme.darkTheme,
          debugShowCheckedModeBanner: false,
          home: const Homepage(),
        ));
  }
}
