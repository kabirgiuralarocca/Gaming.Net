import 'package:flutter/material.dart';
import 'package:loginpage/constants.dart';
import 'package:loginpage/widgets/RoundedButton.dart';
import 'package:loginpage/widgets/RoundedInput.dart';
import 'package:loginpage/widgets/RoundedPasswordInput.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    Key? key,
    required this.isLogin,
    required this.animationDuration,
    required this.size,
    required this.defaultLoginSize,
  }) : super(key: key);

  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultLoginSize;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isLogin ? 0 : 1,
      duration: animationDuration * 2,
      child: Visibility(
        visible: !isLogin,
        child: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Container(
              width: size.width,
              height: defaultLoginSize,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  SizedBox(height: 40),
                  RoundedInput(color: kBackgroundColor, icon: Icons.person, hint: 'Username'),
                  RoundedInput(color: kBackgroundColor, icon: Icons.face_rounded, hint: 'Name'),
                  RoundedInput(color: kBackgroundColor, icon: Icons.face_rounded, hint: 'Surname'),
                  RoundedInput(color: kBackgroundColor, icon: Icons.mail, hint: 'Email'),
                  RoundedPasswordInput(color: kBackgroundColor, hint: 'Password'),
                  RoundedPasswordInput(color: kBackgroundColor, hint: 'Confirm Password'),
                  SizedBox(height: 10),
                  RoundedButton(tittle: 'SIGN UP'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}