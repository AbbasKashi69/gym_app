import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  const MyImage({Key? key, this.url, this.sizeImage = 20}) : super(key: key);
  final String? url;
  final double sizeImage;
  final String imageForNullUrl =
      'https://www.pngitem.com/pimgs/m/445-4457103_no-profile-picture-jpg-hd-png-download.png';
  // top line code is for whene url is null

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Image.network(
      url ?? imageForNullUrl,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
            child: Center(
          child: Image.asset(
            'assets/images/no_image.png',
            color: Color(0xffffffff),
            // height: 60,
            // width: 60,
            fit: BoxFit.cover,
          ),
        ));
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;

        return Container(
          // width: 50,
          // height: 50,
          child: Center(
            child: CircularProgressIndicator(
              backgroundColor: Color(0xff000055),
            ),
          ),
        );
        // You can use LinearProgressIndicator or CircularProgressIndicator instead
      },
    ));
  }
}
