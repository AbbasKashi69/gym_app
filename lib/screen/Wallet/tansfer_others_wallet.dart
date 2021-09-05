import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class TransferOtherWallet extends StatefulWidget {
  const TransferOtherWallet({Key? key}) : super(key: key);

  @override
  _TransferOtherWalletState createState() => _TransferOtherWalletState();
}

class _TransferOtherWalletState extends State<TransferOtherWallet> {
  bool _isFill = false;
  TextEditingController _controller = TextEditingController();
  TextEditingController _controllerNumber = TextEditingController();
  late String label = "";
  bool subPrice = false;
  bool error = false;
  final _formKey = GlobalKey<FormState>();
  void _saveForm() {
    _formKey.currentState!.validate();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        toolbarHeight: Get.height * 0.08,
        actions: [
          Container(
            width: Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "انتقال به کیف پول دیگران",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Get.height * 0.02,
                        fontFamily: 'IRANSans',
                        fontWeight: FontWeight.w600),
                    maxLines: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                        "assets/icons/vuesax-linear-arrow-square-left.svg"),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Container(
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
                "assets/icons/empty-wallet-change.svg",
                height: Get.height * 0.075,
              ),
              SizedBox(
                height: Get.height * 0.015,
              ),
              Text(
                "انتقال به کیف پول دیگران",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'IRANSans',
                    fontSize: Get.height * 0.025),
              ),
              TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: _controller,
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
              SizedBox(
                height: Get.height * 0.015,
              ),
              Form(
               key: _formKey,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "شماره موبایل کاربر در سیستم ثبت نشده است !";
                    }
                    return null;
                  },
                  controller: _controllerNumber,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                   errorStyle: TextStyle(color: Colors.red,fontFamily: "IRANSans",fontSize:Get.height * 0.02),
                      contentPadding: EdgeInsets.all(0),
                      helperStyle: TextStyle(
                          color: Colors.black,
                          fontFamily: "IRANSans",
                          fontSize: Get.height * 0.02),
                      labelText: "شماره موبایل کاربر",
                      labelStyle: TextStyle(
                          color: Colors.black54,
                          fontSize: Get.height * 0.025,
                          fontFamily: "IRANSans"),
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.05,),
              InkWell(
                onTap: (){
                  _saveForm();
                },
                child: Container(
                    margin: EdgeInsets.only(top: 10),
                    height: Get.height * 0.08,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
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
                            ])
                    ),
                    child: InkWell(
                      onTap: (){
                        _isFill
                            ? Get.bottomSheet(BottomSheet(
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          onClosing: () {},
                          builder: (context) {
                            return Container(
                              height: Get.height * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    height: Get.height * 0.009,
                                    width: Get.width * 0.18,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.grey[300]),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.03,
                                  ),
                                  Text(
                                    "آیا از درخواست انتقال وجه اطمینان دارید؟",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "IRANSans",
                                        fontSize: Get.height * 0.025),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                      height: Get.height * 0.05
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          height: Get.height * 0.08,
                                          width: Get.width * 0.4,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  colors: [
                                                    Colors.grey.withOpacity(0.3),
                                                    Colors.grey.withOpacity(0.2),
                                                  ]
                                              ),
                                              borderRadius: BorderRadius.circular(30)
                                          ),
                                          child: Center(
                                            child: Text("خیر",style: TextStyle(color: Colors.black,fontFamily: "IRANSans",fontSize: Get.height * 0.025,fontWeight: FontWeight.w400),),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: Get.height * 0.08,
                                        width: Get.width * 0.4,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                colors: [
                                                  Color.fromRGBO(20, 186, 219, 1),
                                                  Color.fromRGBO(60, 198, 226, 1)
                                                ]
                                            ),
                                            borderRadius: BorderRadius.circular(30)
                                        ),
                                        child: Center(
                                          child: Text("بله",style: TextStyle(color: Colors.white,fontFamily: "IRANSans",fontSize: Get.height * 0.025,fontWeight: FontWeight.w600),),
                                        ),
                                      ),

                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        ))
                            : Container();
                      },
                      child: Center(
                        child: Text(
                          "انتقال وجه",
                          style: TextStyle(
                              color: _isFill ? Colors.white : Colors.black,
                              fontSize: Get.height * 0.025,
                              fontFamily: "IRANSans"),
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

