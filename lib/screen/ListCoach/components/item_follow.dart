import 'package:flutter/material.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/screen/ListCoach/components/warning_unFollow_screen.dart';
import 'package:gym_app/screen/ProfileCoach/profile_coach_page.dart';

class ItemFollow extends StatefulWidget {
  const ItemFollow({
    Key? key,
    required this.data,
    required this.sizeScreen,
  }) : super(key: key);

  final Size sizeScreen;
  final dynamic data;

  @override
  _ItemFollowState createState() => _ItemFollowState();
}

class _ItemFollowState extends State<ItemFollow> {
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ProfileCoachPage.routeName);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: padding),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.centerRight,
                child: CircleAvatar(
                  radius: widget.sizeScreen.width > 550 ? 30 : 20,
                  backgroundImage: NetworkImage(widget.data['pic']),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(
                  widget.data['name'],
                  maxLines: 1,
                  style: textStyle.copyWith(
                      fontSize: kFontSizeText(sizeScreen, FontSize.subTitle)),
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () async {
                      if (widget.data['followedByMe']) {
                        var result = await WarningUnFollowScreen()
                            .warningUnFollow(
                                context, widget.sizeScreen, widget.data);
                        if (result)
                          setState(() {
                            widget.data['followedByMe'] = false;
                          });
                      } else
                        setState(() {
                          widget.data['followedByMe'] = true;
                        });
                    },
                    child: Container(
                      // constraints: BoxConstraints(maxWidth: 200, minWidth: 150),
                      width: sizeScreen.width * 0.3,
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                            colors: widget.data['followedByMe']
                                ? [Color(0xff00B4D8), Color(0xff48CAE4)]
                                : [Colors.white, Colors.white]),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Color(0xff00B4D8))),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Center(
                        child: Text(
                          widget.data['followedByMe']
                              ? 'لغو دنبال کردن'
                              : 'دنبال کردن',
                          style: textStyle.copyWith(
                            fontSize: kFontSizeText(
                                widget.sizeScreen, FontSize.subTitle),
                            color: widget.data['followedByMe']
                                ? Color(0xffffffff)
                                : Color(0xff00B4D8),
                          ),
                        ),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
