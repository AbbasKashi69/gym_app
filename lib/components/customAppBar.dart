import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  @override
  Size get preferredSize => Size.fromHeight(Get.height * 0.2);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      brightness: Brightness.dark,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      toolbarHeight: Get.height * 0.14,
      leadingWidth: Get.width * 0.5,
      leading: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 15),
        child: Text("LOGO",style: TextStyle(color: Colors.white.withOpacity(0.8),fontSize: 20),),
      ), //todo inja bayad logo qrar begire
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none_rounded,color: Colors.white.withOpacity(0.6),size: 30,),alignment: Alignment.topCenter,padding: EdgeInsets.symmetric(horizontal: Get.width *0.055,vertical: Get.height * 0.03),)
      ],
      flexibleSpace: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),

        ),
        child: Stack(
          children: [
            Image.asset("assets/images/appBar.png"),
            Image.asset("assets/images/background.png"),
          ],
        ),
      ),
    );
  }
}