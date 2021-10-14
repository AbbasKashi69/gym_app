import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/RoomChatService.dart';
import 'package:gym_app/ViewModels/ChatMessage/Page_ChatMessageVm.dart';
import 'package:meta/meta.dart';

part 'get_all_room_chat_event.dart';
part 'get_all_room_chat_state.dart';

class GetAllRoomChatBloc
    extends Bloc<GetAllRoomChatEvent, GetAllRoomChatState> {
  GetAllRoomChatBloc() : super(GetAllRoomChatInitialState());
  RoomChatService _roomChatService = RoomChatService();

  @override
  Stream<GetAllRoomChatState> mapEventToState(
      GetAllRoomChatEvent event) async* {
    if (event is GetAllRoomChatLoadingEvent) {
      try {
        yield GetAllRoomChatLoadingState();
        var data = await _roomChatService.getAllRoomChat();
        yield GetAllRoomChatLoadedState(pageChatMessageVm: data);
      } catch (e) {
        print('error in getAll Room chat loaded state ' + e.toString());
        yield GetAllRoomChatErrorSatte(message: e.toString());
      }
    } else if (event is GetAllRoomChatLoadedEvent) {
      var oldState = state as GetAllRoomChatLoadedState;
      PageChatMessageVm? newList;
      if (oldState.pageChatMessageVm!.hasNext!) {
        newList = await _roomChatService
            .getAllRoomChat(oldState.pageChatMessageVm!.currentPage! + 1);
        if (newList != null)
          newList.items = oldState.pageChatMessageVm!.items! + newList.items!;

        if (newList != null &&
            newList.items != null &&
            newList.items!.isNotEmpty)
          yield GetAllRoomChatLoadedState(pageChatMessageVm: newList);
        else
          yield oldState.copyWith(oldState.pageChatMessageVm);
      }
    }
  }
}
