import 'package:gym_app/ViewModels/BaseViewModel.dart';
import 'package:gym_app/ViewModels/MoneyRequest/MoneyRequestVm.dart';
import 'package:gym_app/ViewModels/WalletLog/WalletLogVm.dart';

// ignore: camel_case_types
class Page_MoneyRequestVm extends BaseViewModel {
  List<MoneyRequestVm>? items;
  int? totalPage;
  int? totalCount;
  bool? hasNext;
  int? currentPage;

  Page_MoneyRequestVm(
      {this.items,
        this.totalCount,
        this.totalPage,
        this.hasNext,
        this.currentPage});

  Page_MoneyRequestVm.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items!.add(MoneyRequestVm.fromJson(v));
      });
    }
    totalCount = json['metaData']['totalItemCount'];
    totalPage = json['metaData']['pageCount'];
    hasNext = json['metaData']['hasNextPage'];
    currentPage = json['metaData']['pageNumber'];
  }
}
