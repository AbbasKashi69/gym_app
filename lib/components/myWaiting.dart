import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MyWaiting extends StatelessWidget {
  const MyWaiting({Key? key, this.size}) : super(key: key);
  final double? size;

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Container(
      child: Center(
          child: SpinKitThreeBounce(
        color: Color.fromRGBO(60, 198, 226, 1),
        size: size == null ? sizeScreen.height * 0.0285 : size ?? 1,
      )),
    );
  }
}
