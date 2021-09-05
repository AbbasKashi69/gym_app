import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gym_app/screen/Home/home_page.dart';
import 'package:gym_app/screen/Wallet/wallet_page.dart';
import 'package:gym_app/screen/profile_page/profile_page.dart';
import 'package:gym_app/screen/subscription_page/subscription_page.dart';

class CustomAppBarWidget extends StatelessWidget {
  int initialTab = 0;

  CustomAppBarWidget(this.initialTab);

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
        style: TabStyle.fixedCircle,
        backgroundColor: Colors.white,
        color: Colors.white,
        elevation: 1,
        disableDefaultTabController: true,
        height: Get.height * 0.075,
        items: [
          TabItem(
              icon: SvgPicture.asset("assets/icons/home.svg"),
              isIconBlend: false,
              activeIcon: InkWell(
                  child:
                      SvgPicture.asset("assets/icons/vuesax-bold-home.svg"))),
          TabItem(
              icon: SvgPicture.asset("assets/icons/money-4.svg"),
              isIconBlend: false,
              activeIcon: SvgPicture.asset("assets/icons/money.svg")),
          TabItem(
              icon: SvgPicture.asset("assets/icons/button.svg"),
              isIconBlend: false),
          TabItem(
              icon: SvgPicture.asset("assets/icons/vuesax-linear-user.svg"),
              isIconBlend: false,
              activeIcon: SvgPicture.asset("assets/icons/user.svg")),
          TabItem(
              icon: SvgPicture.asset("assets/icons/wallet.svg"),
              isIconBlend: false,
              activeIcon: SvgPicture.asset("assets/icons/wallet-b.svg")),
        ],
        initialActiveIndex: initialTab,
        onTap: (int i) {
          if (i == 0) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          } else if (i == 1) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => SubscriptionPage()));
          } else if (i == 3) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => ProfilePage()));
          } else if (i == 4) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => WalletPage()));
            //todo be in tartib
          }
        });
  }
}
