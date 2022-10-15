import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility ;
  bool isPassword = true ;

  void changePasswordVisiability(){
    isPassword = !isPassword ;
    suffix = isPassword ?  Icons.visibility : Icons.visibility_off ;
    emit(ChangePasswordVisiabilityState());
  }
}
