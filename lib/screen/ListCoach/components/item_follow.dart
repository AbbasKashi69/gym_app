import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_app/ViewModels/CoachStudent/CoachStudentVm.dart';
import 'package:gym_app/blocs/CoachStudent/bloc/get_student_coaches_bloc.dart';
import 'package:gym_app/blocs/CoachStudent/bloc/request_to_coach_bloc.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/myWaiting.dart';
import 'package:gym_app/screen/ListCoach/components/warning_unFollow_screen.dart';
import 'package:gym_app/screen/ProfileCoach/profile_coach_page.dart';

class ItemFollow extends StatefulWidget {
  const ItemFollow({
    Key? key,
    required this.coachStudentVm,
    required this.sizeScreen,
  }) : super(key: key);

  final Size sizeScreen;
  final CoachStudentVm coachStudentVm;

  @override
  _ItemFollowState createState() => _ItemFollowState();
}

class _ItemFollowState extends State<ItemFollow> {
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {
          dynamic check = await Navigator.of(context).pushNamed(
              ProfileCoachPage.routeName,
              arguments: widget.coachStudentVm);
          if (check != null && check)
            BlocProvider.of<GetStudentCoachesBloc>(context)
                .add(GetStudentCoachesLoadingEvent());
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: padding),
          margin: EdgeInsets.symmetric(vertical: padding),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: CircleAvatar(
                    radius: widget.sizeScreen.width > 550 ? 30 : 20,
                    backgroundImage:
                        NetworkImage(widget.coachStudentVm.coachPic ?? ""),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    widget.coachStudentVm.coachFullName ?? "",
                    maxLines: 1,
                    style: textStyle.copyWith(
                        fontSize: kFontSizeText(sizeScreen, FontSize.subTitle)),
                  ),
                ),
              ),
              Expanded(
                  flex: 5,
                  child: BlocConsumer<RequestToCoachBloc, RequestToCoachState>(
                    listener: (context, state) {
                      if (state is RequestToCoachLoadedState) {
                        if (state.resultObject != null) {
                          if (state.resultObject!.success! &&
                              state.coachId == widget.coachStudentVm.coachId)
                            setState(() {
                              widget.coachStudentVm.status =
                                  state.resultObject!.id;
                            });
                          Fluttertoast.showToast(
                              msg: state.resultObject!.message!);
                        }
                      }
                    },
                    builder: (context, state) {
                      if (state is RequestToCoachLoadingState) if (state
                              .coachId ==
                          widget.coachStudentVm.coachId)
                        return Container(
                          width: sizeScreen.width * 0.3,
                          child: Center(child: MyWaiting()),
                        );
                      else
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            onTap: () async {
                              if (widget.coachStudentVm.status == 2) {
                                var result = await WarningUnFollowScreen()
                                    .warningUnFollow(
                                        context,
                                        widget.sizeScreen,
                                        widget.coachStudentVm.coachFullName ??
                                            "");
                                if (result) {
                                  BlocProvider.of<RequestToCoachBloc>(context)
                                      .add(RequestToCoachLoadingEvent(
                                          coachId:
                                              widget.coachStudentVm.coachId));
                                }
                              } else if (widget.coachStudentVm.status == 3) {
                                BlocProvider.of<RequestToCoachBloc>(context)
                                    .add(RequestToCoachLoadingEvent(
                                        coachId:
                                            widget.coachStudentVm.coachId));
                              }
                            },
                            child: Container(
                              // constraints: BoxConstraints(maxWidth: 200, minWidth: 150),
                              width: sizeScreen.width * 0.3,
                              decoration: ShapeDecoration(
                                gradient: LinearGradient(
                                    colors: widget.coachStudentVm.status == 2
                                        ? [Color(0xff00B4D8), Color(0xff48CAE4)]
                                        : widget.coachStudentVm.status == 3
                                            ? [Colors.white, Colors.white]
                                            : [Colors.white, Colors.black]),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: Color(0xff00B4D8))),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Center(
                                child: Text(
                                  widget.coachStudentVm.status == 2
                                      ? 'لغو دنبال کردن'
                                      : widget.coachStudentVm.status == 3
                                          ? 'دنبال کردن'
                                          : 'درحال انتظار',
                                  style: textStyle.copyWith(
                                    fontSize: kFontSizeText(
                                        widget.sizeScreen, FontSize.subTitle),
                                    color: widget.coachStudentVm.status == 2
                                        ? Color(0xffffffff)
                                        : widget.coachStudentVm.status == 3
                                            ? Color(0xff00B4D8)
                                            : Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () async {
                            if (widget.coachStudentVm.status == 2) {
                              var result = await WarningUnFollowScreen()
                                  .warningUnFollow(
                                      context,
                                      widget.sizeScreen,
                                      widget.coachStudentVm.coachFullName ??
                                          "");
                              if (result) {
                                BlocProvider.of<RequestToCoachBloc>(context)
                                    .add(RequestToCoachLoadingEvent(
                                        coachId:
                                            widget.coachStudentVm.coachId));
                              }
                            } else if (widget.coachStudentVm.status == 3) {
                              BlocProvider.of<RequestToCoachBloc>(context).add(
                                  RequestToCoachLoadingEvent(
                                      coachId: widget.coachStudentVm.coachId));
                            }
                          },
                          child: Container(
                            // constraints: BoxConstraints(maxWidth: 200, minWidth: 150),
                            width: sizeScreen.width * 0.3,
                            decoration: ShapeDecoration(
                              gradient: LinearGradient(
                                  colors: widget.coachStudentVm.status == 2
                                      ? [Color(0xff00B4D8), Color(0xff48CAE4)]
                                      : widget.coachStudentVm.status == 3
                                          ? [Colors.white, Colors.white]
                                          : [Colors.white, Colors.white]),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(color: Color(0xff00B4D8))),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Center(
                              child: Text(
                                widget.coachStudentVm.status == 2
                                    ? 'لغو دنبال کردن'
                                    : widget.coachStudentVm.status == 3
                                        ? 'دنبال کردن'
                                        : 'منتظر تایید مربی',
                                style: textStyle.copyWith(
                                  fontSize: kFontSizeText(
                                      widget.sizeScreen, FontSize.subTitle),
                                  color: widget.coachStudentVm.status == 2
                                      ? Color(0xffffffff)
                                      : widget.coachStudentVm.status == 3
                                          ? Color(0xff00B4D8)
                                          : Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
