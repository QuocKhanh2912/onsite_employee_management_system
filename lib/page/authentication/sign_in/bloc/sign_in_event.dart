part of 'sign_in_bloc.dart';


abstract class SignInEvent {}
class SignInPressEvent extends SignInEvent{
  String email;
  String password;
  SignInPressEvent({required this.email, required this.password});
}
