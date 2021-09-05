import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gym_app/screen/Wallet/model/user_cart_model.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class TransferToBankPage extends StatefulWidget {
  const TransferToBankPage({Key? key}) : super(key: key);

  @override
  _TransferToBankPageState createState() => _TransferToBankPageState();
}

class _TransferToBankPageState extends State<TransferToBankPage> {
  bool _isSelected = false;
  bool _isTextCompleted = false;
  bool _isFill = false;
  TextEditingController _controller = TextEditingController();
  List<UserCartModel> userList = [];
  late String label = "";
  bool subPrice = false;
  int count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userList.add(UserCartModel(
        userName: "علی زحمتکش",
        cartNumber: "6037-6974-7021-4522",
        bankName: "سپه"));
    userList.add(UserCartModel(
        userName: "محمد رضا",
        cartNumber: "6037-6974-7021-4522",
        bankName: "مسکن"));
    userList.add(UserCartModel(
        userName: "زهرا", cartNumber: "6037-6974-7021-4522", bankName: "ملت"));
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
                    "انتقال به حساب بانکی",
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
                  "assets/icons/vuesax-linear-card-receive.svg",
                  height: Get.height * 0.075,
                ),
                SizedBox(
                  height: Get.height * 0.015,
                ),
                Text(
                  "انتقال به حساب بانکی",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'IRANSans',
                      fontSize: Get.height * 0.025),
                ),
                SizedBox(
                  height: Get.height * 0.035,
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
                      if (value.isEmpty) {
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
                InkWell(
                  onTap: () {
                    Get.bottomSheet(BottomSheet(
                      backgroundColor: Colors.transparent,
                      onClosing: () {},
                      builder: (context) => Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20))),
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
                              "انتخاب کارت",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "IRANSans",
                                  fontSize: Get.height * 0.03),
                            ),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            Expanded(
                              child: ListView.builder(
                                primary: true,
                                itemCount: userList.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: Get.width * 0.035),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                          setState(() {
                                            _isTextCompleted = true;
                                            count = index;
                                            print(count);
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: Get.height * 0.005),
                                          height: Get.height * 0.1,
                                          width: Get.width,
                                          child: Row(
                                            children: [
                                              Container(
                                                height: Get.height * 0.05,
                                                width: Get.width * 0.05,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: _isSelected
                                                            ? Colors
                                                                .lightBlueAccent
                                                            : Colors.grey
                                                                .withOpacity(
                                                                    0.6),
                                                        width: 2.5),
                                                    shape: BoxShape.circle),
                                                child: _isSelected
                                                    ? Center(
                                                        child: Container(
                                                          height: Get.height *
                                                              0.028,
                                                          width:
                                                              Get.width * 0.028,
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .lightBlueAccent,
                                                              shape: BoxShape
                                                                  .circle),
                                                        ),
                                                      )
                                                    : Container(),
                                              ),
                                              SizedBox(
                                                width: Get.width * 0.035,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,

                                                children: [
                                                  Text(
                                                    "${userList[index].cartNumber} ${userList[index].bankName}",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: "IRANSans",
                                                        fontSize:
                                                            Get.height * 0.025,
                                                        fontWeight:
                                                            FontWeight.w300),
                                                  ),
                                                  Text(
                                                    "${userList[index].userName}",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize:
                                                            Get.height * 0.025,
                                                        fontFamily: "IRANSans"),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ));
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ));
                  },
                  child: Container(
                    width: Get.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "شماره کارت",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "IRANSans",
                                  fontSize: Get.height * 0.025),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              size: Get.height * 0.03,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Visibility(
                          visible: _isTextCompleted,
                          child: Text(
                            "${userList[count].cartNumber} ${userList[count].userName}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: Get.height * 0.025,
                                fontFamily: "IRANSans"),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        Container(
                          height: Get.height * 0.0018,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                InkWell(
                  onTap: () {
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
                                      "آیا از درخواست انتقال وجه به حساب بانکی اطمینان دارید؟",
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
                      child: Center(
                        child: Text(
                          "ارسال درخواست",
                          style: TextStyle(
                              color: _isFill ? Colors.white : Colors.black,
                              fontSize: Get.height * 0.025,
                              fontFamily: "IRANSans"),
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
