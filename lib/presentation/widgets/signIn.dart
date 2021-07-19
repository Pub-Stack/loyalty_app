//import 'package:bonus_app/presentation/pages/profile.dart';
import 'package:bonus_app/domain/logic.dart';
//import 'package:bonus_app/domain/models.dart';
//import 'package:bonus_app/presentation/pages/cabinet.dart';
import 'package:flutter/material.dart';

class SingInWidget extends StatefulWidget {
  @override
  _SingInWidgetState createState() => _SingInWidgetState();
}

class _SingInWidgetState extends State<SingInWidget> {
  final _loginController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var h = MediaQuery.of(context).size.height;

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            controller: _loginController,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                hintText: 'Enter valid email'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Enter secure password'),
          ),
        ),
        // ListView.builder(
        //     //itemCount: list.,
        //     itemBuilder: (context, index) {
        //   list = Logic.getAllUsers();
        //   return;
        // }),
        SizedBox(
          height: 16,
        ),
        Container(
          height: 50,
          width: 250,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
          ),
          child: MaterialButton(
            onPressed: () {
              var user = Logic.getUser(_loginController.text);
              if (user == '' || user.password != _passwordController.text) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text('No such user. Please register')));
              } else {
                Logic.currentUser = user;
                Navigator.pushReplacementNamed(context, '/cabinet');
              }
            },
            child: Text(
              'Login',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
      ],
    );
  }
}
