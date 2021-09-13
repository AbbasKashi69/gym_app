import 'package:gym_app/Repositories/BaseRepository.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:gym_app/ViewModels/WalletLog/IncreaseCreditVm.dart';
import 'package:gym_app/ViewModels/WalletLog/Page_WallteLogVm.dart';
import 'package:gym_app/ViewModels/WalletLog/UserWalletVm.dart';
import 'package:gym_app/ViewModels/WalletLog/WalletLogVm.dart';

class WalletLogService {
  BaseRepository? repository;
  WalletLogService() {
    repository = BaseRepository();
  }

  static const String url_create = '/api/WalletLog/Create';
  static const String url_getAll = '/api/WalletLog/GetAll';
  static const String url_getMyWalletBallance =
      '/api/WalletLog/GetMyWalletBallance';
  static const String url_increaseCredit = '/api/WalletLog/IncreaseCredit';
  static const String url_loadTransactionOfWallet =
      '/api/WalletLog/LoadTransactionOfWallet';

  Future<ResultObject?> create(WalletLogVm walletLogVm) async {
    var response = await repository!.post(url_create, walletLogVm.toJson());
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }

  Future<Page_WalletLogVm?> getAll([int pageNumber = 1]) async {
    var response =
        await repository!.get(url_getAll + '?pageNumber=$pageNumber');
    if (response != null) {
      Page_WalletLogVm result = Page_WalletLogVm.fromJson(response);
      return result;
    }
    return null;
  }

  Future<UserWalletVm?> getMyWalletBallance() async {
    var response = await repository!.get(url_getMyWalletBallance);
    if (response != null) {
      UserWalletVm result = UserWalletVm.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> increaseCredit(
      IncreaseCreditVm increaseCreditVm) async {
    var response =
        await repository!.post(url_increaseCredit, increaseCreditVm.toJson());
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }

  Future<Page_WalletLogVm?> loadTransactionOfWallet(int transactionId,
      [int pageNumber = 1]) async {
    var response = await repository!.get(url_loadTransactionOfWallet +
        '?transactionId=$transactionId&pageNumber=$pageNumber');
    if (response != null) {
      Page_WalletLogVm result = Page_WalletLogVm.fromJson(response);
      return result;
    }
    return null;
  }
}
