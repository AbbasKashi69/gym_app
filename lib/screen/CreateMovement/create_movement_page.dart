import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/no_data.dart';
import 'package:gym_app/extensions/ext.dart';
import 'package:gym_app/screen/CreateProgramBody/create_program_body_page.dart';
import 'package:gym_app/screen/ListApprentice/list_Apprentice_page.dart';

class CreateMovement extends StatefulWidget {
  static const routeName = '/CreateMovement';
  const CreateMovement({Key? key}) : super(key: key);

  @override
  _CreateMovementState createState() => _CreateMovementState();
}

class _CreateMovementState extends State<CreateMovement> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kColorAppbar,
      appBar: AppBarWidget(
        title: 'ایجاد برنامه بدنسازی',
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: kBodyDecoration,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: padding / 2),
                margin: EdgeInsets.symmetric(vertical: padding),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    Row(
                      children: List.generate(
                        listItemFilterChip.length,
                        (index) => ItemFilterChip(
                            index: index,
                            onChangeValue: (value) {
                              setState(() {
                                isSelected = value;
                              });
                            },
                            isSelected: isSelected),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        listItemFilterChip.add(ItemFilterChip(
                            index: listItemFilterChip.length,
                            onChangeValue: () {},
                            isSelected: isSelected));
                        setState(() {});
                      },
                      child: DottedBorder(
                          borderType: BorderType.Circle,
                          dashPattern: [5],
                          color: parseColor('#707070'),
                          child: Container(
                            padding: EdgeInsets.all(padding),
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: parseColor('#565656'),
                              ),
                            ),
                          )),
                    )
                  ]),
                ),
              ),
              Column(
                children: List.generate(
                    listItemMovement.length,
                    (index) => ItemMovement(
                          data: listItemMovement[index],
                        )),
              ),
              GestureDetector(
                onTap: () {
                  listItemMovement.add({
                    'listItemAddedSuperMovement': [ItemAddedSuperMovement()]
                  });
                  setState(() {});
                },
                child: Container(
                  width: gw(0.8),
                  height: gh(0.07),
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    color: parseColor('#00B4D8'),
                    dashPattern: [5],
                    radius: Radius.elliptical(20, 20),
                    child: Container(
                      // width: gw(0.8),
                      // height: gh(0.03),
                      child: Center(
                        child: Text(
                          'حرکت جدید',
                          style: textStyle.copyWith(
                              fontSize:
                                  kFontSizeText(sizeScreen, FontSize.subTitle),
                              color: parseColor('#00B4D8')),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: padding * 2),
                  child: CustomeButton(
                    sizeScreen: sizeScreen,
                    title: 'ثبت برنامه',
                    onTap: () {},
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

String intToString(int index) {
  switch (index) {
    case 1:
      return 'اول';
    case 2:
      return 'دوم';
    case 3:
      return 'سوم';
    case 4:
      return 'چهارم';
    case 5:
      return 'پنجم';
    case 6:
      return 'ششم';
    case 7:
      return 'هفتم';
    case 8:
      return 'هشتم';
    case 9:
      return 'نهم';
    case 10:
      return 'دهم';
    default:
      return 'صفرم';
  }
}

List<ItemFilterChip> listItemFilterChip = [
  ItemFilterChip(index: 0, onChangeValue: () {}, isSelected: false),
  ItemFilterChip(index: 1, onChangeValue: () {}, isSelected: false),
  ItemFilterChip(index: 2, onChangeValue: () {}, isSelected: false),
];

class ItemMovement extends StatefulWidget {
  const ItemMovement({Key? key, required this.data}) : super(key: key);
  final dynamic data;

  @override
  _ItemMovementState createState() => _ItemMovementState();
}

class _ItemMovementState extends State<ItemMovement> {
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: padding),
      child: DottedBorder(
          borderType: BorderType.RRect,
          color: parseColor('#0055CC'),
          // color:parseColor('#CCCCCC'),
          dashPattern: [5],
          radius: Radius.circular(12),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: padding),
                    child: Column(
                        children: List.generate(
                            widget.data['listItemAddedSuperMovement'].length,
                            (index) => ItemAddedSuperMovement())),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: CustomeButton(
                      sizeScreen: sizeScreen,
                      title: 'حرکت سوپری',
                      onTap: () {
                        setState(() {
                          widget.data['listItemAddedSuperMovement']
                              .add(ItemAddedSuperMovement());
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}

class ItemAddedSuperMovement extends StatelessWidget {
  const ItemAddedSuperMovement({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 15),
            width: 3,
            decoration: BoxDecoration(
              color: parseColor('#48CAE4'),
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30), bottom: Radius.circular(30)),
            ),
            height: 200,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: TextField(
                  decoration: InputDecoration(
                      suffix: Padding(
                          padding: const EdgeInsetsDirectional.only(end: 5),
                          child: GestureDetector(
                            onTap: () {
                              // here we should clear textfield  using textEditing controller
                              //using this code: textEditingController.clear()
                            },
                            child: SvgPicture.asset(
                              'assets/icons/deleteIcon.svg',
                              width: 20,
                              height: 20,
                            ),
                          )),
                      hintText: 'نام حرکت',
                      hintStyle: textStyle.copyWith(
                          fontSize:
                              kFontSizeText(sizeScreen, FontSize.subTitle))),
                ),
              ),
              Container(
                width: 30,
                margin: EdgeInsets.only(bottom: 20),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'ست',
                      hintStyle: textStyle.copyWith(
                          fontSize:
                              kFontSizeText(sizeScreen, FontSize.subTitle))),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: TextField(
                  decoration: InputDecoration(
                      suffix: Padding(
                          padding: const EdgeInsetsDirectional.only(end: 5),
                          child: GestureDetector(
                            onTap: () {
                              // here we should clear textfield  using textEditing controller
                              //using this code: textEditingController.clear()
                            },
                            child: SvgPicture.asset(
                              'assets/icons/deleteIcon.svg',
                              width: 20,
                              height: 20,
                            ),
                          )),
                      hintText: 'توضیحات حرکت',
                      hintStyle: textStyle.copyWith(
                          fontSize:
                              kFontSizeText(sizeScreen, FontSize.subTitle))),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}

class ItemFilterChip extends StatefulWidget {
  const ItemFilterChip(
      {Key? key,
      required this.onChangeValue,
      required this.index,
      required this.isSelected})
      : super(key: key);

  final Function onChangeValue;
  final bool isSelected;
  final int index;

  @override
  _ItemFilterChipState createState() => _ItemFilterChipState();
}

class _ItemFilterChipState extends State<ItemFilterChip> {
  bool isSelecteddd = false;
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        margin: EdgeInsets.only(left: padding),
        child: ChoiceChip(
          labelPadding: EdgeInsets.only(
              right: padding,
              top: padding / 2,
              bottom: padding / 2,
              left: padding / 2),
          avatar: CircleAvatar(
            backgroundColor: Colors.white,
            child: SvgPicture.asset(
              'assets/icons/deleteIcon.svg',
              width: 20,
              height: 20,
            ),
          ),
          backgroundColor: Color(0xffEEEEEE),
          selected: isSelecteddd,
          selectedColor: Color(0xff00B4D8),
          label: Text('نوبت ${intToString(widget.index + 1)}',
              style: textStyle.copyWith(
                  fontSize: kFontSizeText(sizeScreen, FontSize.subTitle),
                  color: isSelecteddd ? Colors.white : Color(0xff959595))),
          onSelected: (bool isValid) {
            // if (!isValid)
            setState(() {
              isSelecteddd = isValid;
            });
          },
        ),
      ),
    );
  }
}

List listItemMovement = [
  {
    'listItemAddedSuperMovement': [ItemAddedSuperMovement()]
  },
  {
    'listItemAddedSuperMovement': [ItemAddedSuperMovement()]
  }
];
