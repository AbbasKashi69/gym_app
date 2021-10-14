part of 'get_all_message_bloc.dart';

@immutable
abstract class GetAllMessageEvent {}

class GetAllMessageLoadingEvent extends GetAllMessageEvent {
  final int roomId;
  GetAllMessageLoadingEvent({required this.roomId});
}

class GetAllMessageLoadedEvent extends GetAllMessageEvent {
  final int roomId;
  GetAllMessageLoadedEvent({required this.roomId});
}
