part of 'set_location_bloc.dart';

@immutable
abstract class SetLocationState {}

class SetLocationInitial extends SetLocationState {}
class SaveLocationToLocalSuccess extends SetLocationState {}
