import 'package:flutter/material.dart';
import 'package:loginpage/constants.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({
    Key? key,
    required this.isLogin,
    required this.animationDuration,
    required this.size,
    required this.animationController,
    required this.tapEvent,
  }) : super(key: key);

  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final AnimationController animationController;
  final GestureTapCallback tapEvent;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLogin ? false : true,
          child: AnimatedOpacity(
        opacity: isLogin ? 0 : 1,
        duration: animationDuration,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: size.width,
            height: size.height * 0.1,
            alignment: Alignment.bottomCenter,
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: tapEvent,
              color: kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
