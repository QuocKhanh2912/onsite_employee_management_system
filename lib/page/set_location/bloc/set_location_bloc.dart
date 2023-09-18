import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:onsite_employee_management_system/service/geolocation/determine_position.dart';
import 'package:onsite_employee_management_system/service/local/local_service.dart';

part 'set_location_event.dart';

part 'set_location_state.dart';

class SetLocationBloc extends Bloc<SetLocationEvent, SetLocationState> {
  SetLocationBloc() : super(SetLocationInitial()) {
    on<SaveLocationToLocalEvent>(_saveLocationToLocal);
    on<CheckNearLocationEvent>(_checkNearLocationEvent);
  }

  _saveLocationToLocal(SaveLocationToLocalEvent event, emit) async {
    var currentLocation = LocalService.getLocationFromLocationName(
        locationName: event.locationName);
    await LocalService.saveCurrentLocation(currentLocation: currentLocation);
    emit(SaveLocationToLocalSuccess());
  }

  _checkNearLocationEvent(CheckNearLocationEvent event, emit) async {
    emit(CheckLocationLoading());
    var currentLocation = await LocalService.getCurrentLocation();
    var locationLatLng = currentLocation.locationLatLng;
    var distance = await GeolocationService.determineDistance(
        locationLatLng: locationLatLng);
    if (distance > 100) {
      emit(FarAwayLocationState());
    } else {
      emit(NearLocationState());
    }
  }
}
