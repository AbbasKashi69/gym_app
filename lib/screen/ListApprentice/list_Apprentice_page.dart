import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gym_app/ViewModels/Person/PersonListVm.dart';
import 'package:gym_app/blocs/CoachStudent/bloc/get_students_as_person_list_bloc.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/myWaiting.dart';
import 'package:gym_app/components/no_data.dart';
import 'package:gym_app/extensions/ext.dart';

class ListApprenticePage extends StatelessWidget {
  const ListApprenticePage({Key? key}) : super(key: key);
  static const routeName = '/ListApprenticePage';

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
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: padding),
          decoration: kBodyDecoration,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: padding * 2),
                child: TextField(
                    decoration: InputDecoration(
                        hintText: 'جستجوی شاگردان',
                        hintStyle: textStyle.copyWith(
                            color: Color(0xff707070), fontSize: 12),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide(color: Color(0xff707070))))),
              ),
              Row(
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
                      Container(
                        child: Stack(
                            children: List.generate(
                                listItemRequestInStackVm.length,
                                (index) => ItemRequestInStack(
                                    sizeScreen: sizeScreen,
                                    itemRequestInStackVm:
                                        listItemRequestInStackVm[index]))),
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
                      return Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) => ItemApprenticeList(
                              personListVm: state.listPersonListVm![index]),
                          itemCount: state.listPersonListVm!.length,
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
    );
  }
}

class ItemRequestInStack extends StatelessWidget {
  const ItemRequestInStack({
    Key? key,
    required this.itemRequestInStackVm,
    required this.sizeScreen,
  }) : super(key: key);

  final Size sizeScreen;
  final ItemRequestInStackVm itemRequestInStackVm;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: itemRequestInStackVm.marginRight),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: CircleAvatar(
        radius: sizeScreen.width > 550 ? 30 : 20,
        backgroundImage: NetworkImage(itemRequestInStackVm.image!),
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

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  AppBarWidget({this.title});
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return AppBar(
      automaticallyImplyLeading: false,
      brightness: Brightness.light,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      actions: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: padding * 2),
          width: sizeScreen.width,
          color: parseColor('#FBFBFB'),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child: Container(
                child: Text(
                  title!,
                  style: textStyle.copyWith(fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                ),
              )),
              SizedBox(
                width: padding / 2,
              ),
              GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: SvgPicture.asset(
                    'assets/icons/backIcon.svg',
                    width: sizeScreen.width > 550 ? 40 : 25,
                    height: sizeScreen.width > 550 ? 40 : 25,
                  )
                  // child: Container(),
                  )
            ],
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class ItemRequestInStackVm {
  final String? image;
  final double marginRight;
  ItemRequestInStackVm({this.image, this.marginRight = 1});
}

List<ItemRequestInStackVm> listItemRequestInStackVm = [
  ItemRequestInStackVm(
    image:
        'https://i.pinimg.com/474x/18/48/f5/1848f52697ad28896248b6af0839b39a.jpg',
  ),
  ItemRequestInStackVm(
      image:
          'https://i.pinimg.com/564x/5b/40/87/5b4087d0fc8d9d372c00a32bc08f818c.jpg',
      marginRight: 35),
  ItemRequestInStackVm(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiLA28J7m4Jbacks8ceGZoQC-QgRLqbje9nA&usqp=CAU',
      marginRight: 70),
];
