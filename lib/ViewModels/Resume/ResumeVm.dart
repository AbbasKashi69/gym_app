import 'package:gym_app/ViewModels/BaseViewModel.dart';

class ResumeVm extends BaseViewModel {
  ResumeVm({
    required this.id,
    required this.userId,
    required this.userFullName,
    required this.userPic,
    required this.userMobile,
    required this.userEmail,
    required this.age,
    required this.instagram,
    required this.telegram,
    required this.description,
    required this.creationDate,
    required this.nCreationDate,
    required this.userRegisteryDate,
    required this.nUserRegisteryDate,
    required this.resumeSkills,
    required this.resumeArticles,
    required this.resumeMajors,
    required this.resumeDegrees,
    required this.resumeChampionshipTitles,
    required this.resumeProperties,
  });
  late final int id;
  late final int userId;
  late final String userFullName;
  late final String userPic;
  late final String userMobile;
  String? userEmail;
  late final int age;
  late final String instagram;
  late final String telegram;
  late final String description;
  late final String creationDate;
  late final String nCreationDate;
  String? userRegisteryDate;
  late final String nUserRegisteryDate;
  late final List<ResumeSkills> resumeSkills;
  late final List<ResumeArticles> resumeArticles;
  late final List<ResumeMajors> resumeMajors;
  late final List<ResumeDegrees> resumeDegrees;
  late final List<ResumeChampionshipTitles> resumeChampionshipTitles;
  late final List<dynamic> resumeProperties;

  ResumeVm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    userFullName = json['userFullName'];
    userPic = json['userPic'];
    userMobile = json['userMobile'];
    userEmail = json['userEmail'];
    age = json['age'];
    instagram = json['instagram'];
    telegram = json['telegram'];
    description = json['description'];
    creationDate = json['creationDate'];
    nCreationDate = json['nCreationDate'];
    userRegisteryDate = json['userRegisteryDate'];
    nUserRegisteryDate = json['nUserRegisteryDate'];
    resumeSkills = List.from(json['resumeSkills'])
        .map((e) => ResumeSkills.fromJson(e))
        .toList();
    resumeArticles = List.from(json['resumeArticles'])
        .map((e) => ResumeArticles.fromJson(e))
        .toList();
    resumeMajors = List.from(json['resumeMajors'])
        .map((e) => ResumeMajors.fromJson(e))
        .toList();
    resumeDegrees = List.from(json['resumeDegrees'])
        .map((e) => ResumeDegrees.fromJson(e))
        .toList();
    resumeChampionshipTitles = List.from(json['resumeChampionshipTitles'])
        .map((e) => ResumeChampionshipTitles.fromJson(e))
        .toList();
    resumeProperties =
        List.castFrom<dynamic, dynamic>(json['resumeProperties']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['userId'] = userId;
    _data['userFullName'] = userFullName;
    _data['userPic'] = userPic;
    _data['userMobile'] = userMobile;
    _data['userEmail'] = userEmail;
    _data['age'] = age;
    _data['instagram'] = instagram;
    _data['telegram'] = telegram;
    _data['description'] = description;
    _data['creationDate'] = creationDate;
    _data['nCreationDate'] = nCreationDate;
    _data['userRegisteryDate'] = userRegisteryDate;
    _data['nUserRegisteryDate'] = nUserRegisteryDate;
    _data['resumeSkills'] = resumeSkills.map((e) => e.toJson()).toList();
    _data['resumeArticles'] = resumeArticles.map((e) => e.toJson()).toList();
    _data['resumeMajors'] = resumeMajors.map((e) => e.toJson()).toList();
    _data['resumeDegrees'] = resumeDegrees.map((e) => e.toJson()).toList();
    _data['resumeChampionshipTitles'] =
        resumeChampionshipTitles.map((e) => e.toJson()).toList();
    _data['resumeProperties'] = resumeProperties;
    return _data;
  }
}

class ResumeSkills {
  ResumeSkills({
    required this.id,
    required this.resumeId,
    required this.skillId,
    required this.skillTitle,
    required this.skillDescription,
    required this.creationDate,
    required this.nCreationDate,
  });
  late final int id;
  late final int resumeId;
  late final int skillId;
  late final String skillTitle;
  String? skillDescription;
  late final String creationDate;
  late final String nCreationDate;

  ResumeSkills.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    resumeId = json['resumeId'];
    skillId = json['skillId'];
    skillTitle = json['skillTitle'];
    skillDescription = json['skillDescription'];
    creationDate = json['creationDate'];
    nCreationDate = json['nCreationDate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['resumeId'] = resumeId;
    _data['skillId'] = skillId;
    _data['skillTitle'] = skillTitle;
    _data['skillDescription'] = skillDescription;
    _data['creationDate'] = creationDate;
    _data['nCreationDate'] = nCreationDate;
    return _data;
  }
}

class ResumeArticles extends BaseViewModel {
  ResumeArticles({
    required this.id,
    required this.resumeId,
    required this.link,
    required this.title,
    required this.description,
    required this.creationDate,
    required this.nCreationDate,
  });
  late final int id;
  late final int resumeId;
  late final String link;
  late final String title;
  late final String description;
  late final String creationDate;
  late final String nCreationDate;

  ResumeArticles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    resumeId = json['resumeId'];
    link = json['link'];
    title = json['title'];
    description = json['description'];
    creationDate = json['creationDate'];
    nCreationDate = json['nCreationDate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['resumeId'] = resumeId;
    _data['link'] = link;
    _data['title'] = title;
    _data['description'] = description;
    _data['creationDate'] = creationDate;
    _data['nCreationDate'] = nCreationDate;
    return _data;
  }
}

class ResumeMajors extends BaseViewModel {
  ResumeMajors({
    required this.id,
    required this.resumeId,
    required this.majorId,
    required this.majorTitle,
    required this.majorDescription,
    required this.creationDate,
    required this.nCreationDate,
  });
  late final int id;
  late final int resumeId;
  late final int majorId;
  late final String majorTitle;
  String? majorDescription;
  late final String creationDate;
  late final String nCreationDate;

  ResumeMajors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    resumeId = json['resumeId'];
    majorId = json['majorId'];
    majorTitle = json['majorTitle'];
    majorDescription = json['majorDescription'];
    creationDate = json['creationDate'];
    nCreationDate = json['nCreationDate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['resumeId'] = resumeId;
    _data['majorId'] = majorId;
    _data['majorTitle'] = majorTitle;
    _data['majorDescription'] = majorDescription;
    _data['creationDate'] = creationDate;
    _data['nCreationDate'] = nCreationDate;
    return _data;
  }
}

class ResumeDegrees extends BaseViewModel {
  ResumeDegrees({
    required this.id,
    required this.resumeId,
    required this.title,
    required this.description,
    required this.creationDate,
    required this.nCreationDate,
  });
  late final int id;
  late final int resumeId;
  late final String title;
  String? description;
  late final String creationDate;
  late final String nCreationDate;

  ResumeDegrees.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    resumeId = json['resumeId'];
    title = json['title'];
    description = json['description'];
    creationDate = json['creationDate'];
    nCreationDate = json['nCreationDate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['resumeId'] = resumeId;
    _data['title'] = title;
    _data['description'] = description;
    _data['creationDate'] = creationDate;
    _data['nCreationDate'] = nCreationDate;
    return _data;
  }
}

class ResumeChampionshipTitles extends BaseViewModel {
  ResumeChampionshipTitles({
    required this.id,
    required this.resumeId,
    required this.title,
    required this.description,
    required this.creationDate,
    required this.nCreationDate,
  });
  late final int id;
  late final int resumeId;
  late final String title;
  String? description;
  late final String creationDate;
  late final String nCreationDate;

  ResumeChampionshipTitles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    resumeId = json['resumeId'];
    title = json['title'];
    description = json['description'];
    creationDate = json['creationDate'];
    nCreationDate = json['nCreationDate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['resumeId'] = resumeId;
    _data['title'] = title;
    _data['description'] = description;
    _data['creationDate'] = creationDate;
    _data['nCreationDate'] = nCreationDate;
    return _data;
  }
}
