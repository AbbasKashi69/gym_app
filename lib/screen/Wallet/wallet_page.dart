import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gym_app/ViewModels/SubscriptionTypeInvoice/SubscriptionTypeInvoiceVm.dart';
import 'package:gym_app/ViewModels/Transaction/TransactionAmountVm.dart';
import 'package:gym_app/ViewModels/Transaction/TransactionVm.dart';
import 'package:gym_app/blocs/WalletLog/bloc/get_my_deposit_bloc.dart';
import 'package:gym_app/blocs/WalletLog/bloc/get_my_withdrawal_bloc.dart';
import 'package:gym_app/blocs/WalletLog/bloc/get_my_wallet_ballance_bloc.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/customBottomBar.dart';
import 'package:gym_app/components/myWaiting.dart';
import 'package:gym_app/screen/Wallet/tansfer_others_wallet.dart';
import 'package:gym_app/screen/Wallet/transfer_page.dart';
import 'package:gym_app/screen/Wallet/turnover_page.dart';
// import 'package:gym_app/screen/Wallet/turnover_page.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import 'Increase_page.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);
  static const routeName = '/wallet';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: Get.height * 0.135,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(25),
                            bottomLeft: Radius.circular(25))),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: Get.width,
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
                          width: Get.width,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: Get.height * 0.025,
                                  right: Get.width * 0.05),
                              child: Text(
                                "LOGO",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                    fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: Get.height * 0.025,
                                  left: Get.width * 0.05),
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
                      height: Get.height * 0.12,
                      margin: EdgeInsets.only(top: Get.height * 0.1),
                      width: Get.width * 0.9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SvgPicture.asset("assets/icons/backgroundWallet.svg"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/icons/iconWallet.svg",
                                  height: Get.height * 0.07),
                              Text(
                                "اعتبار شما :",
                                style: textStyleHome.copyWith(
                                    fontSize: Get.height * 0.025),
                              ),
                              BlocBuilder<GetMyWalletBallanceBloc,
                                  GetMyWalletBallanceState>(
                                builder: (context, state) {
                                  if (state is GetMyWalletBallanceLoadingState)
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: SpinKitThreeBounce(
                                        color: Colors.white,
                                        size: Get.height * 0.0285,
                                      ),
                                    );
                                  else if (state
                                      is GetMyWalletBallanceLoadedState) if (state
                                          .userWalletVm !=
                                      null)
                                    return Text(
                                        '${state.userWalletVm!.nWalletBallance!} تومان',
                                        style: textStyleHome);
                                  else
                                    return Text(
                                      '0',
                                      style: textStyleHome,
                                    );
                                  else
                                    return Container();
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Container(
                height: Get.height * 0.13,
                width: Get.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: Colors.grey[100],
                  border: Border.all(color: Colors.grey.withOpacity(0.2)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "مجموع ورودی و واریز :",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'IRANSans',
                            fontWeight: FontWeight.w400),
                      ),
                      BlocBuilder<GetMyDepositBloc, GetMyDepositState>(
                        builder: (context, state) {
                          if (state is GetMyDepositLoadingState) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: SpinKitThreeBounce(
                                color: Color.fromRGBO(60, 198, 226, 1),
                                size: Get.height * 0.0285,
                              ),
                            );
                          } else if (state is GetMyDepositLoadedState) {
                            if (state.transactionAmountVm != null) {
                              return Text(
                                "${state.transactionAmountVm!.nAmount.toString().toPersianDigit()} تومان ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: 'IRANSans',
                                    fontWeight: FontWeight.w400),
                              );
                            } else {
                              return Container(
                                height: 10,
                              );
                            }
                          } else {
                            return Container(
                              height: 10,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: Get.height * 0.13,
                width: Get.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: Colors.grey[100],
                  border: Border.all(color: Colors.grey.withOpacity(0.2)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "مجموع خروجی و برداشت :",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'IRANSans',
                            fontWeight: FontWeight.w400),
                      ),
                      BlocBuilder<GetWithdrawalBloc, GetMyWithdrawalState>(
                        builder: (context, state) {
                          if (state is GetMyWithdrawalLoadingState) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: SpinKitThreeBounce(
                                color: Color.fromRGBO(60, 198, 226, 1),
                                size: Get.height * 0.0285,
                              ),
                            );
                          } else if (state is GetMyWithdrawalLoadedState) {
                            if (state.transactionAmountVm != null) {
                              return Text(
                                "${state.transactionAmountVm!.nAmount.toString().toPersianDigit()} تومان ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: 'IRANSans',
                                    fontWeight: FontWeight.w400),
                              );
                            } else {
                              return Container(
                                height: 10,
                              );
                            }
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.015,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(IncreaseWalletPage.routeName);
                },
                child: Container(
                  height: Get.height * 0.08,
                  width: Get.width * 0.9,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromRGBO(63, 176, 213, 1), width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width * 0.03),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/empty-wallet-add.svg",
                              height: Get.height * 0.05,
                            ),
                            SizedBox(
                              width: Get.width * 0.05,
                            ),
                            Text(
                              "افزایش موجودی",
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 150, 199, 1),
                                  fontFamily: "IRANSans",
                                  fontSize: Get.height * 0.02),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width * 0.03),
                        child: SvgPicture.asset(
                          "assets/icons/arrow-left.svg",
                          height: Get.height * 0.022,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.015,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(TransferToBankPage.routeName);
                },
                child: Container(
                  height: Get.height * 0.08,
                  width: Get.width * 0.9,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromRGBO(63, 176, 213, 1), width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width * 0.03),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/vuesax-linear-card-receive.svg",
                              height: Get.height * 0.05,
                            ),
                            SizedBox(
                              width: Get.width * 0.05,
                            ),
                            Text(
                              "انتقال به حساب بانکی",
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 150, 199, 1),
                                  fontFamily: "IRANSans",
                                  fontSize: Get.height * 0.02),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width * 0.03),
                        child: SvgPicture.asset(
                          "assets/icons/arrow-left.svg",
                          height: Get.height * 0.022,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.015,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(
                    TransferOtherWallet.routeName,
                  );
                },
                child: Container(
                  height: Get.height * 0.08,
                  width: Get.width * 0.9,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromRGBO(63, 176, 213, 1), width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width * 0.03),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/empty-wallet-change.svg",
                              height: Get.height * 0.05,
                            ),
                            SizedBox(
                              width: Get.width * 0.05,
                            ),
                            Text(
                              "انتقال به کیف پول دیگران",
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 150, 199, 1),
                                  fontFamily: "IRANSans",
                                  fontSize: Get.height * 0.02),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width * 0.03),
                        child: SvgPicture.asset(
                          "assets/icons/arrow-left.svg",
                          height: Get.height * 0.022,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.015,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(TurnoverPage.routeName);
                },
                child: Container(
                  height: Get.height * 0.08,
                  width: Get.width * 0.9,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromRGBO(63, 176, 213, 1), width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width * 0.03),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/clipboard2.svg",
                              height: Get.height * 0.05,
                            ),
                            SizedBox(
                              width: Get.width * 0.05,
                            ),
                            Text(
                              "گزارش مالی",
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 150, 199, 1),
                                  fontFamily: "IRANSans",
                                  fontSize: Get.height * 0.02),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width * 0.03),
                        child: SvgPicture.asset(
                          "assets/icons/arrow-left.svg",
                          height: Get.height * 0.022,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
