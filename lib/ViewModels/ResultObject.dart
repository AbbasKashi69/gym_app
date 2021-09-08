class ResultObject {
  bool? success;
  String? message;
  int? id;
  Object? extra;

  ResultObject(this.success, this.message, [this.id = 0, this.extra]);

  ResultObject.fromJson(Map<String, dynamic> json) {
    success = json['success'] ?? false;
    message = json['message'] ?? "";
    id = json['id'];
    extra = json['extra'] ?? {};
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['id'] = this.id;
    data['extra'] = this.extra;
    return data;
  }
}
