import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/extensions/ext.dart';
import 'package:gym_app/screen/CreateProgramBody/create_program_body_page.dart';
import 'package:gym_app/screen/ListApprentice/list_Apprentice_page.dart';

class BuySubscription extends StatefulWidget {
  const BuySubscription({Key? key}) : super(key: key);

  @override
  _BuySubscriptionState createState() => _BuySubscriptionState();
}

class _BuySubscriptionState extends State<BuySubscription> {
  List listItems = [
    {
      'name': 'یک ماهه',
      'price': '200,000 تومان',
      'selected': '0',
      'color': '#ffffff'
    },
    {
      'name': 'دو ماهه',
      'price': '380,000 تومان',
      'selected': '0',
      'color': '#FFC400'
    },
    {
      'name': 'سه ماهه',
      'price': '650,000 تومان',
      'selected': '1',
      'color': '#00B4D8 '
    },
    {
      'name': 'شش ماهه',
      'price': '100,000,000 تومان',
      'selected': '0',
      'color': '#00CF53'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: parseColor('#FBFBFB'),
      appBar: AppBarWidget(
        title: 'خرید اشتراک ',
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "اشتراک مورد نظر خود را انتخاب کنید:",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  )),
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                itemCount: listItems.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return item(listItems[index]);
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomeButton(
                sizeScreen: MediaQuery.of(context).size,
                title: 'خرید و ثبت اشتراک',
                onTap: () {
                  showMyModalBottomSheet();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget item(data) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              stops: [0.015, 0.015],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [parseColor(data['color']), Colors.white]),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textDirection: TextDirection.rtl,
        children: [
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Text(data['name']),
            ],
          ),
          Text(
            data['price'],
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
          ),
          Radio(
            value: 1,
            groupValue: int.parse(data['selected']),
            activeColor: Colors.blue,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }

  void showMyModalBottomSheet() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(12), topLeft: Radius.circular(12)),
        ),
        builder: (context) => Container(
            height: 500,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12))),
            child: Column(
              children: [
                SizedBox(
                  height: 13,
                ),
                Container(
                  width: 40,
                  height: 6,
                  decoration: BoxDecoration(
                      color: parseColor('#E8E8E8'),
                      borderRadius: BorderRadius.circular(20)),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: SvgPicture.asset(
                    'assets/icons/empty-wallet-remove.svg',
                    width: 88,
                    height: 88,
                  ),
                ),
                Expanded(
                  child: Center(
                      child: Text("اعتبار شما برای خرید اشتراک کافی نیست")),
                ),
                Container(
                  height: 40,
                  child: CustomeButton(
                    title: 'افزایش موجودی',
                    onTap: () {},
                    sizeScreen: MediaQuery.of(context).size,
                  ),
                ),
                Expanded(
                  child: SizedBox(),
                )
              ],
            )));
  }
}
