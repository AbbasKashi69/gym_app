import 'package:gym_app/ViewModels/BaseViewModel.dart';
import 'package:gym_app/ViewModels/Transaction/TransactionVm.dart';

// ignore: camel_case_types
class Page_TransactionVm extends BaseViewModel {
  List<TransactionVm>? items;
  int? totalPage;
  int? totalCount;
  bool? hasNext;
  int? currentPage;

  Page_TransactionVm(
      {this.items,
      this.totalCount,
      this.totalPage,
      this.hasNext,
      this.currentPage});

  Page_TransactionVm.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items!.add(TransactionVm.fromJson(v));
      });
    }
    totalCount = json['metaData']['totalItemCount'];
    totalPage = json['metaData']['pageCount'];
    hasNext = json['metaData']['hasNextPage'];
    currentPage = json['metaData']['pageNumber'];
  }
}
