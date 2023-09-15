part of 'splash_bloc.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashLoadingState extends SplashState {}

class SplashFinishState extends SplashState {}
