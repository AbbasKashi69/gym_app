class MetaDataVm {
  int? pageCount;
  int? totalItemCount;
  int? pageNumber;
  int? pageSize;
  bool? hasPreviousPage;
  bool? hasNextPage;
  bool? isFirstPage;
  bool? isLastPage;
  int? firstItemOnPage;
  int? lastItemOnPage;
  int? currentPage;

  MetaDataVm(
      {this.pageCount,
      this.totalItemCount,
      this.pageNumber,
      this.pageSize,
      this.hasPreviousPage,
      this.hasNextPage,
      this.isFirstPage,
      this.isLastPage,
      this.firstItemOnPage,
      this.currentPage,
      this.lastItemOnPage});

  MetaDataVm.fromJson(Map<String, dynamic> json) {
    pageCount = json['pageCount'];
    totalItemCount = json['totalItemCount'];
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    hasPreviousPage = json['hasPreviousPage'];
    hasNextPage = json['hasNextPage'];
    isFirstPage = json['isFirstPage'];
    isLastPage = json['isLastPage'];
    firstItemOnPage = json['firstItemOnPage'];
    lastItemOnPage = json['lastItemOnPage'];
    currentPage = json['pageNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageCount'] = this.pageCount;
    data['totalItemCount'] = this.totalItemCount;
    data['pageNumber'] = this.pageNumber;
    data['pageSize'] = this.pageSize;
    data['hasPreviousPage'] = this.hasPreviousPage;
    data['hasNextPage'] = this.hasNextPage;
    data['isFirstPage'] = this.isFirstPage;
    data['isLastPage'] = this.isLastPage;
    data['firstItemOnPage'] = this.firstItemOnPage;
    data['lastItemOnPage'] = this.lastItemOnPage;
    data['pageNumber'] = this.currentPage;
    return data;
  }
}
