import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/ViewModels/Person/PersonListVm.dart';
import 'package:gym_app/blocs/CoachStudent/bloc/get_students_as_person_list_bloc.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/myWaiting.dart';
import 'package:gym_app/components/no_data.dart';

class SelectStudentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: kColorBackGround,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: sizeScreen.width * 0.1),
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
            SizedBox(
              height: 20,
            ),
            Expanded(child: BlocBuilder<GetStudentsAsPersonListBloc,
                GetStudentsAsPersonListState>(
              builder: (context, state) {
                if (state is GetStudentsAsPersonListLoadingState)
                  return Center(
                    child: MyWaiting(),
                  );
                else if (state is GetStudentsAsPersonListLoadedState) {
                  if (state.listPersonListVm != null &&
                      state.listPersonListVm!.isNotEmpty) {
                    return ListView.separated(
                      separatorBuilder: (context, index) {
                        return Divider();
                      },
                      itemBuilder: (context, index) => ItemStudent(
                          personListVm: state.listPersonListVm![index]),
                      itemCount: state.listPersonListVm!.length,
                    );
                  } else
                    return Center(child: NoData());
                } else
                  return Container();
              },
            )),
          ],
        ),
      ),
    );
  }
}

class ItemStudent extends StatelessWidget {
  const ItemStudent({Key? key, required this.personListVm}) : super(key: key);
  final PersonListVm personListVm;

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 5),
        onTap: () {
          Navigator.of(context).pop(personListVm);
        },
        title: Text(
          personListVm.userFullName ?? "",
          style: textStyle.copyWith(
              fontSize: kFontSizeText(sizeScreen, FontSize.subTitle)),
        ),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
            personListVm.pic ?? "",
          ),
          radius: sizeScreen.width > 550 ? 35 : 23,
        ));
  }
}
