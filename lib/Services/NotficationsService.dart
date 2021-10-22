
import 'package:gym_app/Repositories/BaseRepository.dart';
import 'package:gym_app/ViewModels/Notification/NotificationVm.dart';

class NotificationsService {
  BaseRepository? repository;
  NotificationsService() {
    repository = BaseRepository();
  }
  static const String url_getNotifications = '/api/Notification/GetNotificationByUser';

  Future<NotificationVm?> getNotifications(int userId) async {
    var response =
    await repository!.get(url_getNotifications + '?userId=$userId');
    if (response != null) {
      NotificationVm result = NotificationVm.fromJson(response);
      return result;
    }
    return null;
  }
}
