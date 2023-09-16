part of 'ci_co_bloc.dart';


abstract class CiCoState {}

class CiCoInitial extends CiCoState {}
class CheckInSuccessState extends CiCoState {
  final String timeCheckIn;
  CheckInSuccessState({required this.timeCheckIn});
}
class CheckInUnSuccessState extends CiCoState {}
class CheckOutSuccessState extends CiCoState {
  final String timeCheckOut;
  CheckOutSuccessState({required this.timeCheckOut});
}
class CheckOutUnSuccessState extends CiCoState {}
