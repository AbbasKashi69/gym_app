import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gym_app/components/constant.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF2F2F2),
        leading: SvgPicture.asset('assets/icons/backIcon.svg'),
        brightness: Brightness.light,
        shadowColor: Colors.transparent,
      ),
      backgroundColor: kColorBackGround,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: padding),
            width: sizeScreen.width,
            height: sizeScreen.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: padding * 2),
                  child: Text(
                    'در حال اسکن کد...',
                    style: textStyle,
                  ),
                ),
                Container(
                  height: sizeScreen.height * 0.4,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: padding * 2,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: padding, vertical: padding),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xffffffff)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 2,
                            height: 30,
                            color: Color(0xff48CAE4),
                          ),
                          SizedBox(
                            width: padding,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                radius: sizeScreen.width > 550 ? 30 : 25,
                                backgroundColor: Color(0xff48CAE4),
                                backgroundImage: NetworkImage(
                                    'https://i.pinimg.com/564x/5b/40/87/5b4087d0fc8d9d372c00a32bc08f818c.jpg'),
                              ),
                              SizedBox(
                                width: padding / 2,
                              ),
                              Text(
                                'علی تلخابی',
                                style: textStyle,
                              )
                            ],
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          )
                        ],
                      ),
                      SizedBox(
                        height: padding,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 2,
                            height: 15,
                            color: Color(0xff00D84F),
                          ),
                          SizedBox(
                            width: padding / 2,
                          ),
                          SvgPicture.asset('assets/icons/logout.svg',
                              color: Color(0xff00D84F)),
                          Spacer(),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '12:59-00/04/30 دوشنبه',
                                style: textStyle,
                              ),
                              SizedBox(
                                width: padding,
                              ),
                              SvgPicture.asset(
                                'assets/icons/barCode.svg',
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: padding,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 2,
                            height: 15,
                            color: Color(0xffFF0057),
                          ),
                          SizedBox(
                            width: padding / 2,
                          ),
                          Transform.rotate(
                            angle: pi,
                            child: SvgPicture.asset(
                              'assets/icons/successLogin.svg',
                              color: Color(0xffFF0057),
                            ),
                          ),
                          Spacer(),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '12:59-00/04/30 دوشنبه',
                                style: textStyle,
                              ),
                              SizedBox(
                                width: padding,
                              ),
                              SvgPicture.asset(
                                'assets/icons/barCode.svg',
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
