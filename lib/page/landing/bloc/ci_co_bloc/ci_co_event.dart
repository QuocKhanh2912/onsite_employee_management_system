part of 'ci_co_bloc.dart';

abstract class CiCoEvent {}

class CheckInEvent extends CiCoEvent {}

class CheckOutEvent extends CiCoEvent {}
class CheckInYetEvent extends CiCoEvent {}
class CheckOutYetEvent extends CiCoEvent {}




