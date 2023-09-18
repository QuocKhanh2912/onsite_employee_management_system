part of 'set_location_bloc.dart';


abstract class SetLocationEvent {}
class SaveLocationToLocalEvent extends SetLocationEvent {
  String locationName;
  SaveLocationToLocalEvent({required this.locationName});
}

class CheckNearLocationEvent extends SetLocationEvent {}


