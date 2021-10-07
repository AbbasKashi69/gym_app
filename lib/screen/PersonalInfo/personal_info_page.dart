import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gym_app/ViewModels/CoachStudent/CoachStudentProfileVm.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/screen/ListApprentice/list_Apprentice_page.dart';

class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({Key? key, required this.coachStudentProfileVm})
      : super(key: key);
  static const routeName = '/personalInfoPage';
  final CoachStudentProfileVm coachStudentProfileVm;

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Container(
      color: kColorAppbar,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBarWidget(title: 'مشخصات فردی'),
        body: Container(
          decoration: kBodyDecoration,
          height: sizeScreen.height,
          width: sizeScreen.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: padding,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: sizeScreen.width > 550 ? 35 : 25,
                    backgroundImage:
                        NetworkImage(coachStudentProfileVm.userPic ?? ""),
                  ),
                  SizedBox(
                    width: padding,
                  ),
                  RichText(
                      text: TextSpan(
                          text: 'علی کریمی',
                          style: textStyle.copyWith(
                              fontSize:
                                  kFontSizeText(sizeScreen, FontSize.title)),
                          children: [
                        TextSpan(
                            text: ' (شاگرد)',
                            style: textStyle.copyWith(
                                color: Color(0xff5e5e5e),
                                fontSize: kFontSizeText(
                                    sizeScreen, FontSize.subTitle)))
                      ])),
                ],
              ),
              SizedBox(
                height: padding,
              ),
              PersonalInfoItem(
                sizeScreen: sizeScreen,
                image: 'assets/icons/email.svg',
                title: coachStudentProfileVm.userEmail ?? "",
              ),
              PersonalInfoItem(
                sizeScreen: sizeScreen,
                image: 'assets/icons/mobileNumber.svg',
                title: coachStudentProfileVm.userPhoneNumber ?? "",
              ),
              PersonalInfoItem(
                sizeScreen: sizeScreen,
                image: 'assets/icons/height.svg',
                title: coachStudentProfileVm.nHeight ?? "",
              ),
              PersonalInfoItem(
                sizeScreen: sizeScreen,
                image: 'assets/icons/weight-scale.svg',
                title: coachStudentProfileVm.nWeight ?? "",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PersonalInfoItem extends StatelessWidget {
  const PersonalInfoItem(
      {Key? key,
      required this.sizeScreen,
      required this.image,
      required this.title})
      : super(key: key);

  final Size sizeScreen;
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizeScreen.width > 550
          ? sizeScreen.width * 0.8
          : sizeScreen.width * 0.9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Color(0xffEEEEEE)),
      margin: EdgeInsets.symmetric(vertical: padding / 2),
      padding: EdgeInsets.symmetric(vertical: padding, horizontal: padding),
      child: Row(
        children: [
          SvgPicture.asset(
            image,
            width: kFontSizeText(sizeScreen, FontSize.title) + 5,
            height: kFontSizeText(sizeScreen, FontSize.title) + 5,
          ),
          Spacer(),
          Text(
            title,
            style: textStyle.copyWith(
                fontSize: kFontSizeText(sizeScreen, FontSize.subTitle)),
          )
        ],
      ),
    );
  }
}
