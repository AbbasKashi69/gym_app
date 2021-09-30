import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gym_app/ViewModels/CoachStudent/CoachStudentVm.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/customeTextField.dart';
import 'package:gym_app/screen/Cv/cv_page.dart';
import 'package:gym_app/screen/PersonalInfoCoach/personal_info_coach_page.dart';
import 'package:gym_app/screen/ProfileCoach/components/selector_image_screen.dart';

class ProfileCoachPage extends StatelessWidget {
  const ProfileCoachPage({Key? key, required this.coachStudentVm})
      : super(key: key);
  static const routeName = '/ProfileCoachPage';
  final CoachStudentVm coachStudentVm;

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Container(
      color: kColorAppbar,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBarWidget(title: 'پروفایل مربی'),
        body: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(minHeight: sizeScreen.height),
            padding: EdgeInsets.symmetric(horizontal: padding),
            decoration: kBodyDecoration,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: padding, bottom: padding * 2, right: padding),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: sizeScreen.width > 550 ? 30 : 20,
                        backgroundImage: NetworkImage(coachStudentVm.coachPic ??
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiLA28J7m4Jbacks8ceGZoQC-QgRLqbje9nA&usqp=CAU'),
                      ),
                      SizedBox(
                        width: padding,
                      ),
                      RichText(
                          text: TextSpan(
                              text: coachStudentVm.coachFullName ?? "",
                              style: textStyle.copyWith(
                                  fontSize: kFontSizeText(
                                      sizeScreen, FontSize.subTitle)),
                              children: [
                            TextSpan(
                                text: ' (مربی)',
                                style: textStyle.copyWith(
                                    fontSize: kFontSizeText(
                                        sizeScreen, FontSize.subTitle),
                                    color: Color(0xff5e5e5e)))
                          ])),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: kColorBackgroundItem),
                        child: Center(
                            child: SvgPicture.asset('assets/icons/trash.svg')),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'برنامه تمرینی',
                          style: textStyle.copyWith(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: padding / 2,
                        ),
                        Text(
                          '13',
                          style: textStyle.copyWith(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'برنامه غذایی',
                          style: textStyle.copyWith(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: padding / 2,
                        ),
                        Text(
                          '8',
                          style: textStyle.copyWith(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'شاگردان',
                          style: textStyle.copyWith(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: padding / 2,
                        ),
                        Text(
                          '2',
                          style: textStyle.copyWith(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: padding * 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: () async {
                            Navigator.of(context).pushNamed(CvPage.routeName,
                                arguments: coachStudentVm.coachId);
                            // await NoCvScreen().noCv(context, sizeScreen);
                          },
                          child: ItemConversation(
                            image: 'assets/icons/cv.svg',
                            title: 'رزومه',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: padding,
                      ),
                      // Expanded(
                      //   flex: 3,
                      //   child: GestureDetector(
                      //     onTap: () async {
                      //       await WriteProgramScreen()
                      //           .writeProgram(context, sizeScreen);
                      //     },
                      //     child: ItemConversation(
                      //       image: 'assets/icons/writeProgram.svg',
                      //       title: 'نوشتن برنامه',
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   width: padding,
                      // ),
                      Expanded(
                        flex: 2,
                        child: ItemConversation(
                          title: 'گفتگو',
                          image: 'assets/icons/conversation.svg',
                        ),
                      ),
                      Spacer(
                        flex: 3,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: padding * 2, bottom: padding),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kColorBackgroundItem),
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      vertical: padding, horizontal: padding / 2),
                  child: Row(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/listProgram.svg',
                          ),
                          SizedBox(
                            width: padding,
                          ),
                          Text(
                            'لیست برنامه ها',
                            style: textStyle,
                          )
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(PersonalInfoCoachPage.routeName);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kColorBackgroundItem),
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                        vertical: padding, horizontal: padding / 2),
                    child: Row(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/personalProfile.svg',
                            ),
                            SizedBox(
                              width: padding,
                            ),
                            Text(
                              'مشخصات فردی',
                              style: textStyle,
                            )
                          ],
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: padding * 2, bottom: padding),
                  alignment: Alignment.centerRight,
                  child: Text(
                    'ارائه گزارش به مربی',
                    style: textStyle.copyWith(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: padding, horizontal: padding / 2),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kColorBackgroundItem),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/dateBlack.svg',
                          ),
                          SizedBox(
                            width: padding,
                          ),
                          Text(
                            'چهارشنبه',
                            style: textStyle,
                          ),
                          SizedBox(
                            width: padding / 2,
                          ),
                          Text(
                            '22/9/90',
                            style: textStyle,
                          ),
                        ],
                      ),
                      Spacer()
                    ],
                  ),
                ),
                SizedBox(
                  height: padding,
                ),
                CustomeTextField(
                  hintText: 'قد (سانتی متر)',
                ),
                SizedBox(
                  height: padding,
                ),
                CustomeTextField(
                  hintText: 'وزن (کیلو گرم)',
                ),
                SizedBox(
                  height: padding,
                ),
                CustomeTextField(
                  hintText: 'مدت زمان تمرین (دقیقه)',
                  isHaveIcon: true,
                ),
                SizedBox(
                  height: padding,
                ),
                CustomeTextField(
                  hintText: 'رعایت برنامه تمرینی (درصد)',
                  isHaveIcon: true,
                ),
                SizedBox(
                  height: padding,
                ),
                CustomeTextField(
                  hintText: 'رعایت برنامه غذایی (درصد)',
                  isHaveIcon: true,
                ),
                SizedBox(
                  height: padding,
                ),
                Container(
                  margin: EdgeInsets.only(top: padding, bottom: padding),
                  padding: EdgeInsets.only(right: padding, top: padding),
                  decoration: ShapeDecoration(
                      color: Color(0xfffBfBfB),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Color(0xffEBEBEB)))),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'توضیحات',
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: padding / 2, vertical: padding / 2),
                        border: InputBorder.none),
                    minLines: 7,
                    // any number you need (It works as the rows for the textarea)
                    // maxLength: 1000,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    textAlign: TextAlign.justify,
                    style: textStyle.copyWith(
                        height: 1.5,
                        fontSize: kFontSizeText(sizeScreen, FontSize.subTitle)),
                  ),
                ),
                Container(
                  height: sizeScreen.height * 0.2,
                  margin: EdgeInsets.only(top: padding, bottom: padding),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      Row(
                        children: List.generate(
                            5,
                            (index) => Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: padding / 2),
                                  child: AspectRatio(
                                    aspectRatio: 1.08,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          'https://antus.ir/wp-content/uploads/2021/05/2-9.jpg',
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center,
                                        )),
                                  ),
                                )),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await SelectorImageScreen()
                              .selectorImage(context, sizeScreen);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: padding / 2),
                          child: AspectRatio(
                            aspectRatio: 1.08,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                dashPattern: [3],
                                color: Colors.black,
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/addImageCoach.svg',
                                        width: kFontSizeText(
                                                sizeScreen, FontSize.title) +
                                            10,
                                        height: kFontSizeText(
                                                sizeScreen, FontSize.title) +
                                            10,
                                      ),
                                      Text(
                                        'افزودن تصویر',
                                        style: textStyle.copyWith(
                                            fontSize: kFontSizeText(
                                                sizeScreen, FontSize.title),
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: CustomeButton(
                      sizeScreen: sizeScreen,
                      title: 'ثبت و ارسال',
                      onTap: () {}),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ItemConversation extends StatelessWidget {
  const ItemConversation({Key? key, required this.image, required this.title})
      : super(key: key);
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: padding / 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kColorBackgroundItem),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(image),
            SizedBox(
              width: padding / 2,
            ),
            Text(
              title,
              style: textStyle,
            )
          ],
        ));
  }
}
