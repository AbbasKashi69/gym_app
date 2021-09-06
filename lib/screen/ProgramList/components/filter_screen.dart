import 'package:flutter/material.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/screen/CreateProgramBody/create_program_body_page.dart';

class FilterScreen {
  Future<void> filter(BuildContext context, Size sizeScreen) async {
    int itemSelected = 0;
    showModalBottomSheet(
      isDismissible: true,
      elevation: 20,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (BuildContext context, setState) {
          return SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  color: kColorBackGround,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: sizeScreen.width * 0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: padding,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xffE8E8E8),
                          borderRadius: BorderRadius.circular(10)),
                      width: sizeScreen.width * 0.1,
                      height: 5,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: padding),
                      child: Center(
                        child: Text(
                          'جستجوی فیلتر',
                          style: textStyle.copyWith(
                              fontSize:
                                  kFontSizeText(sizeScreen, FontSize.title),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: padding),
                      child: TextField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: padding / 2, horizontal: padding),
                              hintText: 'جستجوی شاگردان',
                              hintStyle: textStyle.copyWith(
                                  color: Color(0xff707070), fontSize: 12),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide:
                                      BorderSide(color: Color(0xff707070))))),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: padding),
                      alignment: Alignment.centerRight,
                      child: Text(
                        'وضعیت',
                        style: textStyle.copyWith(
                            fontSize:
                                kFontSizeText(sizeScreen, FontSize.title)),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                          listItems.length,
                          (index) => ItemFilteringStatus(
                                data: listItems[index],
                                itemSelected: itemSelected,
                                onChange: (int value) {
                                  setState(() {
                                    itemSelected = value;
                                  });
                                },
                              )),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: padding),
                      child: CustomeButton(
                          sizeScreen: sizeScreen, title: 'جستجو', onTap: () {}),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ItemFilteringStatus extends StatelessWidget {
  final dynamic data;
  final Function onChange;
  final int itemSelected;
  ItemFilteringStatus(
      {required this.data, required this.onChange, required this.itemSelected});
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: padding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio<int>(
                value: data['selected'],
                groupValue: itemSelected,
                activeColor: Colors.blue,
                onChanged: (value) {
                  onChange(value);
                },
              ),
              SizedBox(
                height: padding,
              ),
              Text(
                data['name'],
                style: textStyle.copyWith(
                    fontSize: kFontSizeText(sizeScreen, FontSize.subTitle)),
              )
            ],
          )
        ],
      ),
    );
  }
}

List listItems = [
  {
    'name': 'درحال انجام',
    'selected': 0,
  },
  {
    'name': 'تمام شده',
    'selected': 1,
  },
  {
    'name': 'شروع شده',
    'selected': 2,
  },
];
