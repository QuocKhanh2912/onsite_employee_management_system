import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:onsite_employee_management_system/domain/authentication.dart';
import 'package:onsite_employee_management_system/service/local/auth_local_service.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInPressEvent>(_signInPressEvent);
  }

  _signInPressEvent(SignInPressEvent event, Emitter<SignInState> emit) async {
    emit(SignInLoadingState());
    var token = await AuthService.signInByEmail(
        email: event.email, password: event.password);
    if (token.isNotEmpty) {
      await AuthLocalService.saveTokenToLocal(token: token);
      emit(SignInSuccessState());
    } else {
      emit(SignInUnSuccessState());
    }
  }
}
