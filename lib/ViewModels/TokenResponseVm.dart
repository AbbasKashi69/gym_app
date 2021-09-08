class TokenResponseVm {
  int? userId;
  String? userName;
  String? token;
  String? creationDate;
  String? nCreationDate;

  TokenResponseVm({
    this.userId,
    this.userName,
    this.token,
    this.creationDate,
    this.nCreationDate,
  });

  TokenResponseVm.fromJson(Map<String, dynamic> json) {
    // userId = json['phoneNumber'];
    userName = json['username'];
    creationDate = json['creationDate'];
    nCreationDate = json['nCreationDate'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.userName;
    data['creationDate'] = this.creationDate;
    data['nCreationDate'] = this.nCreationDate;
    data['token'] = this.token;
    // data['phoneNumber'] = this.userId;
    return data;
  }
}
