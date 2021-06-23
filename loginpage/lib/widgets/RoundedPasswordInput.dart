import 'package:flutter/material.dart';
import 'package:loginpage/constants.dart';
import 'package:loginpage/widgets/InputContainer.dart';

class RoundedPasswordInput extends StatelessWidget {
  const RoundedPasswordInput({
    Key? key,
    required this.hint,
    required this.color
  }) : super(key: key);

  final String hint;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      color: color,
      child: TextField(
        cursorColor: kPrimaryColor,
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          hintText: hint,
          border: InputBorder.none
        ),
      ),
    );
  }
}

