import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nota/features/notes/adapter/note_adapter.dart';
import 'package:nota/features/notes/note.dart';
import 'package:nota/firebase_options.dart';
import 'package:nota/root.dart';
import 'package:nota/utils/constants/strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>(NOTE_DATABASE);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const Root());
}
