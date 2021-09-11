import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gym_app/blocs/BottomNav/bloc/bottom_nav_bloc.dart';

class CustomAppBarWidget extends StatelessWidget {
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
        initialActiveIndex: 0,
        onTap: (int i) {
          BlocProvider.of<BottomNavBloc>(context)
              .add(BottomNavLoadingEvent(index: i));
        });
  }
}
