import 'package:gym_app/Repositories/BaseRepository.dart';
import 'package:gym_app/ViewModels/ChatMessage/Page_ChatMessageVm.dart';

class RoomChatService {
  late BaseRepository repository;
  RoomChatService() {
    repository = BaseRepository();
  }
  static const String url_getAllRoomChat = '/api/RoomChat/GetAllRoomChat';

  Future<PageChatMessageVm?> getAllRoomChat(
      [int pageNumber = 1, int pageSize = 10]) async {
    var response = await repository
        .get(url_getAllRoomChat + '?pageNumber=$pageNumber&pageSize=$pageSize');
    if (response != null) {
      PageChatMessageVm result = PageChatMessageVm.fromJson(response);
      return result;
    }
    return null;
  }
}
