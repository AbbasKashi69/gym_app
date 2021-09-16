import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym_app/blocs/Resume/bloc/get_resume_bloc.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/screen/ListApprentice/list_Apprentice_page.dart';
import 'package:get/get.dart';
class CvPage extends StatelessWidget {
  const CvPage({Key? key}) : super(key: key);
  static const routeName = '/cvPage';

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xff48CAE4),
        body: SingleChildScrollView(
          child:  BlocBuilder<GetResumeBloc, GetResumeState>(
            builder: (context, state) {
              if (state is GetResumeLoadingState)
                return Container(
                  height: Get.height,
                  width: Get.width,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("درحال بارگذاری"),
                      SizedBox(height: 20,),
                      CircularProgressIndicator()
                    ],
                  )
                );
              else if (state
              is GetResumeLoadedState) if (state
                  .resumeVm !=
                  null) {
                return Column(
                  children: [
                    Container(
                      constraints: BoxConstraints(maxHeight: 300),
                      padding: EdgeInsets.symmetric(horizontal: padding),
                      height: sizeScreen.height * 0.35,
                      width: sizeScreen.width,
                      color: Color(0xff48CAE4),
                      child: Column(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                padding: EdgeInsets.only(
                                    right: padding, left: padding, top: padding),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                        child: Container(
                                          child: Text(
                                            'رزومه کاربر',
                                            style: textStyle.copyWith(
                                                fontSize: kFontSizeText(
                                                    sizeScreen, FontSize.title),
                                                color: Colors.white),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )),
                                    SizedBox(
                                      width: padding / 2,
                                    ),
                                    GestureDetector(
                                        onTap: () => Navigator.of(context).pop(),
                                        child: SvgPicture.asset(
                                          'assets/icons/backIcon.svg',
                                          color: Colors.white,
                                          width: sizeScreen.width > 550 ? 40 : 25,
                                          height: sizeScreen.width > 550 ? 40 : 25,
                                        )
                                      // child: Container(),
                                    )
                                  ],
                                ),
                              )),
                          Expanded(
                            flex: 3,
                            child: Container(
                              padding: EdgeInsets.only(bottom: padding),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle, color: Colors.white),
                                    padding: EdgeInsets.all(1),
                                    child: CircleAvatar(
                                      radius: sizeScreen.height * 0.05,
                                      backgroundImage: NetworkImage(
                                          '${state.resumeVm!.userPic}'),
                                    ),
                                  ),
                                  Text(
                                    '${state.resumeVm!.userFullName}',
                                    style: textStyle.copyWith(
                                        color: Colors.white,
                                        fontSize: kFontSizeText(
                                            sizeScreen, FontSize.subTitle)),
                                  ),
                                  Text(
                                    '${state.resumeVm!.resumeSkills[0].skillTitle}',
                                    style: textStyle.copyWith(
                                        color: Colors.white,
                                        fontSize: kFontSizeText(
                                            sizeScreen, FontSize.subTitle)),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: padding),
                      width: double.infinity,
                      constraints: BoxConstraints(minHeight: sizeScreen.height * 0.7),
                      decoration: BoxDecoration(
                        color: kColorBackGround,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: padding * 2),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: padding),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "سن",
                                        style: textStyle.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: kFontSizeText(
                                                sizeScreen, FontSize.title)),
                                      ),
                                      Text(
                                        "${state.resumeVm!.age}",
                                        style: textStyle.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: kFontSizeText(
                                                sizeScreen, FontSize.normal)
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: padding),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              'تاریخ عضویت در باشگاه:',
                                              style: textStyle.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: kFontSizeText(
                                                      sizeScreen, FontSize.title)),
                                            )),
                                      ),
                                      Text(
                                        '${state.resumeVm!.creationDate}',
                                        style: textStyle.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: kFontSizeText(
                                                sizeScreen, FontSize.normal)
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                ItemInfoPersonal(
                                  sizeScreen: sizeScreen,
                                  title: 'ایمیل',
                                  answer: '${state.resumeVm!.userEmail}',
                                  image: 'assets/icons/gmail.svg',
                                ),
                                ItemInfoPersonal(
                                  sizeScreen: sizeScreen,
                                  title: 'شماره موبایل',
                                  answer: '${state.resumeVm!.userMobile}',
                                  image: 'assets/icons/smartphone.svg',
                                ),
                                ItemInfoPersonal(
                                  sizeScreen: sizeScreen,
                                  title: 'اینستاگرام',
                                  answer: '${state.resumeVm!.instagram}',
                                  image: 'assets/icons/instagram.svg',
                                ),
                                ItemInfoPersonal(
                                  sizeScreen: sizeScreen,
                                  title: 'آیدی تلگرام',
                                  answer: '${state.resumeVm!.telegram}',
                                  image: 'assets/icons/telegram.svg',
                                ),
                                Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(vertical: padding),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/icons/graduation-hat.svg',
                                            width: kFontSizeText(
                                                sizeScreen, FontSize.title) +
                                                5,
                                          ),
                                          SizedBox(
                                            width: padding,
                                          ),
                                          Text(
                                            'رشته های تحصیلی',
                                            style: textStyle.copyWith(
                                                fontSize: kFontSizeText(
                                                    sizeScreen, FontSize.subTitle),
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(right: 30),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.red),
                                                width: kFontSizeText(
                                                    sizeScreen, FontSize.normal) -
                                                    5,
                                                height: kFontSizeText(
                                                    sizeScreen, FontSize.normal) -
                                                    5,
                                              ),
                                              SizedBox(
                                                width: padding / 2,
                                              ),
                                              Text(
                                                '${state.resumeVm!.resumeMajors[0].majorTitle}',
                                                style: textStyle.copyWith(
                                                    fontSize: kFontSizeText(
                                                      sizeScreen,
                                                      FontSize.normal,
                                                    ),
                                                    fontWeight: FontWeight.w400),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: padding * 2,
                                  child: Divider(
                                    color: Colors.black,
                                    height: 1,
                                    thickness: 0.1,
                                  ),
                                ),
                                Container(
                                  margin:
                                  EdgeInsets.only(top: padding, bottom: padding),
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'درباره مربی',
                                    style: textStyle.copyWith(
                                        fontSize:
                                        kFontSizeText(sizeScreen, FontSize.title),
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "${state.resumeVm!.description}",
                                    textAlign: TextAlign.justify,
                                    style: textStyle.copyWith(
                                        fontSize: kFontSizeText(
                                            sizeScreen, FontSize.normal),
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: padding * 3, bottom: padding),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          'مدارک تحصیلی',
                                          style: textStyle.copyWith(
                                              fontSize: kFontSizeText(
                                                  sizeScreen, FontSize.title),
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      SizedBox(
                                        height: padding,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: kFontSizeText(
                                                sizeScreen, FontSize.normal) -
                                                3,
                                            height: kFontSizeText(
                                                sizeScreen, FontSize.normal) -
                                                3,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                gradient: RadialGradient(
                                                  colors: [
                                                    Color(0xffFFD000),
                                                    Color(0xffFF4600)
                                                  ],
                                                )),
                                          ),
                                          SizedBox(
                                            width: padding,
                                          ),
                                          Text(
                                            '${state.resumeVm!.resumeDegrees[0].title}', // bayad avz bshe
                                            style: textStyle.copyWith(
                                              fontSize: kFontSizeText(
                                                  sizeScreen, FontSize.normal),
                                            ),
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: padding * 3, bottom: padding),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          'عنواین قهرمانی',
                                          style: textStyle.copyWith(
                                              fontSize: kFontSizeText(
                                                  sizeScreen, FontSize.title),
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      SizedBox(
                                        height: padding,
                                      ),
                                      ItemTitlesChampions(
                                        sizeScreen: sizeScreen,
                                        title: '${state.resumeVm!.resumeChampionshipTitles[0].title}',
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: padding * 3, bottom: padding),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          'مقاله های منتشر شده',
                                          style: textStyle.copyWith(
                                              fontSize: kFontSizeText(
                                                  sizeScreen, FontSize.title),
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      SizedBox(
                                        height: padding,
                                      ),
                                      ItemArticle(
                                          sizeScreen: sizeScreen, title: '${state.resumeVm!.resumeArticles[0].title}'),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              } else
                return Text(
                  state.resumeVm!.description.toString(),
                  style: TextStyle(
                      color: Colors.red, fontSize: 25),
                );
              else
                return Text("error");
            },
          ),
        ));
  }
}

class ItemArticle extends StatelessWidget {
  const ItemArticle({Key? key, required this.sizeScreen, required this.title})
      : super(key: key);

  final Size sizeScreen;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: padding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset('assets/icons/newspaper.svg'),
          SizedBox(
            width: padding,
          ),
          Text(
            title,
            style: textStyle.copyWith(
              fontSize: kFontSizeText(sizeScreen, FontSize.normal),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemTitlesChampions extends StatelessWidget {
  const ItemTitlesChampions(
      {Key? key, required this.sizeScreen, required this.title})
      : super(key: key);

  final Size sizeScreen;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: padding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset('assets/icons/surface.svg'),
          SizedBox(
            width: padding,
          ),
          Text(
            title,
            style: textStyle.copyWith(
              fontSize: kFontSizeText(sizeScreen, FontSize.normal),
            ),
          ),
        ],
      ),
    );
  }
}

const hasanString =
    'حسن یزدانی چراتی (زادهٔ ۵ دی ۱۳۷۳) کشتی‌گیر آزادکار ایرانی است که در دستهٔ ۸۶ کیلوگرم به رقابت می‌پردازد.[۱] وی در المپیک ۲۰۱۶ در دستهٔ وزنی ۷۴ کیلوگرم به نشان طلا و در المپیک ۲۰۲۰ به مدال نقره دست یافت. او دارندهٔ دو نشان طلای قهرمانی‌ جهان در وزن ۸۶ کیلوگرم می‌باشد. از دیگر دستاوردهای وی می‌توان به کسب یک نشان نقره و یک برنز قهرمانی جهان، دو عنوان قهرمانی آسیا، کسب طلای بازی‌های آسیایی در سال ۲۰۱۸، سه عنوان قهرمانی پیاپی جام جهانی با تیم ملی ایران و همچنین کسب جایزهٔ بهترین کشتی‌گیر مرد جهان در سال ۲۰۱۷ اشاره کرد';

class ItemInfoPersonal extends StatelessWidget {
  const ItemInfoPersonal({
    Key? key,
    this.answer,
    this.image,
    this.title,
    required this.sizeScreen,
  }) : super(key: key);

  final Size sizeScreen;
  final String? image;
  final String? title;
  final String? answer;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: padding),
      child: Row(
        children: [
          Expanded(
              child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  image!,
                  width: kFontSizeText(sizeScreen, FontSize.title) + 5,
                ),
                SizedBox(
                  width: padding,
                ),
                Text(
                  title!,
                  style: textStyle.copyWith(
                      fontSize: kFontSizeText(sizeScreen, FontSize.subTitle),
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          )),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                answer!,
                style: textStyle.copyWith(
                    fontSize: kFontSizeText(sizeScreen, FontSize.normal),
                    fontWeight: FontWeight.w400),
              ),
            ),
          )
        ],
      ),
    );
  }
}
