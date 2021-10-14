part of 'get_all_room_chat_bloc.dart';

@immutable
abstract class GetAllRoomChatEvent {}

class GetAllRoomChatLoadingEvent extends GetAllRoomChatEvent {}

class GetAllRoomChatLoadedEvent extends GetAllRoomChatEvent {}
