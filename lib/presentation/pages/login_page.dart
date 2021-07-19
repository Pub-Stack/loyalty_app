import 'package:bonus_app/presentation/widgets/signIn.dart';
import 'package:bonus_app/presentation/widgets/signUp.dart';
import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool singUp = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Center(
              child: Container(
                  width: 200,
                  height: 150,
                  /*decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50.0)),*/
                  child: Image.asset('asset/images/flutter-logo.png')),
            ),
          ),
          singUp ? SingUpWidget() : SingInWidget(),
          MaterialButton(
              child: Text(singUp ? 'Sign In' : 'Sing Up'),
              onPressed: () {
                setState(() {
                  singUp = !singUp;
                });
              }),
          MaterialButton(
            color: Colors.grey,
            child: Text('Test User John Doe'),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/cabinet');
            },
          )
        ],
      ),
    ));
  }
}
