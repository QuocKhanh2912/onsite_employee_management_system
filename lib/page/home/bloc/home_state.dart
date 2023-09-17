part of 'home_bloc.dart';


abstract class HomeState {}

class HomeInitial extends HomeState {}
class GetCurrentLocationLoading extends HomeState {}
class GetCurrentLocationSuccess extends HomeState {
  LocationModal currentLocation;
  GetCurrentLocationSuccess({required this.currentLocation});
}

