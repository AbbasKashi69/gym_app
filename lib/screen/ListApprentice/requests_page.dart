import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_app/ViewModels/CoachStudent/CoachStudentVm.dart';
import 'package:gym_app/blocs/CoachStudent/bloc/change_status_bloc.dart';
import 'package:gym_app/blocs/CoachStudent/bloc/get_coach_students_bloc.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/myWaiting.dart';
import 'package:gym_app/components/no_data.dart';
import 'package:gym_app/screen/ProfileApprentice/profile_apprentice_page.dart';

import 'components/item_reject_answer.dart';

class RequestsPage extends StatefulWidget {
  const RequestsPage({Key? key}) : super(key: key);
  static const routeName = '/requests';

  @override
  _RequestsPageState createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  late ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController()..addListener(_listener);
    super.initState();
  }

  _listener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      BlocProvider.of<GetCoachStudentsBloc>(context)
        ..add(GetCoachStudentsLoadedEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Container(
      // color: Color(0xffffffff),
      color: Color(0xffFBFBFB),
      child: Scaffold(
        appBar: AppBarWidget(
          title: 'درخواست ها',
        ),
        backgroundColor: Colors.transparent,
        body: Container(
            width: sizeScreen.width,
            padding: EdgeInsets.symmetric(horizontal: padding),
            decoration: kBodyDecoration,
            child: BlocBuilder<GetCoachStudentsBloc, GetCoachStudentsState>(
              builder: (context, state) {
                if (state is GetCoachStudentsLoadingState)
                  return MyWaiting();
                else if (state is GetCoachStudentsLoadedState) {
                  if (state.page_coachStudentVm != null &&
                      state.page_coachStudentVm!.items!.isNotEmpty) {
                    return ListView.builder(
                      controller: _scrollController,
                      itemBuilder: (ctx, idx) {
                        if (idx < state.page_coachStudentVm!.items!.length)
                          return ItemRequest(
                              sizeScreen: sizeScreen,
                              coachStudentVm:
                                  state.page_coachStudentVm!.items![idx]);
                        else
                          return Center(child: MyWaiting());
                      },
                      itemCount: state.page_coachStudentVm!.hasNext!
                          ? state.page_coachStudentVm!.items!.length + 1
                          : state.page_coachStudentVm!.items!.length,
                    );
                  } else
                    return NoData();
                } else
                  return Container();
              },
            )),
      ),
    );
  }
}

class ItemRequest extends StatelessWidget {
  const ItemRequest({
    Key? key,
    required this.coachStudentVm,
    required this.sizeScreen,
  }) : super(key: key);

  final Size sizeScreen;
  final CoachStudentVm coachStudentVm;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(ProfileApprenticePage.routeName,
              arguments: coachStudentVm);
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: padding),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(right: padding),
                alignment: Alignment.centerRight,
                width: sizeScreen.width * 0.2,
                child: CircleAvatar(
                  radius: sizeScreen.width > 550 ? 30 : 20,
                  backgroundImage:
                      NetworkImage(coachStudentVm.studentPic ?? ""),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                width: sizeScreen.width * 0.4,
                child: Text(
                  coachStudentVm.studentFullName ?? "",
                  style: textStyle,
                ),
              ),
              Expanded(
                  child: Row(
                children: [
                  BlocConsumer<ChangeStatusBloc, ChangeStatusState>(
                    listener: (context, state) {
                      if (state is ChangeStatusLoadedState) {
                        if (state.resultObject != null) {
                          if (state.resultObject!.success!)
                            BlocProvider.of<GetCoachStudentsBloc>(context)
                                .add(GetCoachStudentsLoadingEvent());
                          Fluttertoast.showToast(
                              msg: state.resultObject!.message!);
                        }
                      }
                    },
                    builder: (context, state) {
                      if (state is ChangeStatusLoadingState) if (state.id ==
                          coachStudentVm.id)
                        return Container(
                          width: 10,
                          height: 10,
                          child: MyWaiting(),
                        );
                      else
                        return ItemRejectAnswer(
                          onTap: () {
                            BlocProvider.of<ChangeStatusBloc>(context).add(
                                ChangeStatusLoadingEvent(
                                    id: coachStudentVm.id,
                                    coachStudentId: coachStudentVm.id,
                                    isAccepted: false));
                          },
                          sizeScreen: sizeScreen,
                          isAnswer: false,
                        );
                      return ItemRejectAnswer(
                        onTap: () {
                          BlocProvider.of<ChangeStatusBloc>(context).add(
                              ChangeStatusLoadingEvent(
                                  id: coachStudentVm.id,
                                  coachStudentId: coachStudentVm.id,
                                  isAccepted: false));
                        },
                        sizeScreen: sizeScreen,
                        isAnswer: false,
                      );
                    },
                  ),
                  SizedBox(
                    width: padding,
                  ),
                  BlocConsumer<ChangeStatusBloc, ChangeStatusState>(
                    listener: (context, state) {
                      if (state is ChangeStatusLoadedState) {
                        if (state.resultObject != null) {
                          if (state.resultObject!.success!)
                            BlocProvider.of<GetCoachStudentsBloc>(context)
                                .add(GetCoachStudentsLoadingEvent());
                          Fluttertoast.showToast(
                              msg: state.resultObject!.message!);
                        }
                      }
                    },
                    builder: (context, state) {
                      if (state is ChangeStatusLoadingState) if (state.id ==
                          coachStudentVm.id)
                        return Container(
                          width: 10,
                          height: 10,
                          child: MyWaiting(),
                        );
                      else
                        return ItemRejectAnswer(
                          onTap: () {
                            BlocProvider.of<ChangeStatusBloc>(context).add(
                                ChangeStatusLoadingEvent(
                                    id: coachStudentVm.id,
                                    coachStudentId: coachStudentVm.id,
                                    isAccepted: false));
                          },
                          sizeScreen: sizeScreen,
                          isAnswer: false,
                        );
                      else
                        return ItemRejectAnswer(
                          onTap: () {
                            BlocProvider.of<ChangeStatusBloc>(context).add(
                                ChangeStatusLoadingEvent(
                                    id: coachStudentVm.id,
                                    coachStudentId: coachStudentVm.id,
                                    isAccepted: false));
                          },
                          sizeScreen: sizeScreen,
                          isAnswer: true,
                        );
                    },
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
