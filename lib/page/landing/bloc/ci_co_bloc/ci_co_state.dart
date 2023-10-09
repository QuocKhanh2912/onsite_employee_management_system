part of 'ci_co_bloc.dart';

abstract class CiCoState {}

class CiCoInitial extends CiCoState {}

class SomethingWrongState extends CiCoState {}

class IsCheckInLoadingState extends CiCoState {}

class CheckedInState extends CiCoState {}

class NotCheckedInState extends CiCoState {}

class CheckInLoadingState extends CiCoState {}

class CheckOutLoadingState extends CiCoState {}

class CheckInSuccessState extends CiCoState {
  String checkInAt;

  CheckInSuccessState({required this.checkInAt});
}

class CheckOutSuccessState extends CiCoState {
  String checkOutAt;

  CheckOutSuccessState({required this.checkOutAt});
}

class CheckInUnSuccessState extends CiCoState {}

class CheckOutUnSuccessState extends CiCoState {}

class FarFromLocationState extends CiCoState {}
