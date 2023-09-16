import 'package:bloc/bloc.dart';

part 'ci_co_event.dart';

part 'ci_co_state.dart';

class CiCoBloc extends Bloc<CiCoEvent, CiCoState> {
  CiCoBloc() : super(CiCoInitial()) {
    on<CheckInEvent>(_checkInEvent);
    on<CheckOutEvent>(_checkOutEvent);
  }

  _checkInEvent(CheckInEvent event, Emitter<CiCoState> emit) {
    try {
      emit(CheckInSuccessState(timeCheckIn: event.time));
    } catch (e) {
      emit(CheckInUnSuccessState());
    }
  }

  _checkOutEvent(CheckOutEvent event, Emitter<CiCoState> emit) {
    try {
      emit(CheckOutSuccessState(timeCheckOut: event.time));
    } catch (e) {
      emit(CheckOutUnSuccessState());
    }
  }
}
