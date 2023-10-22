abstract class AvtoState {}

class AvtoInitialState extends AvtoState {}

class LoadingState extends AvtoState {}

class SuccessState extends AvtoState {}

class ErrorState extends AvtoState {
  final String message;

  ErrorState({required this.message});
}
