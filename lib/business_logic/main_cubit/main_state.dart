part of 'main_cubit.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

class AddNoteSuccessState  extends MainState {}

class AddNoteErrorState extends MainState
{
  final String error;
  AddNoteErrorState(this.error);
}
class EditNoteSuccessState  extends MainState {}

class EditNoteErrorState extends MainState
{
  final String error;
  EditNoteErrorState(this.error);
}

class GetAllNotesSuccessState  extends MainState {}

class GetAllNotesLoadingState  extends MainState {}


class DeleteNoteSuccessState  extends MainState {}

class DeleteNoteErrorState extends MainState
{
  final String error;
  DeleteNoteErrorState(this.error);
}

class GetSearchNotesSuccessState  extends MainState {}


