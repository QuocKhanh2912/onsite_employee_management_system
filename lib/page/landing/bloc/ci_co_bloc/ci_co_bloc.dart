import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onsite_employee_management_system/domain/authentication.dart';
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
    emit(IsCheckInLoadingState());
    try {
      var isCheckIn = await AuthService.isCheckIn();
      if (isCheckIn) {
        emit(CheckedInState());
      } else {
        print('asdasdsadsa');
        emit(NotCheckedInState());
      }
    } catch (e) {
      emit(SomethingWrongState());
    }
  }

  _checkInEvent(CheckInEvent event, Emitter<CiCoState> emit) async {
    emit(CheckInLoadingState());
    try {
      var currentLocation = await LocalService.getCurrentLocation();
      var locationLatLng = currentLocation.locationLatLng;
      var distance = await GeolocationService.determineDistance(
          locationLatLng: locationLatLng);
      if (distance <= 100) {
        var userInfo = await AuthService.checkInActivity();
        if (userInfo != null) {
          var time = userInfo.checkedInAt.toString();
          var checkInAt = DateTimeManagement.changeDataTimeFormat(time: time);
          await LocalService.saveTimeCheckIn(time: checkInAt);
          emit(CheckInSuccessState(checkInAt: checkInAt));
        } else {
          emit(CheckInUnSuccessState());
        }
      } else {
        emit(FarFromLocationState());
      }
    } catch (e) {
      emit(CheckInUnSuccessState());
    }
  }

  _checkOutEvent(CheckOutEvent event, Emitter<CiCoState> emit) async {
    emit(CheckOutLoadingState());
    try {
      var currentLocation = await LocalService.getCurrentLocation();
      var locationLatLng = currentLocation.locationLatLng;
      var distance = await GeolocationService.determineDistance(
          locationLatLng: locationLatLng);
      if (distance <= 100) {
        var userInfo = await AuthService.checkOutActivity();
        if (userInfo != null) {
          var time = userInfo.checkedOutAt.toString();
          var checkOutAt = DateTimeManagement.changeDataTimeFormat(time: time);
          await LocalService.saveTimeCheckOutAndWorking(time: checkOutAt);
          emit(CheckOutSuccessState(checkOutAt: checkOutAt));
        } else {
          emit(CheckOutUnSuccessState());
        }
      } else {
        emit(FarFromLocationState());
      }
    } catch (e) {
      emit(CheckOutUnSuccessState());
    }
  }
}
