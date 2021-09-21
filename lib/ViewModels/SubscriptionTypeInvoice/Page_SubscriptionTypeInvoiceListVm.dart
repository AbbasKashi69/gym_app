


import '../BaseViewModel.dart';
import 'SubscriptionTypeInvoiceListVm.dart';

class Page_SubscriptionTypeInvoiceListVm extends BaseViewModel {
  List<SubscriptionTypeInvoiceListVm>? items;
  int? totalPage;
  int? totalCount;
  bool? hasNext;
  int? currentPage;

  Page_SubscriptionTypeInvoiceListVm(
      {this.items,
        this.totalCount,
        this.totalPage,
        this.hasNext,
        this.currentPage});

  Page_SubscriptionTypeInvoiceListVm.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items!.add(SubscriptionTypeInvoiceListVm.fromJson(v));
      });
    }
    totalCount = json['metaData']['totalItemCount'];
    totalPage = json['metaData']['pageCount'];
    hasNext = json['metaData']['hasNextPage'];
    currentPage = json['metaData']['pageNumber'];
  }
}
