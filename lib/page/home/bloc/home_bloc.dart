import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:onsite_employee_management_system/data/location_modal.dart';
import 'package:onsite_employee_management_system/service/local/local_service.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<GetCurrentLocationEvent>(_getCurrentLocationEvent);
  }

  _getCurrentLocationEvent(
      GetCurrentLocationEvent event, Emitter<HomeState> emit) async {
    emit(GetCurrentLocationLoading());
    var currentLocation = await LocalService.getCurrentLocation();
    emit(GetCurrentLocationSuccess(currentLocation: currentLocation));
  }
}
