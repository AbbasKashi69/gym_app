import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/blocs/PlanType/bloc/get_plans_by_sort_bloc.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/screen/CreateProgramBody/create_program_body_page.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen(
      {Key? key,
      required this.coachId,
      required this.planStatusList,
      required this.planTypeId,
      required this.searchTextEditingController,
      required this.setCoachId,
      required this.setStudentId,
      required this.sizeScreen,
      required this.studentId})
      : super(key: key);
  final Size sizeScreen;
  final TextEditingController searchTextEditingController;
  final int? planTypeId;
  final int? coachId;
  final int? studentId;
  final String? planStatusList;
  final bool? setCoachId;
  final bool? setStudentId;

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late int itemSelected;
  @override
  void initState() {
    itemSelected = 1;
    widget.searchTextEditingController.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              color: kColorBackGround,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          child: Container(
            padding:
                EdgeInsets.symmetric(horizontal: widget.sizeScreen.width * 0.1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: padding,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffE8E8E8),
                      borderRadius: BorderRadius.circular(10)),
                  width: widget.sizeScreen.width * 0.1,
                  height: 5,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: padding),
                  child: Center(
                    child: Text(
                      'جستجوی فیلتر',
                      style: textStyle.copyWith(
                          fontSize:
                              kFontSizeText(widget.sizeScreen, FontSize.title),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: padding),
                  child: TextField(
                      controller: widget.searchTextEditingController,
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
                            kFontSizeText(widget.sizeScreen, FontSize.title)),
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
                      sizeScreen: widget.sizeScreen,
                      title: 'جستجو',
                      onTap: () {
                        BlocProvider.of<GetPlansBySortBloc>(context).add(
                            GetPlansBySortLoadingEvent(
                                searchText:
                                    widget.searchTextEditingController.text,
                                planType: widget.planTypeId,
                                coachId: widget.coachId,
                                studentId: widget.studentId,
                                planStatusList: itemSelected.toString(),
                                setCoachId: widget.setCoachId,
                                setStudentId: widget.setStudentId));
                        Navigator.of(context).pop();
                      }),
                )
              ],
            ),
          ),
        ),
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
    'selected': 1,
  },
  {
    'name': 'شروع نشده',
    'selected': 2,
  },
  {
    'name': 'تمام شده',
    'selected': 3,
  },
  {
    'name': 'پرداخت نشده',
    'selected': 4,
  },
];
