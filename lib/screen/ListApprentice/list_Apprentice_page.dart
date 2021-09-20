import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/ViewModels/CoachStudent/CoachStudentVm.dart';
import 'package:gym_app/ViewModels/Person/PersonListVm.dart';
import 'package:gym_app/blocs/CoachStudent/bloc/get_coach_students_bloc.dart';
import 'package:gym_app/blocs/CoachStudent/bloc/get_students_as_person_list_bloc.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/customeTextField.dart';
import 'package:gym_app/components/myWaiting.dart';
import 'package:gym_app/components/no_data.dart';
import 'package:gym_app/screen/ListApprentice/requests_page.dart';

class ListApprenticePage extends StatefulWidget {
  const ListApprenticePage({Key? key}) : super(key: key);
  static const routeName = '/ListApprenticePage';

  @override
  _ListApprenticePageState createState() => _ListApprenticePageState();
}

class _ListApprenticePageState extends State<ListApprenticePage> {
  late TextEditingController _searchTextEditingController;
  @override
  void initState() {
    super.initState();
    _searchTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _searchTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Container(
      color: Color(0xffFBFBFB),
      // color: Color(0xffaaaaaa),
      child: Scaffold(
        appBar: AppBarWidget(
          title: 'لیست شاگردان',
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(minHeight: sizeScreen.height - 80),
            padding: EdgeInsets.symmetric(horizontal: padding),
            decoration: kBodyDecoration,
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(vertical: padding * 2),
                    child: CustomeTextField(
                      onChange: (String value) {
                        BlocProvider.of<GetStudentsAsPersonListBloc>(context)
                            .add(GetStudentsAsPersonListLoadingEvent(
                                searchText: _searchTextEditingController.text));
                      },
                      hintText: 'جستجوی شاگرد',
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.search,
                      textEditingController: _searchTextEditingController,
                    )),
                Material(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(RequestsPage.routeName);
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 3,
                          height: sizeScreen.width > 550 ? 60 : 40,
                          color: Color(0xff48CAE4),
                        ),
                        SizedBox(
                          width: padding,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            BlocBuilder<GetCoachStudentsBloc,
                                GetCoachStudentsState>(
                              builder: (context, state) {
                                if (state is GetCoachStudentsLoadingState)
                                  return Container(
                                    width: 10,
                                    height: 10,
                                    child: MyWaiting(),
                                  );
                                else if (state is GetCoachStudentsLoadedState) {
                                  if (state.page_coachStudentVm != null &&
                                      state.page_coachStudentVm!.items!
                                          .isNotEmpty) {
                                    return Container(
                                      child: Stack(
                                          children: List.generate(
                                              state.page_coachStudentVm!.items!
                                                          .length >
                                                      3
                                                  ? 3
                                                  : state.page_coachStudentVm!
                                                      .items!.length,
                                              (index) => ItemRequestInStack(
                                                  index: index,
                                                  sizeScreen: sizeScreen,
                                                  coachStudentVm: state
                                                      .page_coachStudentVm!
                                                      .items![index]))),
                                    );
                                  }
                                  return NoData();
                                } else
                                  return Container();
                              },
                            ),
                            SizedBox(
                              width: padding,
                            ),
                            Text(
                              'درخواست ها',
                              style: textStyle,
                            )
                          ],
                        ),
                        Spacer(),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0x50FF003D),
                              size: 10,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0x70FF003D),
                              size: 10,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xffFF003D),
                              size: 10,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(vertical: padding * 2),
                  child: Text(
                    'شاگردان',
                    style: textStyle,
                  ),
                ),
                BlocBuilder<GetStudentsAsPersonListBloc,
                    GetStudentsAsPersonListState>(
                  builder: (context, state) {
                    if (state is GetStudentsAsPersonListLoadingState)
                      return MyWaiting();
                    else if (state is GetStudentsAsPersonListLoadedState) {
                      if (state.listPersonListVm != null &&
                          state.listPersonListVm!.isNotEmpty) {
                        return Column(
                          children: List.generate(
                            state.listPersonListVm!.length,
                            (index) => ItemApprenticeList(
                                personListVm: state.listPersonListVm![index]),
                          ),
                        );
                      } else
                        return NoData();
                    }
                    return Container();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ItemRequestInStack extends StatelessWidget {
  const ItemRequestInStack({
    Key? key,
    required this.coachStudentVm,
    required this.sizeScreen,
    required this.index,
  }) : super(key: key);

  final Size sizeScreen;
  final CoachStudentVm coachStudentVm;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          right: sizeScreen.width > 550 ? index * 40 : index * 30),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: CircleAvatar(
        radius: sizeScreen.width > 550 ? 30 : 20,
        backgroundImage: NetworkImage(coachStudentVm.studentPic!),
      ),
    );
  }
}

class ItemApprenticeList extends StatelessWidget {
  const ItemApprenticeList({Key? key, required this.personListVm})
      : super(key: key);
  final PersonListVm personListVm;

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(personListVm.pic ??
                'https://i.pinimg.com/564x/5b/40/87/5b4087d0fc8d9d372c00a32bc08f818c.jpg'),
          ),
          SizedBox(
            width: padding,
          ),
          Text(
            personListVm.userFullName ?? "",
            style: textStyle.copyWith(
                fontSize: kFontSizeText(sizeScreen, FontSize.subTitle)),
          )
        ],
      ),
    );
  }
}
