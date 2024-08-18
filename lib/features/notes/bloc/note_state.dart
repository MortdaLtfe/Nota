part of 'note_bloc.dart';

@immutable
sealed class NoteState {}

final class NoteInitial extends NoteState {}

final class NoteLoading extends NoteState {}

final class NoteDeleted extends NoteState {}

final class NoteSearch extends NoteState {
  final List<Note> notes;
  NoteSearch({required this.notes});
}

final class NoteAdded extends NoteState {}

final class NotesLoaded extends NoteState {
  final List<Note> notes;
  NotesLoaded({required this.notes});
}
