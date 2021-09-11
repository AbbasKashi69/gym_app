import 'package:gym_app/ViewModels/BaseViewModel.dart';
import 'package:gym_app/ViewModels/ResturantMainMenu/ResturantMainMenuVm.dart';
import 'package:gym_app/ViewModels/Skill/SkillVm.dart';

// ignore: camel_case_types
class Page_SkillVm extends BaseViewModel {
  List<SkillVm>? items;
  int? totalPage;
  int? totalCount;
  bool? hasNext;
  int? currentPage;

  Page_SkillVm(
      {this.items,
      this.totalCount,
      this.totalPage,
      this.hasNext,
      this.currentPage});

  Page_SkillVm.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items!.add(SkillVm.fromJson(v));
      });
    }
    totalCount = json['metaData']['totalItemCount'];
    totalPage = json['metaData']['pageCount'];
    hasNext = json['metaData']['hasNextPage'];
    currentPage = json['metaData']['pageNumber'];
  }
}
