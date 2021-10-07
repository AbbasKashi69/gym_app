import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym_app/ViewModels/UserFlow/userFlowChartVm.dart';
import 'package:gym_app/blocs/UserFlow/bloc/get_user_flow_chart_information_bloc.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/myWaiting.dart';
import 'package:gym_app/components/no_data.dart';

class ChartChageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserFlowChartInformationBloc,
        GetUserFlowChartInformationState>(
      builder: (context, state) {
        if (state is GetUserFlowChartInformationLoadingState)
          return Center(
            child: MyWaiting(),
          );
        else if (state is GetUserFlowChartInformationLoadedState) {
          if (state.listUserFlowChartVm != null &&
              state.listUserFlowChartVm!.isNotEmpty)
            return ItemLoaded(
              listUserFlowChartVm: state.listUserFlowChartVm!,
            );
          else
            return NoData();
        }
        return Container();
      },
    );
  }
}

List<String> listTime = ['یک ماهه', 'شش ماهه', 'سال گذشته', 'همه'];

class ItemLoaded extends StatefulWidget {
  const ItemLoaded({Key? key, required this.listUserFlowChartVm})
      : super(key: key);
  final List<UserFlowChartVm> listUserFlowChartVm;

  @override
  _ItemLoadedState createState() => _ItemLoadedState();
}

class _ItemLoadedState extends State<ItemLoaded> {
  int? itemSelected;
  late UserFlowChartVm userFlowChartVmSelected;
  @override
  void initState() {
    itemSelected = 0;
    userFlowChartVmSelected = widget.listUserFlowChartVm.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;

    return Container(
      child: Column(
        children: [
          Row(
            children: List.generate(
                listTime.length,
                (index) => Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            itemSelected = index;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: padding / 5),
                          padding: EdgeInsets.symmetric(
                              vertical: sizeScreen.width > 550
                                  ? padding
                                  : padding / 2),
                          decoration: ShapeDecoration(
                              color: itemSelected == index
                                  ? Color(0xff48CAE4)
                                  : kColorBackgroundItem,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(
                                      color: itemSelected == index
                                          ? Color(0xff48CAE4)
                                          : Color(0xffE1E1E1),
                                      style: BorderStyle.solid))),
                          child: Center(
                            child: Text(
                              listTime[index],
                              style: textStyle.copyWith(
                                  color: itemSelected == index
                                      ? Color(0xffffffff)
                                      : Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                    )),
          ),
          SizedBox(
            height: padding,
          ),
          Container(
            height: sizeScreen.height * 0.2,
            width: double.infinity,
            color: Colors.red,
          ),
          Container(
            margin: EdgeInsets.only(top: padding, bottom: padding * 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kColorBackgroundItem),
            padding: EdgeInsets.symmetric(
                vertical: padding, horizontal: padding / 2),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/dateBlack.svg',
                    ),
                    SizedBox(
                      width: padding,
                    ),
                    Text(
                      userFlowChartVmSelected.nCreationDate!.split(' ')[0],
                      style: textStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        text: TextSpan(
                            text: 'وزن : ',
                            style: textStyle.copyWith(
                                fontSize: kFontSizeText(
                                    sizeScreen, FontSize.subTitle),
                                fontWeight: FontWeight.w600),
                            children: [
                          TextSpan(
                            text: userFlowChartVmSelected.nWeight ?? "",
                            style: textStyle.copyWith(
                                fontSize: kFontSizeText(
                                    sizeScreen, FontSize.subTitle),
                                fontWeight: FontWeight.w400),
                          )
                        ])),
                    RichText(
                        text: TextSpan(
                            text: 'قد : ',
                            style: textStyle.copyWith(
                                fontSize: kFontSizeText(
                                    sizeScreen, FontSize.subTitle),
                                fontWeight: FontWeight.w600),
                            children: [
                          TextSpan(
                            text: userFlowChartVmSelected.nHeight ?? "",
                            style: textStyle.copyWith(
                                fontSize: kFontSizeText(
                                    sizeScreen, FontSize.subTitle),
                                fontWeight: FontWeight.w400),
                          )
                        ])),
                    RichText(
                        text: TextSpan(
                            text: 'BMI : ',
                            style: textStyle.copyWith(
                                fontSize: kFontSizeText(
                                    sizeScreen, FontSize.subTitle),
                                fontWeight: FontWeight.w600),
                            children: [
                          TextSpan(
                            text: userFlowChartVmSelected.nBmi ?? "",
                            style: textStyle.copyWith(
                                fontSize: kFontSizeText(
                                    sizeScreen, FontSize.subTitle),
                                fontWeight: FontWeight.w400),
                          )
                        ]))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
