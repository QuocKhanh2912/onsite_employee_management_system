part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetCurrentLocationLoading extends HomeState {}

class GetInfoHomeSuccess extends HomeState {
  String checkInTime;
  String checkOutTime;
  String workingTime;
  LocationModal currentLocation;
  LatLng currentPosition;
  Uint8List logoForMap;

  GetInfoHomeSuccess(
      {required this.checkInTime,
      required this.checkOutTime,
      required this.workingTime,
      required this.currentLocation,
      required this.currentPosition,
      required this.logoForMap});
}
