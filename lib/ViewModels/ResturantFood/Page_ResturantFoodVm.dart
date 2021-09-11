import 'package:gym_app/ViewModels/BaseViewModel.dart';
import 'package:gym_app/ViewModels/ResturantFood/ResturantFoodVm.dart';

// ignore: camel_case_types
class Page_ResturantFoodVm extends BaseViewModel {
  List<ResturantFoodVm>? items;
  int? totalPage;
  int? totalCount;
  bool? hasNext;
  int? currentPage;

  Page_ResturantFoodVm(
      {this.items,
      this.totalCount,
      this.totalPage,
      this.hasNext,
      this.currentPage});

  Page_ResturantFoodVm.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items!.add(ResturantFoodVm.fromJson(v));
      });
    }
    totalCount = json['metaData']['totalItemCount'];
    totalPage = json['metaData']['pageCount'];
    hasNext = json['metaData']['hasNextPage'];
    currentPage = json['metaData']['pageNumber'];
  }
}
