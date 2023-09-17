part of 'set_location_bloc.dart';


abstract class SetLocationEvent {}
class SaveLocationToLocal extends SetLocationEvent {
  String locationName;
  SaveLocationToLocal({required this.locationName});
}

