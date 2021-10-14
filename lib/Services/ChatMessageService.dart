import 'package:gym_app/Repositories/BaseRepository.dart';
import 'package:gym_app/ViewModels/BaseViewModel.dart';
import 'package:gym_app/ViewModels/ChatMessage/ChatMessageVm.dart';
import 'package:gym_app/ViewModels/ChatMessage/Page_ChatMessageVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';

class ChatMessageService extends BaseViewModel {
  late BaseRepository repository;
  ChatMessageService() {
    repository = BaseRepository();
  }

  static const String url_create = '/api/ChatMessage/Create';
  static const String url_delete = '/api/ChatMessage/Delete';
  static const String url_getAllMessage = '/api/ChatMessage/GetAllMessage';

  Future<ResultObject?> create(ChatMessageVm chatMessageVm) async {
    var response = await repository.post(url_create, chatMessageVm.toJson());
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> delete(int id) async {
    var response = await repository.delete(url_delete, id);
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }

  Future<PageChatMessageVm?> getAllMessage(int roomId,
      [int pageNumber = 1, int pageSize = 20]) async {
    var response = await repository.get(url_getAllMessage +
        '?RoomId=$roomId&pageNumber=$pageNumber&pageSize=$pageSize');
    if (response != null) {
      PageChatMessageVm result = PageChatMessageVm.fromJson(response);
      return result;
    }
    return null;
  }
}
