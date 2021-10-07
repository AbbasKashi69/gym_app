import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/blocs/CoachStudent/bloc/get_student_coaches_bloc.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/myWaiting.dart';
import 'package:gym_app/components/no_data.dart';

import 'components/item_follow.dart';

// List<int>? listItemHelper = [];

class ListCoachPage extends StatelessWidget {
  const ListCoachPage({Key? key}) : super(key: key);
  static const routeName = '/ListCoachPage';

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Container(
      color: Color(0xffFBFBFB),
      // color: Color(0xffaaaaaa),
      child: Scaffold(
        appBar: AppBarWidget(
          title: 'لیست مربیان',
        ),
        backgroundColor: Colors.transparent,
        body: Container(
            height: sizeScreen.height,
            width: sizeScreen.width,
            padding: EdgeInsets.symmetric(horizontal: padding),
            decoration: kBodyDecoration,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      'مربیان',
                      style: textStyle.copyWith(
                          fontSize: kFontSizeText(sizeScreen, FontSize.title),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  BlocBuilder<GetStudentCoachesBloc, GetStudentCoachesState>(
                    // listener: (context, state) {
                    //   if (state is GetStudentCoachesLoadedState) {
                    //     if (state.listCoachStudentVm != null &&
                    //         state.listCoachStudentVm!.isNotEmpty) {
                    //       state.listCoachStudentVm!.forEach((element) {
                    //         listItemHelper!.add(element.status!);
                    //       });
                    //     }
                    //   }
                    // },
                    builder: (context, state) {
                      if (state is GetStudentCoachesLoadingState)
                        return MyWaiting();
                      else if (state is GetStudentCoachesLoadedState) {
                        if (state.listCoachStudentVm != null &&
                            state.listCoachStudentVm!.isNotEmpty)
                          return ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: (ctx, idx) => ItemFollow(
                                sizeScreen: sizeScreen,
                                coachStudentVm: state.listCoachStudentVm![idx]),
                            itemCount: state.listCoachStudentVm!.length,
                          );
                        else
                          return Center(child: NoData());
                      }
                      return Container();
                    },
                  )
                ],
              ),
            )),
      ),
    );
  }
}
