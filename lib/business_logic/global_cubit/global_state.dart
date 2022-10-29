part of 'global_cubit.dart';

@immutable
abstract class GlobalState {}

class GlobalInitial extends GlobalState {}
class ChangePasswordVisiabilityState extends GlobalState {}
class WrongPasswordState extends GlobalState {}
class DonePasswordState extends GlobalState {}
