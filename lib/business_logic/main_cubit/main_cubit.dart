import 'package:active_box/data/models/note_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  static MainCubit get(context) => BlocProvider.of(context);

  Future<void> addNote({
    required String title,
    required String details,
  }) async {
    DocumentReference? note;
    NoteModel noteModel = NoteModel(
      title: title,
      details: details,
    );
    note = await FirebaseFirestore.instance
        .collection('notes')
        .add(noteModel.toMap());
    FirebaseFirestore.instance.collection('notes').doc(note.id).update({
      'id': note.id,
      'password': noteModel.password,
      'title': noteModel.title,
      'details': noteModel.details,
    }).then((value) {
      getAllNotes();
      emit(AddNoteSuccessState());
    }).catchError((error) {
      emit(AddNoteErrorState(error.toString()));
      debugPrint('error from add note ${error.toString()}');
    });
  }

  List<NoteModel> allNotes = [];

  void getAllNotes() {
    emit(GetAllNotesLoadingState());
    FirebaseFirestore.instance.collection('notes').snapshots().listen((event) {
      allNotes = [];
      for (var element in event.docs) {
        allNotes.add(NoteModel.fromJson(element.data()));
      }
      emit(GetAllNotesSuccessState());
    });
  }

  Future<void> updateNoteDetails(
    String? id, {
    required String title,
    required String details,
    required String password,
    required String idNote,
  }) async {
    NoteModel noteModel = NoteModel(
      title: title,
      details: details,
      password: password,
      id: idNote,
    );
    await FirebaseFirestore.instance
        .collection('notes')
        .doc(id)
        .update(noteModel.toMap())
        .then((value) {
      getAllNotes();
      //emit(EditNoteSuccessState());
    }).catchError((error) {
      emit(EditNoteErrorState(error.toString()));
      debugPrint('error from edit note ${error.toString()}');
    });
  }

  void deleteNote(String? id) {
    FirebaseFirestore.instance
        .collection('notes')
        .doc(id)
        .delete()
        .then((value) {
      getAllNotes();
      //emit(DeleteNoteSuccessState());
    }).catchError((error) {
      emit(DeleteNoteErrorState(error.toString()));
      debugPrint('error from delete note ${error.toString()}');
    });
  }
  List<NoteModel> searchNote=[];
  void getSearchNote(String name)
  {
    searchNote = [];
    searchNote = allNotes.where((element) => element.title!.contains(name)).toList();
    print(searchNote.length);
    emit(GetSearchNotesSuccessState());
  }
}
