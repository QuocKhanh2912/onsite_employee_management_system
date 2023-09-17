import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:onsite_employee_management_system/service/local/local_service.dart';

part 'set_location_event.dart';
part 'set_location_state.dart';

class SetLocationBloc extends Bloc<SetLocationEvent, SetLocationState> {
  SetLocationBloc() : super(SetLocationInitial()) {
    on<SaveLocationToLocal>((event, emit) async {
      var currentLocation = LocalService.getLocationFromLocationName(
          locationName: event.locationName);
      await LocalService.saveCurrentLocation(currentLocation: currentLocation);
      emit(SaveLocationToLocalSuccess());
    });
  }
}
