import 'dart:math';
import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym_app/ViewModels/PlanTypeLog/PlanTypeLogVm.dart';
import 'package:gym_app/ViewModels/SubscriptionTypeInvoice/SubscriptionTypeInvoiceListVm.dart';
import 'package:gym_app/ViewModels/SubscriptionTypeInvoice/SubscriptionTypeInvoiceVm.dart';
import 'package:gym_app/blocs/Subscription/bloc/get_subscription_bloc.dart';
import 'package:gym_app/blocs/Subscription/bloc/get_subscription_invoice_bloc.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/customBottomBar.dart';
import 'package:gym_app/components/myWaiting.dart';
import 'package:gym_app/components/no_data.dart';
import 'package:gym_app/extensions/ext.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'buy_subscription.dart';
import 'package:get/get.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({Key? key}) : super(key: key);
  static const routeName = '/subscription';

  @override
  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  late bool isAlign;
  late ScrollController _exerciseScrollController;
  late ScrollController _dietScrollController;
  Random random = new Random();
  int randomNumber = 0;
  List listItems = [
    {
      'title': 'خرید اشتراک ثابت',
      'date': '00/3/23-21:43',
      'boxName': 'بسته دو ماهه',
      'price': '200,000 تومان',
      'type': 'پرداخت از اعتبار'
    },
    {
      'title': 'کاهش اشتراک',
      'date': '00/3/23-21:43',
      'boxName': 'مدت زمان : 10 روز',
      'price': '200,000 تومان',
      'type': ''
    },
    {
      'title': 'خرید اشتراک ثابت',
      'date': '00/3/23-21:43',
      'boxName': 'بسته دو ماهه',
      'price': '200,000 تومان',
      'type': 'پرداخت از اعتبار'
    },
    {
      'title': 'کاهش اشتراک',
      'date': '00/3/23-21:43',
      'boxName': 'مدت زمان : 10 روز',
      'price': '',
      'type': ''
    },
  ];

  @override
  void initState() {
    isAlign = true;
    _exerciseScrollController = ScrollController()..addListener(_listener);
    _dietScrollController = ScrollController()..addListener(_listenerDiet);
    super.initState();
  }

  _listener() {
    if (_exerciseScrollController.position.pixels ==
        _exerciseScrollController.position.maxScrollExtent) {
      BlocProvider.of<SubscriptionBloc>(context)
        ..add(SubscriptionLoadingEvent());
    }
  }

  _listenerDiet() {
    if (_dietScrollController.position.pixels ==
        _dietScrollController.position.maxScrollExtent) {
      BlocProvider.of<SubscriptionBloc>(context)
        ..add(SubscriptionLoadingEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;

    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
          child: Container(
        width: gw(1),
        child: Column(
          children: [
            Container(
                height: gh(0.38),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: gh(0.135),
                          width: gw(1),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(25),
                                  bottomLeft: Radius.circular(25))),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: gw(1),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(25),
                                      bottomRight: Radius.circular(25)),
                                  child: Image.asset(
                                    "assets/images/appBar.png",
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                              Container(
                                width: gw(1),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(25),
                                      bottomRight: Radius.circular(25)),
                                  child: Image.asset(
                                    "assets/images/background.png",
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: gh(0.025), right: gw(0.05)),
                                    child: Text(
                                      "LOGO",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: gh(0.025), left: gw(0.05)),
                                    child: SvgPicture.asset(
                                        "assets/icons/notification.svg",
                                        height: 30,
                                        width: 30,
                                        color: Colors.white.withOpacity(0.7)),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Center(
                          child: Container(
                            height: gh(0.26),
                            margin: EdgeInsets.only(top: gh(0.1)),
                            width: gw(0.9),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.white,
                                    parseColor('#ADE8F4'),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              textDirection: TextDirection.rtl,
                              children: [
                                Expanded(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/icons/card-icon.svg'),
                                      Text("اشتراک کنونی :",
                                          style: textStyleSubscription),
                                      BlocBuilder<SubscriptionBloc,
                                          SubscriptionState>(
                                        builder: (context, state) {
                                          if (state
                                              is SubscriptionLoadingState) {
                                            return Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: MyWaiting(
                                                  size: 10,
                                                ));
                                          } else if (state
                                              is SubscriptionLoadedState) {
                                            if (state.resultObject != null) {
                                              if (state.resultObject!.success ==
                                                  true) {
                                                SubscriptionTypeInvoiceVm
                                                    subscriptionTypeInvoiceVm =
                                                    SubscriptionTypeInvoiceVm
                                                        .fromJson(state
                                                                .resultObject!
                                                                .extra
                                                            as Map<String,
                                                                dynamic>);
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5),
                                                  child: Text(
                                                    "${subscriptionTypeInvoiceVm.subscriptionTypeTitle}",
                                                    style: textStyle.copyWith(
                                                        fontSize: kFontSizeText(
                                                            sizeScreen,
                                                            FontSize.title)),
                                                  ),
                                                );
                                              } else {
                                                return Container();
                                              }
                                            } else {
                                              return Container();
                                            }
                                          } else {
                                            return Container();
                                          }
                                        },
                                      )
                                    ],
                                  ),
                                )),
                                BlocBuilder<GetSubscriptionInvoiceBloc,
                                    GetSubscriptionInvoiceState>(
                                  builder: (context, state) {
                                    if (state
                                        is GetSubscriptionInvoiceLoadingState)
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Get.width * 0.18),
                                        child: SpinKitThreeBounce(
                                          color:
                                              Color.fromRGBO(60, 198, 226, 1),
                                          size: Get.height * 0.0285,
                                        ),
                                      );
                                    else if (state
                                        is GetSubscriptionInvoiceLoadedState) {
                                      if (state.page_subscriptionTypeInvoiceListVm != null &&
                                          state.page_subscriptionTypeInvoiceListVm!
                                                  .items !=
                                              null &&
                                          state
                                              .page_subscriptionTypeInvoiceListVm!
                                              .items!
                                              .isNotEmpty) {
                                        return Expanded(
                                            child: GestureDetector(
                                          child: CircularPercentIndicator(
                                            startAngle: 0,
                                            backgroundWidth: 12.0,
                                            backgroundColor: Colors.white,
                                            radius: 95.0,
                                            animateFromLastPercent: true,
                                            lineWidth: 12.0,
                                            animation: true,
                                            percent: (state
                                                    .page_subscriptionTypeInvoiceListVm!
                                                    .items![0]
                                                    .dayCount! /
                                                100),
                                            center: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  state
                                                      .page_subscriptionTypeInvoiceListVm!
                                                      .items![0]
                                                      .dayCount
                                                      .toString(),
                                                  style: textStyleSubscription,
                                                ),
                                                Text(
                                                  "روز",
                                                  style: textStyleSubscription,
                                                ),
                                              ],
                                            ),
                                            circularStrokeCap:
                                                CircularStrokeCap.round,
                                            progressColor:
                                                parseColor("#48CAE4"),
                                          ),
                                        ));
                                      } else
                                        // return Expanded(
                                        //   child: Center(
                                        //     child: Text(
                                        //       'اشتراکی ندارید',
                                        //       style: textStyle.copyWith(
                                        //           fontSize: kFontSizeText(
                                        //               sizeScreen,
                                        //               FontSize.title)),
                                        //     ),
                                        //   ),
                                        // );
                                        return Container();
                                    } else
                                      return Container();
                                  },
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                )),
            Material(
              color: parseColor('#0096C7'),
              borderRadius: BorderRadius.circular(20),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BuySubscription(),
                      ));
                },
                child: Container(
                  width: gw(0.9),
                  height: gh(0.23),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 58,
                        child: Container(
                          decoration: BoxDecoration(
                              color: parseColor('#21BEDD'),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.16)),
                                BoxShadow(
                                  color:
                                      CupertinoColors.black.withOpacity(0.16),
                                  spreadRadius: -12.0,
                                  blurRadius: 12.0,
                                ),
                              ],
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20))),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Row(
                              textDirection: TextDirection.rtl,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/icons/wallet-icon.svg'),
                                    Text(
                                      "اعتبار شما : ",
                                      textDirection: TextDirection.rtl,
                                      style: textStyleBuySubscription2,
                                    )
                                  ],
                                ),
                                BlocBuilder<GetSubscriptionInvoiceBloc,
                                    GetSubscriptionInvoiceState>(
                                  builder: (context, state) {
                                    if (state
                                        is GetSubscriptionInvoiceLoadingState)
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Get.width * 0.1),
                                        child: SpinKitThreeBounce(
                                          color:
                                              Color.fromRGBO(60, 198, 226, 1),
                                          size: Get.height * 0.0285,
                                        ),
                                      );
                                    else if (state
                                        is GetSubscriptionInvoiceLoadedState) {
                                      if (state.page_subscriptionTypeInvoiceListVm != null &&
                                          state.page_subscriptionTypeInvoiceListVm!
                                                  .items !=
                                              null &&
                                          state
                                              .page_subscriptionTypeInvoiceListVm!
                                              .items!
                                              .isNotEmpty) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: Get.width * 0.05),
                                          child: Text(
                                              "${state.page_subscriptionTypeInvoiceListVm!.items![0].nTotalPrice} تومان ",
                                              style: textStyleSubscription
                                                  .copyWith(
                                                      color: Colors.white),
                                              textAlign: TextAlign.left),
                                        );
                                      } else
                                        return Padding(
                                          padding: EdgeInsets.only(left: 5),
                                          child: Text(
                                            'اعتباری ندارید',
                                            style: textStyle.copyWith(
                                                fontSize: kFontSizeText(
                                                    sizeScreen, FontSize.title),
                                                color: Colors.white),
                                          ),
                                        );
                                    } else
                                      return Container();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 42,
                        child: Center(
                          child: Text(
                            "خرید اشتراک >",
                            style: textStyleBuySubscription,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: gh(0.05)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "تاریخچه اشتراک ها",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  )),
            ),
            BlocBuilder<GetSubscriptionInvoiceBloc,
                GetSubscriptionInvoiceState>(
              builder: (context, state) {
                if (state is GetSubscriptionInvoiceLoadingState)
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SpinKitThreeBounce(
                      color: Color.fromRGBO(60, 198, 226, 1),
                      size: Get.height * 0.0285,
                    ),
                  );
                else if (state is GetSubscriptionInvoiceLoadedState) {
                  if (state.page_subscriptionTypeInvoiceListVm != null &&
                      state.page_subscriptionTypeInvoiceListVm!.items != null &&
                      state.page_subscriptionTypeInvoiceListVm!.items!
                          .isNotEmpty) {
                    return ListView.builder(
                      controller: isAlign
                          ? _exerciseScrollController
                          : _dietScrollController,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(bottom: padding),
                      itemBuilder: (context, index) {
                        if (index <
                            state.page_subscriptionTypeInvoiceListVm!.items!
                                .length)
                          return ItemDietary(
                              sizeScreen: sizeScreen,
                              subscriptionTypeInvoiceListVm: state
                                  .page_subscriptionTypeInvoiceListVm!
                                  .items![index]);
                        else
                          return Container();
                      },
                      itemCount:
                          state.page_subscriptionTypeInvoiceListVm!.hasNext!
                              ? state.page_subscriptionTypeInvoiceListVm!.items!
                                      .length +
                                  1
                              : state.page_subscriptionTypeInvoiceListVm!.items!
                                  .length,
                    );
                  } else
                    return NoData();
                } else
                  return Container();
              },
            ),
          ],
        ),
      )),
    ));
  }

  // Widget item(data) {
  //   return                                         BlocBuilder<GetSubscriptionInvoiceBloc, GetSubscriptionInvoiceState>(
  //     builder: (context, state) {
  //       if (state is GetSubscriptionInvoiceLoadingState)
  //         return Center(child: CircularProgressIndicator());
  //       else if (state is GetSubscriptionInvoiceLoadedState) {
  //         if (state.page_subscriptionTypeInvoiceListVm != null &&
  //             state.page_subscriptionTypeInvoiceListVm!.items != null &&
  //             state.page_subscriptionTypeInvoiceListVm!.items!.isNotEmpty) {
  //           return Padding(
  //             padding: EdgeInsets.symmetric(vertical: 5),
  //             child: DottedBorder(
  //               borderType: BorderType.RRect,
  //               color: parseColor('#CCCCCC'),
  //               dashPattern: [5],
  //               radius: Radius.circular(12),
  //               child: ClipRRect(
  //                   borderRadius: BorderRadius.all(Radius.circular(12)),
  //                   child: Container(
  //                     decoration: BoxDecoration(
  //                         border: Border(
  //                             right:
  //                             BorderSide(color: parseColor('#00B4D8'), width: 3))),
  //                     child: Padding(
  //                       padding: EdgeInsets.all(15),
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.start,
  //                         children: [
  //                           Expanded(
  //                             child: Column(
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 Text(
  //                                   data['title'],
  //                                   style: TextStyle(color: parseColor('#0077B6')),
  //                                 ),
  //                                 SizedBox(
  //                                   height: 10,
  //                                 ),
  //                                 Text(
  //                                   data['boxName'],
  //                                 ),
  //                                 data['type'].isNotEmpty
  //                                     ? Column(
  //                                   children: [
  //                                     SizedBox(
  //                                       height: 10,
  //                                     ),
  //                                     Text(
  //                                       data['type'],
  //                                     ),
  //                                   ],
  //                                 )
  //                                     : SizedBox()
  //                               ],
  //                             ),
  //                           ),
  //                           Expanded(
  //                             child: Column(
  //                               mainAxisAlignment: MainAxisAlignment.start,
  //                               crossAxisAlignment: CrossAxisAlignment.end,
  //                               children: [
  //                                 Text(data['date']),
  //                                 data['price'].isNotEmpty
  //                                     ? Column(
  //                                   children: [
  //                                     SizedBox(
  //                                       height: 10,
  //                                     ),
  //                                     Text(
  //                                       data['price'],
  //                                     ),
  //                                   ],
  //                                 )
  //                                     : SizedBox()
  //                               ],
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   )),
  //             ),
  //           );
  //         } else
  //           return Container(
  //             height: 20,
  //             width: 20,
  //             color: Colors.red,
  //           );
  //       } else
  //         return Container(
  //           height: 10,
  //           width: 10,
  //           color: Colors.blue,
  //         );
  //     },
  //   );
  //
  // }

}

class ItemDietary extends StatelessWidget {
  const ItemDietary(
      {Key? key,
      required this.sizeScreen,
      required this.subscriptionTypeInvoiceListVm})
      : super(key: key);

  final Size sizeScreen;
  final SubscriptionTypeInvoiceListVm subscriptionTypeInvoiceListVm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: DottedBorder(
        borderType: BorderType.RRect,
        color: parseColor('#CCCCCC'),
        dashPattern: [5],
        radius: Radius.circular(12),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      right:
                          BorderSide(color: parseColor('#00B4D8'), width: 3))),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            subscriptionTypeInvoiceListVm.subscriptionTypeTitle
                                .toString(),
                            style: TextStyle(color: parseColor('#0077B6')),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            subscriptionTypeInvoiceListVm
                                .subscriptionTypeDescription
                                .toString(),
                          ),
                          subscriptionTypeInvoiceListVm
                                  .subscriptionTypeTitle!.isNotEmpty
                              ? Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(subscriptionTypeInvoiceListVm
                                        .subscriptionTypeTitle
                                        .toString()),
                                  ],
                                )
                              : SizedBox()
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(subscriptionTypeInvoiceListVm.nCreationDate
                              .toString()),
                          subscriptionTypeInvoiceListVm.nTotalPrice!.isNotEmpty
                              ? Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                        "${subscriptionTypeInvoiceListVm.nTotalPrice.toString()} تومان "),
                                  ],
                                )
                              : SizedBox()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
