import 'package:flutter/material.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/screen/ListApprentice/list_Apprentice_page.dart';

class DetailElanPage extends StatelessWidget {
  const DetailElanPage({Key? key}) : super(key: key);
  static const routeName = '/detailElanPage';

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWidget(
        title: 'اعلان ها',
      ),
      body: Container(
        constraints: BoxConstraints(minHeight: sizeScreen.height),
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: kBodyDecoration,
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            setWidget(nSetWidget.FactorFood, instaceAllFactor)
          ],
        ),
      ),
    );
  }
}

AllFactor instaceAllFactor = AllFactor(
    factorMoneyVm: FactorMoneyVm(
        user: 'محمد صدیقی منش',
        cardNumber: 'محمد صدیق منش - 6037243565432435 - کشاورزی',
        total: '200،000 تومان',
        nCreationDate: '00/12/03-21:30',
        description: 'انتقال وجه به کارت بانکی',
        bossDescription:
            'سلام خسته نباشید امیدوارم روز های خوبی رو در کنار هم داشته باشیم هرگونه سوالی که براتون پیش اومد میتونید با شماره ی 021-5265897 تماس بگیرید'),
    factorFoodVm: FactorFoodVm(
        description: 'فاکتور خرید از بوفه',
        nCreationDate: 'تاریخ و ساعت 21/09/00-18:27',
        totalPrice: '12،350،000',
        food: [
          {
            'product': 'جوجه کباب خوب  کاشان',
            'unitPrice': '200،000',
            'count': '2',
            'totalPrice': '11،400،000'
          },
          {
            'product': 'مرغ',
            'unitPrice': '100،000',
            'count': '5',
            'totalPrice': '500،000'
          },
          {
            'product': 'سوشی',
            'unitPrice': '150،000',
            'count': '3',
            'totalPrice': '450،000'
          }
        ]),
    noFactor: NoFactorVm(
        description: 'ده روز از اشتراک شما کم شد',
        bossDescription:
            'سلام خسته نباشید امیدوارم روز های خوبی رو در کنار هم داشته باشیم هرگونه سوالی که براتون پیش اومد میتونید با شماره ی تماس بگیرید'));

enum nSetWidget { FactorFood, FactorMoney, NoFactor }

Widget setWidget(nSetWidget myNSetWidget, AllFactor allFactor) {
  switch (myNSetWidget) {
    case nSetWidget.FactorFood:
      return FactorFoodWidget(factorFoodVm: allFactor.factorFoodVm!);
    case nSetWidget.FactorMoney:
      return FactorMoneyWidget(
        factorMoneyVm: allFactor.factorMoneyVm!,
      );
    case nSetWidget.NoFactor:
      return NoFactorWidget(noFactorVm: allFactor.noFactor!);
    default:
      return Container();
  }
}

class FactorMoneyVm {
  String? user;
  String? cardNumber;
  String? total;
  String? description;
  String? nCreationDate;
  String? bossDescription;
  FactorMoneyVm({
    this.bossDescription,
    this.cardNumber,
    this.description,
    this.nCreationDate,
    this.total,
    this.user,
  });
}

class FactorFoodVm {
  String? description;
  String? nCreationDate;
  String? totalPrice;
  List<dynamic> food;
  FactorFoodVm(
      {required this.food,
      this.description,
      this.nCreationDate,
      this.totalPrice});
}

class NoFactorVm {
  String? bossDescription;
  String? description;
  NoFactorVm({this.bossDescription, this.description});
}

class AllFactor {
  NoFactorVm? noFactor;
  FactorFoodVm? factorFoodVm;
  FactorMoneyVm? factorMoneyVm;
  AllFactor({this.factorFoodVm, this.factorMoneyVm, this.noFactor});
}

class FactorMoneyWidget extends StatelessWidget {
  const FactorMoneyWidget({Key? key, required this.factorMoneyVm})
      : super(key: key);
  final FactorMoneyVm factorMoneyVm;

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: sizeScreen.width * 0.8,
              child: Text(
                factorMoneyVm.description!,
                style: textStyle.copyWith(
                    fontSize: kFontSizeText(sizeScreen, FontSize.title),
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Column(
              children: [
                ItemFacotrMoney(
                  sizeScreen: sizeScreen,
                  subTitle: factorMoneyVm.user!,
                  title: 'کاربر',
                  isHaveColor: true,
                ),
                ItemFacotrMoney(
                  sizeScreen: sizeScreen,
                  subTitle: factorMoneyVm.cardNumber!,
                  title: 'اطلاعات بانکی',
                  isHaveColor: false,
                ),
                ItemFacotrMoney(
                  sizeScreen: sizeScreen,
                  subTitle: factorMoneyVm.total!,
                  title: 'مقدار',
                  isHaveColor: true,
                ),
                ItemFacotrMoney(
                  sizeScreen: sizeScreen,
                  subTitle: factorMoneyVm.description!,
                  title: 'توضیحات',
                  isHaveColor: false,
                ),
                ItemFacotrMoney(
                  sizeScreen: sizeScreen,
                  subTitle: factorMoneyVm.nCreationDate!,
                  title: 'تاریخ و ساعت',
                  isHaveColor: true,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'توضیحات مدیر',
                    style: textStyle.copyWith(
                        fontSize: kFontSizeText(sizeScreen, FontSize.title)),
                  ),
                ),
                SizedBox(
                  height: padding,
                ),
                Text(
                  factorMoneyVm.bossDescription!,
                  textAlign: TextAlign.justify,
                  style: textStyle.copyWith(
                      fontSize: kFontSizeText(sizeScreen, FontSize.subTitle)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ItemFacotrMoney extends StatelessWidget {
  const ItemFacotrMoney({
    Key? key,
    required this.sizeScreen,
    required this.subTitle,
    required this.title,
    required this.isHaveColor,
  }) : super(key: key);

  final Size sizeScreen;
  final String title;
  final String subTitle;
  final bool isHaveColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      color: isHaveColor ? Color(0xffF2F2F2) : Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: textStyle.copyWith(
                fontSize: kFontSizeText(sizeScreen, FontSize.subTitle)),
          ),
          SizedBox(
            width: padding,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                subTitle,
                style: textStyle.copyWith(
                    fontSize: kFontSizeText(sizeScreen, FontSize.subTitle)),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class NoFactorWidget extends StatelessWidget {
  const NoFactorWidget({Key? key, required this.noFactorVm}) : super(key: key);
  final NoFactorVm noFactorVm;
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            width: sizeScreen.width * 0.8,
            child: Text(
              noFactorVm.description!,
              style: textStyle.copyWith(
                  fontSize: kFontSizeText(sizeScreen, FontSize.title),
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.centerRight,
          child: Text(
            'توضیحات مدیر',
            style: textStyle.copyWith(
                fontSize: kFontSizeText(sizeScreen, FontSize.title)),
          ),
        ),
        SizedBox(
          height: padding,
        ),
        Text(
          noFactorVm.bossDescription!,
          textAlign: TextAlign.justify,
          style: textStyle.copyWith(
              fontSize: kFontSizeText(sizeScreen, FontSize.subTitle)),
        )
      ],
    );
  }
}

class FactorFoodWidget extends StatelessWidget {
  const FactorFoodWidget({Key? key, required this.factorFoodVm})
      : super(key: key);
  final FactorFoodVm factorFoodVm;
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Column(
      children: [
        Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: sizeScreen.width * 0.8,
                  child: Text(
                    factorFoodVm.description!,
                    style: textStyle.copyWith(
                        fontSize: kFontSizeText(sizeScreen, FontSize.title),
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  factorFoodVm.nCreationDate!,
                  style: textStyle.copyWith(
                      fontSize: kFontSizeText(sizeScreen, FontSize.subTitle)),
                )
              ],
            )),
        SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                  right: BorderSide(color: Colors.black),
                  top: BorderSide(color: Colors.black)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Sell(
                      width: sizeScreen.width * 0.5,
                      sizeScreen: sizeScreen,
                      title: 'محصول',
                      isTitle: true,
                    ),
                    Sell(
                      width: sizeScreen.width * 0.25,
                      sizeScreen: sizeScreen,
                      title: 'قیمت واحد',
                      isTitle: true,
                    ),
                    Sell(
                      width: sizeScreen.width * 0.15,
                      sizeScreen: sizeScreen,
                      title: 'تعداد',
                      isTitle: true,
                    ),
                    Sell(
                      width: sizeScreen.width * 0.25,
                      sizeScreen: sizeScreen,
                      title: 'قیمت کل',
                      isTitle: true,
                    ),
                  ],
                ),
                Column(
                  children: List.generate(
                      factorFoodVm.food.length,
                      (index) =>
                          MyItemFactorFood(data: factorFoodVm.food[index])),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.centerRight,
          child: Text(
            'قیمت کل: ${factorFoodVm.totalPrice} تومان',
            style: textStyle.copyWith(
                fontSize: kFontSizeText(sizeScreen, FontSize.title)),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerRight,
          child: Text(
            'هزینه از اعتبار شما کم شد',
            style: textStyle.copyWith(
                fontSize: kFontSizeText(sizeScreen, FontSize.subTitle),
                color: Color(0xffFF0046)),
          ),
        )
      ],
    );
  }
}

class Sell extends StatelessWidget {
  const Sell(
      {Key? key,
      required this.sizeScreen,
      required this.title,
      required this.width,
      this.isTitle = false})
      : super(key: key);

  final Size sizeScreen;
  final String title;
  final double width;
  final bool isTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Colors.black),
              left: BorderSide(color: Colors.black))),
      padding: EdgeInsets.symmetric(vertical: 5),
      constraints: BoxConstraints(
        minWidth: width,
      ),
      child: Center(
        child: Text(
          title,
          style: textStyle.copyWith(
              fontSize: kFontSizeText(sizeScreen, FontSize.title),
              fontWeight: isTitle ? FontWeight.w500 : FontWeight.w400),
        ),
      ),
    );
  }
}

class MyItemFactorFood extends StatelessWidget {
  const MyItemFactorFood({Key? key, this.data}) : super(key: key);
  final dynamic data;
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Row(
      children: [
        Sell(
          width: sizeScreen.width * 0.5,
          sizeScreen: sizeScreen,
          title: data['product'],
        ),
        Sell(
          width: sizeScreen.width * 0.25,
          sizeScreen: sizeScreen,
          title: data['unitPrice'],
        ),
        Sell(
          width: sizeScreen.width * 0.15,
          sizeScreen: sizeScreen,
          title: data['count'],
        ),
        Sell(
          width: sizeScreen.width * 0.25,
          sizeScreen: sizeScreen,
          title: data['totalPrice'],
        ),
      ],
    );
  }
}
