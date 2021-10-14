import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/ChatMessageService.dart';
import 'package:gym_app/ViewModels/ChatMessage/Page_ChatMessageVm.dart';
import 'package:meta/meta.dart';

part 'get_all_message_event.dart';
part 'get_all_message_state.dart';

class GetAllMessageBloc extends Bloc<GetAllMessageEvent, GetAllMessageState> {
  GetAllMessageBloc() : super(GetAllMessageInitialState());
  ChatMessageService _chatMessageService = ChatMessageService();

  @override
  Stream<GetAllMessageState> mapEventToState(GetAllMessageEvent event) async* {
    if (event is GetAllMessageLoadingEvent) {
      try {
        yield GetAllMessageLoadingState();
        var data = await _chatMessageService.getAllMessage(event.roomId);
        yield GetAllMessageLoadedState(pageChatMessageVm: data);
      } catch (e) {
        print('error in getAll message loaded state ' + e.toString());
        yield GetAllMessageErrorSatte(message: e.toString());
      }
    } else if (event is GetAllMessageLoadedEvent) {
      var oldState = state as GetAllMessageLoadedState;
      PageChatMessageVm? newList;
      if (oldState.pageChatMessageVm!.hasNext!) {
        newList = await _chatMessageService.getAllMessage(
            event.roomId, oldState.pageChatMessageVm!.currentPage! + 1);
        if (newList != null)
          newList.items = oldState.pageChatMessageVm!.items! + newList.items!;

        if (newList != null &&
            newList.items != null &&
            newList.items!.isNotEmpty)
          yield GetAllMessageLoadedState(pageChatMessageVm: newList);
        else
          yield oldState.copyWith(oldState.pageChatMessageVm);
      }
    }
  }
}
