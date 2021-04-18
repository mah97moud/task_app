class GoogleLoginStates {}

class InitState extends GoogleLoginStates {}

class LoadingState extends GoogleLoginStates {}

class SuccessState extends GoogleLoginStates {}

class ErrorState extends GoogleLoginStates {
  final String error;

  ErrorState(this.error);
}
