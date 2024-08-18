part of 'note_bloc.dart';

@immutable
sealed class NoteEvent {}

// ignore: must_be_immutable
class NoteAddRequest extends NoteEvent {
  late String title;
  late String content;
  late String uid;

  NoteAddRequest(
      {required this.title, required this.content, required this.uid});
}

// ignore: must_be_immutable
class NoteSearchRequest extends NoteEvent {
  late String query;
  NoteSearchRequest({required this.query});
}

// ignore: must_be_immutable
class NoteDeleteRequest extends NoteEvent {
  late String id;
  NoteDeleteRequest({required this.id});
}

class FetchNotes extends NoteEvent {}

// ignore: must_be_immutable
class NoteUpdateRequest extends NoteEvent {
  Note note;
  NoteUpdateRequest({required this.note});
}
