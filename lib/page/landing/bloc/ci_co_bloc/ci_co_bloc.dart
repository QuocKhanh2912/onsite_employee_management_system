import 'package:bloc/bloc.dart';
import 'package:onsite_employee_management_system/service/geolocation/determine_position.dart';
import 'package:onsite_employee_management_system/service/local/local_service.dart';
import 'package:onsite_employee_management_system/utils/date_time_management.dart';

part 'ci_co_event.dart';

part 'ci_co_state.dart';

class CiCoBloc extends Bloc<CiCoEvent, CiCoState> {
  CiCoBloc() : super(CiCoInitial()) {
    on<CheckInEvent>(_checkInEvent);
    on<CheckOutEvent>(_checkOutEvent);
    on<CheckInYetEvent>(_checkInYetEvent);
  }

  _checkInYetEvent(CheckInYetEvent event, Emitter<CiCoState> emit) async {
    var timeCheckIn = await LocalService.getTimeCheckIn();
    if (timeCheckIn == '--:--' || timeCheckIn.isEmpty) {
      emit(NotCheckedInState());
    } else {
      emit(CheckedInState());
    }
  }

  _checkInEvent(CheckInEvent event, Emitter<CiCoState> emit) async {
    try {
      var currentLocation = await LocalService.getCurrentLocation();
      var locationLatLng = currentLocation.locationLatLng;
      var distance = await GeolocationService.determineDistance(
          locationLatLng: locationLatLng);
      if (distance <= 100) {
        await LocalService.saveTimeCheckIn(
            time: DateTimeManagement.getCurrentTime());
        emit(CheckInSuccessState(
            timeCheckIn: DateTimeManagement.getCurrentTime()));
      } else {
        emit(CheckInSuccessButOutSideState(
            timeCheckIn: DateTimeManagement.getCurrentTime()));
      }
    } catch (e) {
      emit(CheckInUnSuccessState());
    }
  }

  _checkOutEvent(CheckOutEvent event, Emitter<CiCoState> emit) async {
    try {
      var currentLocation = await LocalService.getCurrentLocation();
      var locationLatLng = currentLocation.locationLatLng;
      var distance = await GeolocationService.determineDistance(
          locationLatLng: locationLatLng);
      if (distance <= 100) {
        await LocalService.saveTimeCheckOutAndWorking(
            time: DateTimeManagement.getCurrentTime());
        emit(CheckOutSuccessState(
            timeCheckOut: DateTimeManagement.getCurrentTime()));
      } else {
        emit(CheckOutSuccessButOutSideState(
            timeCheckOut: DateTimeManagement.getCurrentTime()));
      }
    } catch (e) {
      emit(CheckOutUnSuccessState());
    }
  }
}
