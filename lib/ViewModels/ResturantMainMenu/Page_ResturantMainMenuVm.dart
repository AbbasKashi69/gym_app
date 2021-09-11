import 'package:gym_app/ViewModels/BaseViewModel.dart';
import 'package:gym_app/ViewModels/ResturantFood/ResturantFoodVm.dart';
import 'package:gym_app/ViewModels/ResturantMainMenu/ResturantMainMenuVm.dart';

// ignore: camel_case_types
class Page_ResturantMainMenuVm extends BaseViewModel {
  List<ResturantMainMenuVm>? items;
  int? totalPage;
  int? totalCount;
  bool? hasNext;
  int? currentPage;

  Page_ResturantMainMenuVm(
      {this.items,
      this.totalCount,
      this.totalPage,
      this.hasNext,
      this.currentPage});

  Page_ResturantMainMenuVm.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items!.add(ResturantMainMenuVm.fromJson(v));
      });
    }
    totalCount = json['metaData']['totalItemCount'];
    totalPage = json['metaData']['pageCount'];
    hasNext = json['metaData']['hasNextPage'];
    currentPage = json['metaData']['pageNumber'];
  }
}
