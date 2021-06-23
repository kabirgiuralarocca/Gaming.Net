import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginpage/constants.dart';
import 'package:loginpage/widgets/CancelButton.dart';
import 'package:loginpage/widgets/LoginForm.dart';
import 'package:loginpage/widgets/RegisterForm.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {

  bool isLogin = true; // Login Form | Register form

  late Animation<double> containerSize; // Animazione per il container del form
  late AnimationController animationController; // controller animazione
  Duration animationDuration = Duration(milliseconds: 270); // durata animazione

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);

    // inizializzare controller
    animationController = AnimationController(
      vsync: this, // richiama il widget 
      duration: animationDuration // specifica la durata
    );
  }

  @override
  void dispose() {
    // distrugge il controller insieme al widget
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size; // dimensione contenuto

    // per determinare se la keyboard è aperta
    double viewInset = MediaQuery.of(context).viewInsets.bottom;

    double defaultLoginSize = size.height - (size.height * 0.2); //altezza login form
    double defaultRegisterSize = size.height - (size.height * 0.1); // altezza register form

    // valori animazione
    containerSize = Tween<double>(
      begin: size.height * 0.1, 
      end: defaultRegisterSize).animate( // animazione
        CurvedAnimation(
          parent: animationController, 
          curve: Curves.linear // dissolvenza
        )
      );

    return Scaffold(
      body: Stack(
        children: [
          // Cancel Button
          CancelButton(
            isLogin: isLogin,
            animationDuration: animationDuration,
            size: size,
            animationController: animationController,
            tapEvent: () {
              if (!isLogin) {
                animationController.reverse(); // inverte i valori dell'animazione
                setState(() {
                  isLogin = !isLogin;
                });
              }
            },
          ),

          // Login Form
          LoginForm(
              isLogin: isLogin,
              animationDuration: animationDuration * 2,
              size: size,
              defaultLoginSize: defaultLoginSize),

          // Register Container
          AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              // keyboard
              if (viewInset == 0 && isLogin) {
                return buildRegisterContainer();
              } else if (!isLogin) {
                return buildRegisterContainer();
              }

              // Return an empty container to hide the widget
              return Container();
            },
          ),

          // Register form
          RegisterForm(
              isLogin: isLogin,
              animationDuration: animationDuration * 2,
              size: size,
              defaultLoginSize: defaultLoginSize),
        ],
      ),
    );
  }

  Widget buildRegisterContainer() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: !isLogin
            ? null
            : () {
                animationController.forward(); // fa partire l'animazione
                setState(() {
                  isLogin = !isLogin;
                });
              },
        child: Container(
          width: double.infinity,
          height: containerSize.value,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100),
                topRight: Radius.circular(100),
              ),
              color: kPrimaryColor.withAlpha(30)),
          alignment: Alignment.center,
          child: isLogin
              ? Text(
                  "Don't have an account? Sign up",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
