import 'package:gym_app/ViewModels/BaseViewModel.dart';
import 'package:gym_app/ViewModels/PlanTypeLog/PlanTypeLogVm.dart';

// ignore: camel_case_types
class Page_PlanTypeLogVm extends BaseViewModel {
  List<PlanTypeLogvm>? items;
  int? totalPage;
  int? totalCount;
  bool? hasNext;
  int? currentPage;

  Page_PlanTypeLogVm(
      {this.items,
      this.totalCount,
      this.totalPage,
      this.hasNext,
      this.currentPage});

  Page_PlanTypeLogVm.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items!.add(PlanTypeLogvm.fromJson(v));
      });
    }
    totalCount = json['metaData']['totalItemCount'];
    totalPage = json['metaData']['pageCount'];
    hasNext = json['metaData']['hasNextPage'];
    currentPage = json['metaData']['pageNumber'];
  }
}
