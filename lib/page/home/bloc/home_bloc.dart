import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'package:onsite_employee_management_system/data/location_modal.dart';
import 'package:onsite_employee_management_system/service/local/get_unit_8_list.dart';
import 'package:onsite_employee_management_system/service/local/local_service.dart';
import 'package:onsite_employee_management_system/utils/assets_management.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<GetInfoHomeEvent>(_getTimeValueEvent);
  }

  _getTimeValueEvent(GetInfoHomeEvent event, Emitter<HomeState> emit) async {
    var checkInTime = await LocalService.getTimeCheckIn();
    var checkOutTime = await LocalService.getTimeCheckOut();
    var workingTime = await LocalService.getTimeWorking();
    var currentLocation = await LocalService.getCurrentLocation();
    var currentPosition = await LocalService.getCurrentPosition();
    var logoForMap =
        await GetUnit8List.getImageBytesFromAsset(AssetsManagement.smallLogo);
    emit(GetInfoHomeSuccess(
        checkInTime: checkInTime,
        checkOutTime: checkOutTime,
        workingTime: workingTime,
        currentLocation: currentLocation,
        currentPosition: currentPosition,
        logoForMap: logoForMap));
  }
}
