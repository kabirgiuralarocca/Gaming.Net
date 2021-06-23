import 'package:flutter/material.dart';
import 'package:loginpage/constants.dart';
import 'package:loginpage/widgets/InputContainer.dart';

class RoundedInput extends StatelessWidget {
  const RoundedInput({
    Key? key,
    required this.icon,
    required this.hint,
    required this.color
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      color: color,
      child: TextField(
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hint,
          border: InputBorder.none
        ),
      ),
    );
  }
}

