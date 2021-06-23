import 'package:flutter/material.dart';
import 'package:loginpage/constants.dart';
import 'package:loginpage/widgets/RoundedButton.dart';
import 'package:loginpage/widgets/RoundedInput.dart';
import 'package:loginpage/widgets/RoundedPasswordInput.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
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
      opacity: !isLogin ? 0 : 1,
      duration: animationDuration * 2,
      child: Visibility(
        visible: isLogin,
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
                    'Welcome Back',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  SizedBox(height: 40),
                  Image.asset(
                    'assets/images/gamingnet-logo.png',
                    scale: 2.5,
                  ),
                  SizedBox(height: 40),
                  RoundedInput(color: kPrimaryColor.withAlpha(30), icon: Icons.person, hint: 'Username'),
                  RoundedPasswordInput(color: kPrimaryColor.withAlpha(30), hint: 'Password'),
                  SizedBox(height: 10),
                  RoundedButton(tittle: 'LOGIN'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}