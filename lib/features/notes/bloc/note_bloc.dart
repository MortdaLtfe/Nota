import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:nota/features/notes/note.dart';
import 'package:nota/features/notes/repositories/note_repository.dart';
part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final NoteRepository noteRepository;
  final Logger _logger = Logger();
  NoteBloc({required this.noteRepository}) : super(NoteInitial()) {
    on<FetchNotes>((event, emit) async {
      emit(NoteLoading());
      await noteRepository
          .find()
          .then((value) => emit(NotesLoaded(notes: value)));
    });
    on<NoteAddRequest>((event, emit) async {
      emit(NoteLoading());
      await noteRepository.create(
          content: event.content, title: event.title, uid: event.uid);
      emit(NoteAdded());
      add(FetchNotes());
    });
    on<NoteUpdateRequest>((event, emit) async {
      emit(NoteLoading());
      await noteRepository.update(event.note);
      add(FetchNotes());
    });
    on<NoteDeleteRequest>((event, emit) async {
      emit(NoteLoading());
      await noteRepository.delete(id: event.id);
      emit(NoteDeleted());
      add(FetchNotes());
    });
    on<NoteSearchRequest>(
      (event, emit) async {
        emit(NoteLoading());
        List<Note> notes = await noteRepository.find();
        emit(NoteSearch(
            notes: notes
                .where((note) => note.title
                    .toLowerCase()
                    .startsWith(event.query.toLowerCase()))
                .toList()));
      },
    );
  }
  @override
  void onChange(Change<NoteState> change) {
    super.onChange(change);
    _logger.d(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    _logger.e(error);
  }

  @override
  void onTransition(Transition<NoteEvent, NoteState> transition) {
    super.onTransition(transition);
    _logger.d(transition);
  }
}
