import 'package:gym_app/ViewModels/BaseViewModel.dart';
import 'package:gym_app/ViewModels/WalletLog/WalletLogVm.dart';

// ignore: camel_case_types
class Page_WalletLogVm extends BaseViewModel {
  List<WalletLogVm>? items;
  int? totalPage;
  int? totalCount;
  bool? hasNext;
  int? currentPage;

  Page_WalletLogVm(
      {this.items,
      this.totalCount,
      this.totalPage,
      this.hasNext,
      this.currentPage});

  Page_WalletLogVm.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items!.add(WalletLogVm.fromJson(v));
      });
    }
    totalCount = json['metaData']['totalItemCount'];
    totalPage = json['metaData']['pageCount'];
    hasNext = json['metaData']['hasNextPage'];
    currentPage = json['metaData']['pageNumber'];
  }
}
