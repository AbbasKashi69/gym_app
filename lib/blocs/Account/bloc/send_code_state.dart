part of 'send_code_bloc.dart';

@immutable
abstract class SendCodeState {}

class SendCodeInitialState extends SendCodeState {}

class SendCodeLoadingState extends SendCodeState {}

class SendCodeErrorState extends SendCodeState {
  final String message;
  SendCodeErrorState({required this.message});
}

class SendCodeLoadedState extends SendCodeState {
  final ResultObject? resultObject;
  SendCodeLoadedState({this.resultObject});
}
