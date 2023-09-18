import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:onsite_employee_management_system/data/location_modal.dart';
import 'package:onsite_employee_management_system/service/local/local_service.dart';

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
    emit(GetInfoHomeSuccess(
        checkInTime: checkInTime,
        checkOutTime: checkOutTime,
        workingTime: workingTime,
        currentLocation: currentLocation));
  }
}
