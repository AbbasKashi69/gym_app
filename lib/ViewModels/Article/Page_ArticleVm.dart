import 'package:gym_app/ViewModels/AnonymousPlanTypeLog/AnonymousPlanTypeLogVm.dart';
import 'package:gym_app/ViewModels/Article/ArticleVm.dart';
import 'package:gym_app/ViewModels/BaseViewModel.dart';

// ignore: camel_case_types
class Page_ArticleVm extends BaseViewModel {
  List<ArticleVm>? items;
  int? totalPage;
  int? totalCount;
  bool? hasNext;
  int? currentPage;

  Page_ArticleVm(
      {this.items,
      this.totalCount,
      this.totalPage,
      this.hasNext,
      this.currentPage});

  Page_ArticleVm.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items!.add(ArticleVm.fromJson(v));
      });
    }
    totalCount = json['metaData']['totalItemCount'];
    totalPage = json['metaData']['pageCount'];
    hasNext = json['metaData']['hasNextPage'];
    currentPage = json['metaData']['pageNumber'];
  }
}
