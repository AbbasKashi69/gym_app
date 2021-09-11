import 'package:gym_app/ViewModels/ArticleComment/ArticleCommentVm.dart';
import 'package:gym_app/ViewModels/BaseViewModel.dart';

// ignore: camel_case_types
class Page_ArticleCommentVm extends BaseViewModel {
  List<ArticleCommentVm>? items;
  int? totalPage;
  int? totalCount;
  bool? hasNext;
  int? currentPage;

  Page_ArticleCommentVm(
      {this.items,
      this.totalCount,
      this.totalPage,
      this.hasNext,
      this.currentPage});

  Page_ArticleCommentVm.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items!.add(ArticleCommentVm.fromJson(v));
      });
    }
    totalCount = json['metaData']['totalItemCount'];
    totalPage = json['metaData']['pageCount'];
    hasNext = json['metaData']['hasNextPage'];
    currentPage = json['metaData']['pageNumber'];
  }
}
