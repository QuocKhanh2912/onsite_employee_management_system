part of 'ci_co_bloc.dart';

abstract class CiCoEvent {
  String time;

  CiCoEvent({required this.time});
}

class CheckInEvent extends CiCoEvent {
  CheckInEvent({required super.time});
}

class CheckOutEvent extends CiCoEvent {
  CheckOutEvent({required super.time});
}
