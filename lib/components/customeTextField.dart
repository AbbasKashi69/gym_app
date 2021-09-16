import 'package:flutter/material.dart';

import 'constant.dart';

class CustomeTextField extends StatelessWidget {
  const CustomeTextField(
      {Key? key,
      this.hintText,
      this.textEditingController,
      this.validator,
      this.onSubmited,
      this.textInputAction = TextInputAction.next,
      this.keyboardType = TextInputType.name,
      this.isEnable = true,
      this.isHaveIcon = false,
      this.isReadOnly = false})
      : super(key: key);
  final String? hintText;
  final bool isHaveIcon;
  final bool isReadOnly;
  final bool isEnable;
  final TextEditingController? textEditingController;
  final Function? validator;
  final Function? onSubmited;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return TextFormField(
      validator: (String? value) {
        return validator!(value);
      },
      onFieldSubmitted: (String value) {
        return onSubmited!(value);
      },
      controller: textEditingController,
      enabled: isEnable,
      readOnly: isReadOnly,
      decoration: kInputDecorationTextField.copyWith(
          suffix: isHaveIcon
              ? Padding(
                  padding: EdgeInsets.only(left: padding, top: 5),
                  child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.add,
                      size: kFontSizeText(sizeScreen, FontSize.title) + 4,
                    ),
                  ),
                )
              : SizedBox(),
          prefix: isHaveIcon
              ? Padding(
                  padding: EdgeInsets.only(right: padding, top: 5),
                  child: InkWell(
                    onTap: () {},
                    child: Icon(Icons.remove,
                        size: kFontSizeText(sizeScreen, FontSize.title) + 4),
                  ),
                )
              : SizedBox(),
          hintStyle: textStyle.copyWith(
              fontSize: kFontSizeText(sizeScreen, FontSize.subTitle),
              color: kHintText),
          hintText: hintText),
      style: textStyle.copyWith(
        fontSize: kFontSizeText(
          sizeScreen,
          FontSize.subTitle,
        ),
      ),
      textAlign: isHaveIcon ? TextAlign.center : TextAlign.right,
    );
  }
}
