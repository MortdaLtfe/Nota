import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:nota/features/notes/note.dart';
import 'package:nota/utils/constants/strings.dart';

class BackupRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final notesBox = Hive.box<Note>(NOTE_DATABASE);
  final Logger _logger = Logger();

  /// Backup the notes to the cloud
  Future<void> backup() async {
    // Get all notes from the local database
    final notes = notesBox.values.toList();
    final String uid = FirebaseAuth.instance.currentUser!.uid;
    // Loop through each note and add it to the cloud database
    for (final note in notes) {
      await _firestore
          .collection('backup')
          .doc(uid)
          .collection("notes")
          .doc(note.id)
          .set(note.toMap());
    }
    _logger.d("BackupRepository: ${notes.length} Backup has been completed");
  }

  /// Restore the notes from the cloud
  Future<void> restore() async {
    try {
      final String uid = FirebaseAuth.instance.currentUser!.uid;

      // Get all notes from the cloud database
      final notes = await _firestore
          .collection('backup')
          .doc(uid)
          .collection('notes')
          .get();

      // Loop through each note and add it to the local database
      for (final note in notes.docs) {
        await notesBox.put(note.id, Note.fromMap(note.data()));
      }

      _logger.d(
          "BackupRepository: ${notes.docs.length} Restore has been completed");
      _logger.d(notesBox.values.toList());
    } catch (e) {
      _logger.d(e);
    }
  }
}
