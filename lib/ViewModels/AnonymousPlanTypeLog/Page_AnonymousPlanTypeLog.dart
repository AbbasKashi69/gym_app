import 'package:gym_app/ViewModels/AnonymousPlanTypeLog/AnonymousPlanTypeLogVm.dart';

class Page_AnonymousPlanTypeLogVm {
  List<AnonymousPlanTypeLogVm>? items;
  int? totalPage;
  int? totalCount;
  bool? hasNext;
  int? currentPage;

  Page_AnonymousPlanTypeLogVm(
      {this.items,
      this.totalCount,
      this.totalPage,
      this.hasNext,
      this.currentPage});

  Page_AnonymousPlanTypeLogVm.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items!.add(AnonymousPlanTypeLogVm.fromJson(v));
      });
    }
    totalCount = json['metaData']['totalItemCount'];
    totalPage = json['metaData']['pageCount'];
    hasNext = json['metaData']['hasNextPage'];
    currentPage = json['metaData']['pageNumber'];
  }
}
