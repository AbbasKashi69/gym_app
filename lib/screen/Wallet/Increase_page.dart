import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:gym_app/ViewModels/Account/RegisterVm.dart';
import 'package:gym_app/ViewModels/WalletLog/IncreaseCreditVm.dart';
import 'package:gym_app/blocs/Account/bloc/register_bloc.dart';
import 'package:gym_app/blocs/WalletLog/bloc/get_my_wallet_ballance_bloc.dart';
import 'package:gym_app/blocs/WalletLog/bloc/increase_bloc.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/myWaiting.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class IncreaseWalletPage extends StatefulWidget {
  static const routeName = '/increase';

  @override
  _IncreaseWalletPageState createState() => _IncreaseWalletPageState();
}

class _IncreaseWalletPageState extends State<IncreaseWalletPage> {
  bool _isSwitched = false;
  bool _isFill = false;
  bool _error = false;
  TextEditingController _controllerAmount = TextEditingController();
  TextEditingController _controllerTrackNumber = TextEditingController();
  late String label = "";
  final _formKey = GlobalKey<FormState>();
  bool subPrice = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        toolbarHeight: Get.height * 0.08,
        leadingWidth: Get.width,
        leading: Center(
            child: Padding(
          padding: EdgeInsets.only(right: Get.width * 0.012),
          child: Text(
            "افزایش موجودی",
            style: TextStyle(
                color: Colors.black,
                fontSize: Get.height * 0.02,
                fontFamily: 'IRANSans',
                fontWeight: FontWeight.w600),
            maxLines: 1,
          ),
        )),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap:(){
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                  "assets/icons/vuesax-linear-arrow-square-left.svg"),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.035),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: Get.height * 0.025,
                ),
                SvgPicture.asset(
                  "assets/icons/empty-wallet-add.svg",
                  height: Get.height * 0.075,
                ),
                SizedBox(
                  height: Get.height * 0.015,
                ),
                Text(
                  "افزایش موجودی",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'IRANSans',
                      fontSize: Get.height * 0.025),
                ),
                SizedBox(
                  height: Get.height * 0.035,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "موجودی :",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: Get.height * 0.023,
                          fontFamily: "IRANSans",
                          fontWeight: FontWeight.w400),
                    ),
                    BlocBuilder<GetMyWalletBallanceBloc,
                        GetMyWalletBallanceState>(
                      builder: (context, state) {
                        if (state is GetMyWalletBallanceLoadingState)
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: SpinKitThreeBounce(color: Color.fromRGBO(60, 198, 226, 1),size: Get.height * 0.0285,),
                          );
                        else if (state
                        is GetMyWalletBallanceLoadedState) if (state
                            .userWalletVm !=
                            null)
                          return Text(
                              '${state.userWalletVm!.nWalletBallance!.toPersianDigit()} تومان',
                              style: textStyleHome.copyWith(color: Colors.black,fontSize: Get.height * 0.022));
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
                SizedBox(
                  height: Get.height * 0.015,
                ),
                Container(
                  height: Get.height * 0.09,
                  width: Get.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.withOpacity(0.3)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "آنلاین",
                        style: TextStyle(
                            color: _isSwitched
                                ? Colors.grey
                                : Color.fromRGBO(0, 180, 216, 1),
                            fontSize: Get.height * 0.025,
                            fontFamily: "IRANSans",
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: Get.width * 0.05,
                      ),
                      CupertinoSwitch(
                        activeColor: Color.fromRGBO(202, 240, 228, 1),
                        trackColor: Color.fromRGBO(72, 202, 228, 1),
                        value: _isSwitched,
                        onChanged: (value) {
                          setState(() {
                            _isSwitched = value;
                          });
                        },
                      ),
                      SizedBox(
                        width: Get.width * 0.05,
                      ),
                      Text(
                        "آفلاین",
                        style: TextStyle(
                            color: _isSwitched
                                ? Color.fromRGBO(0, 180, 216, 1)
                                : Colors.grey,
                            fontSize: Get.height * 0.025,
                            fontFamily: "IRANSans",
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.025,
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      controller: _controllerAmount,
                      onChanged: (value) {
                        setState(() {
                          _isFill = true;
                          label = value;
                          subPrice = true;
                          if(value.isEmpty){
                            setState(() {
                              _isFill = false;
                            });
                          }
                        });
                      },
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'مقدار مورد نظر را وراد کنید';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          helperText:
                              "${label.toWord()} ${subPrice ? "تومان" : ""}",
                          helperStyle: TextStyle(
                              color: Colors.black,
                              fontFamily: "IRANSans",
                              fontSize: Get.height * 0.02),
                          labelText: "مقدار",
                          labelStyle: TextStyle(
                              color: Colors.black54,
                              fontSize: Get.height * 0.025,
                              fontFamily: "IRANSans"),
                          suffix: Text(
                            "تومان",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "IRANSans",
                                fontSize: Get.height * 0.024),
                          )),
                    ),
                  ),
                ),
                _isSwitched
                    ? TextField(
                  controller: _controllerTrackNumber,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          helperStyle: TextStyle(
                              color: Colors.black,
                              fontFamily: "IRANSans",
                              fontSize: Get.height * 0.02),
                          labelText: "شماره رسید",
                          labelStyle: TextStyle(
                              color: Colors.black54,
                              fontSize: Get.height * 0.025,
                              fontFamily: "IRANSans"),
                        ),
                      )
                    : Container(),
                SizedBox(
                  height: Get.height * 0.025,
                ),
                _isSwitched
                    ? InkWell(
                  child: Container(
                      margin: EdgeInsets.only(top: 10),
                      height: Get.height * 0.08,
                      width: Get.width,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              end: Alignment.topCenter,
                              begin: Alignment.topCenter,
                              colors: [
                                _isFill
                                    ? Color.fromRGBO(20, 186, 219, 1)
                                    : Colors.grey.withOpacity(0.3),
                                _isFill
                                    ? Color.fromRGBO(60, 198, 226, 1)
                                    : Colors.grey.withOpacity(0.2)
                              ]),
                          borderRadius: BorderRadius.circular(30),
                         ),
                      child: Center(
                        child: Text(
                          "ارسال درخواست",
                          style: TextStyle(
                              color:  _isFill ? Colors.white : Colors.black,
                              fontSize: Get.height * 0.025,
                              fontFamily: "IRANSans"),
                        ),
                      )
                  ),
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      BlocProvider.of<IncreaseBloc>(context).add(
                          IncreaseLoadingEvent(
                              increaseCreditVm: IncreaseCreditVm(
                                id: 1,
                                increaseCreditAmount: int.parse(_controllerAmount.text),
                                invoiceTrackingCode: _controllerTrackNumber.text,
                                isOnline: false,

                              )
                          ),

                      );
                      Fluttertoast.showToast(msg: 'با موفقیت ثبت شد',backgroundColor: Colors.green);
                    }
                  },
                )
                    : InkWell(
                  onTap: () {
                     if (_formKey.currentState!.validate()) {
                       BlocProvider.of<IncreaseBloc>(context).add(
                           IncreaseLoadingEvent(
                               increaseCreditVm: IncreaseCreditVm(
                                 id: 1,
                                 increaseCreditAmount: int.parse(_controllerAmount.text),
                                 invoiceTrackingCode: "Null",
                                 isOnline: true,

                               )
                           ),

                       );
                       Fluttertoast.showToast(msg: 'با موفقیت ثبت شد',backgroundColor: Colors.green);

                     }
                  },
                      child: Container(
                      margin: EdgeInsets.only(top: 10),
                      height: Get.height * 0.08,
                      width: Get.width,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              end: Alignment.topCenter,
                              begin: Alignment.topCenter,
                              colors: [
                                _isFill
                                    ? Color.fromRGBO(20, 186, 219, 1)
                                    : Colors.grey.withOpacity(0.3),
                                _isFill
                                    ? Color.fromRGBO(60, 198, 226, 1)
                                    : Colors.grey.withOpacity(0.2)
                              ]),
                          borderRadius: BorderRadius.circular(30),

                      ),
                      child: Center(
                        child: Text(
                          "ارسال درخواست",
                          style: TextStyle(
                              color:  _isFill ? Colors.white : Colors.black,
                              fontSize: Get.height * 0.025,
                              fontFamily: "IRANSans"),
                        ),
                      )
                ),
                    )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
