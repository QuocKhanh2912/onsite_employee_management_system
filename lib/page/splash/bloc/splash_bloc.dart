import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashLoadingEvent>(_splashLoadingEvent);
  }

  _splashLoadingEvent(SplashEvent event, Emitter<SplashState> emit) async {
    emit(SplashFinishState());
  }
}
