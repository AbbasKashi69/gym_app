import 'package:flutter/material.dart';
import 'package:gym_app/extensions/ext.dart';

class CustomSwitch extends StatefulWidget {
  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  bool isChecked = false;
  Duration _duration = Duration(milliseconds: 370);
  late Animation<Alignment> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: _duration);

    _animation =
        AlignmentTween(begin: Alignment.centerLeft, end: Alignment.centerRight)
            .animate(
      CurvedAnimation(
          parent: _animationController,
          curve: Curves.bounceOut,
          reverseCurve: Curves.bounceIn),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Container(
          width: 110,
          height: 50,
          padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
          decoration: BoxDecoration(
              color: isChecked ? parseColor('#CAF0F8') : parseColor('#E6E6E6'),
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
              boxShadow: [
                BoxShadow(
                    color: isChecked ?  parseColor('#CAF0F8') : parseColor('#E6E6E6'),
                    blurRadius: 12,
                    offset: Offset(0, 8))
              ]),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: _animation.value,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_animationController.isCompleted) {
                        _animationController.reverse();
                      } else {
                        _animationController.forward();
                      }

                      isChecked = !isChecked;
                    });
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isChecked ? parseColor('#48CAE4') : Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
