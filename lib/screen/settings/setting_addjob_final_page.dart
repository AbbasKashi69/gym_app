import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/extensions/ext.dart';
import 'package:gym_app/screen/CreateProgramBody/create_program_body_page.dart';
import 'package:gym_app/screen/ListApprentice/list_Apprentice_page.dart';

class SettingAddJobFinalPage extends StatefulWidget {
  const SettingAddJobFinalPage({Key? key}) : super(key: key);

  @override
  _SettingAddJobFinalPageState createState() => _SettingAddJobFinalPageState();
}

class _SettingAddJobFinalPageState extends State<SettingAddJobFinalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'تنظیمات',
      ),
      body: Container(
        height: gh(1),
        padding: EdgeInsets.symmetric(horizontal: gw(0.05)),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12), topLeft: Radius.circular(12))),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: "نام حرکت (فارسی)", labelText: 'نام حرکت'),
              ),
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: "نام حرکت (انگلیسی)", labelText: 'نام حرکت'),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("بارگذاری تصویر(png,jpg,gif)"),
                  Material(
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        height: 30,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: parseColor('#707070'))),
                        child: Text(
                          "انتخاب فایل",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("پیشنهاد به مدیر"),
                  Switch(value: false, onChanged: (value) {},
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              CustomeButton(
                  sizeScreen: MediaQuery.of(context).size,
                  title: "ثبت",
                  onTap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
