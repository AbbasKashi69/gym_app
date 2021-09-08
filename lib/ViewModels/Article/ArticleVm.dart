import '../BaseViewModel.dart';

class ArticleVm extends BaseViewModel {
  int? id;
  int? articleCategoryId;
  String? userId;
  String? summary;
  String? description;
  bool? isActive;
  String? creationDate;
  String? nCreationDate;

  ArticleVm(
      {this.id,
      this.articleCategoryId,
      this.userId,
      this.summary,
      this.description,
      this.isActive,
      this.creationDate,
      this.nCreationDate});

  ArticleVm.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    articleCategoryId = json['articleCategoryId'];

    userId = json['userId'];

    summary = json['summary'];

    description = json['description'];

    isActive = json['isActive'];

    creationDate = json['creationDate'];

    nCreationDate = json['nCreationDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;

    data['articleCategoryId'] = this.articleCategoryId;

    data['userId'] = this.userId;

    data['summary'] = this.summary;

    data['description'] = this.description;

    data['isActive'] = this.isActive;

    data['creationDate'] = this.creationDate;

    data['nCreationDate'] = this.nCreationDate;
    return data;
  }
}
