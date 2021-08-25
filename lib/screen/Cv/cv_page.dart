import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/screen/ListApprentice/list_Apprentice_page.dart';

class CvPage extends StatelessWidget {
  const CvPage({Key? key}) : super(key: key);
  static const routeName = '/cvPage';

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xff48CAE4),
        body: SingleChildScrollView(
          child: Column(
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
                                    'http://shahraranews.ir/files/fa/news/1400/5/12/342713_281.jpg'),
                              ),
                            ),
                            Text(
                              'حسن یزدانی',
                              style: textStyle.copyWith(
                                  color: Colors.white,
                                  fontSize: kFontSizeText(
                                      sizeScreen, FontSize.subTitle)),
                            ),
                            Text(
                              'مربی تمرینی- متخصص تغذیه',
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
                                RichText(
                                    text: TextSpan(
                                        text: 'سن:',
                                        style: textStyle.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: kFontSizeText(
                                                sizeScreen, FontSize.title)),
                                        children: [
                                      TextSpan(
                                        text: '39',
                                        style: textStyle.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: kFontSizeText(
                                                sizeScreen, FontSize.title)),
                                      )
                                    ]))
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
                                  '9/9/99',
                                  style: textStyle.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: kFontSizeText(
                                          sizeScreen, FontSize.normal)),
                                )
                              ],
                            ),
                          ),
                          ItemInfoPersonal(
                            sizeScreen: sizeScreen,
                            title: 'ایمیل',
                            answer: 'hasan_yazdani@gmail.com',
                            image: 'assets/icons/gmail.svg',
                          ),
                          ItemInfoPersonal(
                            sizeScreen: sizeScreen,
                            title: 'شماره موبایل',
                            answer: '0912121212',
                            image: 'assets/icons/smartphone.svg',
                          ),
                          ItemInfoPersonal(
                            sizeScreen: sizeScreen,
                            title: 'اینستاگرام',
                            answer: 'hasanyazdani',
                            image: 'assets/icons/instagram.svg',
                          ),
                          ItemInfoPersonal(
                            sizeScreen: sizeScreen,
                            title: 'آیدی تلگرام',
                            answer: 'hasna_110_yazdani',
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
                                          'مهندسی صنایع',
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
                              hasanString,
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
                                      'لیسانس تربیت بدنی از دانشگاه تهران در سال 97',
                                      style: textStyle.copyWith(
                                        fontSize: kFontSizeText(
                                            sizeScreen, FontSize.normal),
                                      ),
                                    ),
                                  ],
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
                                      'لیسانس علوم سیاسی از دانشگاه اصفهان در سال 95',
                                      style: textStyle.copyWith(
                                        fontSize: kFontSizeText(
                                            sizeScreen, FontSize.normal),
                                      ),
                                    ),
                                  ],
                                )
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
                                  title: 'قهرمان جهان 2015',
                                ),
                                ItemTitlesChampions(
                                  sizeScreen: sizeScreen,
                                  title: 'نایب قهرمان جهان 2012',
                                ),
                                ItemTitlesChampions(
                                  sizeScreen: sizeScreen,
                                  title: 'قهرمان آسیا 2017',
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
                                    sizeScreen: sizeScreen, title: 'مقاله یک'),
                                ItemArticle(
                                    sizeScreen: sizeScreen, title: 'مقاله دو'),
                                ItemArticle(
                                    sizeScreen: sizeScreen, title: 'مقاله سه'),
                                ItemArticle(
                                    sizeScreen: sizeScreen,
                                    title: 'مقاله چهار'),
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
