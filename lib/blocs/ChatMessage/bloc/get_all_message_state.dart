part of 'get_all_message_bloc.dart';

@immutable
abstract class GetAllMessageState {}

class GetAllMessageInitialState extends GetAllMessageState {}

class GetAllMessageLoadingState extends GetAllMessageState {}

class GetAllMessageErrorSatte extends GetAllMessageState {
  final String message;
  GetAllMessageErrorSatte({required this.message});
}

class GetAllMessageLoadedState extends GetAllMessageState {
  final PageChatMessageVm? pageChatMessageVm;
  GetAllMessageLoadedState({required this.pageChatMessageVm});
  GetAllMessageLoadedState copyWith(PageChatMessageVm? newList) {
    return GetAllMessageLoadedState(
        pageChatMessageVm: newList ?? pageChatMessageVm);
  }
}
