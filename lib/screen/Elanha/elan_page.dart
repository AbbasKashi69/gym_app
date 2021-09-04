import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/customeTextField.dart';
import 'package:gym_app/screen/DetailElan/detail_elan_page.dart';
import 'package:gym_app/screen/ListApprentice/list_Apprentice_page.dart';

class ElanPage extends StatelessWidget {
  const ElanPage({Key? key}) : super(key: key);
  static const routeName = '/elanPage';

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWidget(
        title: 'اعلان ها',
      ),
      body: Container(
        decoration: kBodyDecoration,
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: sizeScreen.width,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: CustomeTextField(
                    hintText: 'جستجو',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) =>
                        ItemElan(data: listElan[index]),
                    itemCount: listElan.length,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List listElan = [
  {'title': 'کاهش حساب', 'nCreationDate': '95/3/23-11:50', 'isReaded': true},
  {
    'title': 'خرید اشتراک دو ماهه انجام شد',
    'nCreationDate': '90/6/23-21:50',
    'isReaded': false
  },
  {
    'title':
        ' با تشکر از رفتار محترمانه ی شما برداشت از حساب شما به مبلغ 120،000 تومان انجام شد',
    'nCreationDate': '00/3/23-21:50',
    'isReaded': false
  },
  {
    'title': 'فاکتور خرید از بوفه',
    'nCreationDate': '00/3/13-20:50',
    'isReaded': true
  },
];

class ItemElan extends StatefulWidget {
  const ItemElan({Key? key, required this.data}) : super(key: key);
  final dynamic data;

  @override
  _ItemElanState createState() => _ItemElanState();
}

class _ItemElanState extends State<ItemElan> {
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () async {
        await Navigator.of(context).pushNamed(DetailElanPage.routeName);
        if (!widget.data['isReaded']) {
          setState(() {
            widget.data['isReaded'] = true;
          });
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.symmetric(vertical: padding),
        child: Row(
          children: [
            Expanded(
                child: Row(
              children: [
                SvgPicture.asset(
                  widget.data['isReaded']
                      ? 'assets/icons/readElan.svg'
                      : 'assets/icons/notReadElan.svg',
                  width: kFontSizeText(sizeScreen, FontSize.title) + 15,
                ),
                SizedBox(
                  width: padding,
                ),
                Flexible(
                    child: Text(
                  widget.data['title'],
                  style: textStyle.copyWith(
                      fontSize: kFontSizeText(sizeScreen, FontSize.subTitle)),
                  overflow: TextOverflow.ellipsis,
                ))
              ],
            )),
            SizedBox(
              width: padding,
            ),
            Text(
              widget.data['nCreationDate'],
              style: textStyle.copyWith(
                  fontSize: kFontSizeText(sizeScreen, FontSize.subTitle)),
            )
          ],
        ),
      ),
    );
  }
}
