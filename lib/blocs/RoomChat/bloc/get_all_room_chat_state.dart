part of 'get_all_room_chat_bloc.dart';

@immutable
abstract class GetAllRoomChatState {}

class GetAllRoomChatInitialState extends GetAllRoomChatState {}

class GetAllRoomChatLoadingState extends GetAllRoomChatState {}

class GetAllRoomChatErrorSatte extends GetAllRoomChatState {
  final String message;
  GetAllRoomChatErrorSatte({required this.message});
}

class GetAllRoomChatLoadedState extends GetAllRoomChatState {
  final PageChatMessageVm? pageChatMessageVm;
  GetAllRoomChatLoadedState({required this.pageChatMessageVm});
  GetAllRoomChatLoadedState copyWith(PageChatMessageVm? newList) {
    return GetAllRoomChatLoadedState(
        pageChatMessageVm: newList ?? pageChatMessageVm);
  }
}
