//import 'package:bonus_app/presentation/pages/cabinet.dart';
//import 'package:bonus_app/presentation/pages/profile.dart';
import 'package:bonus_app/domain/logic.dart';
import 'package:bonus_app/domain/models.dart';
import 'package:flutter/material.dart';

class SingUpWidget extends StatefulWidget {
  @override
  _SingUpWidgetState createState() => _SingUpWidgetState();
}

class _SingUpWidgetState extends State<SingUpWidget> {
  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  late User user;

  @override
  void dispose() {
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    _loginController.dispose();
    _nameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: _loginController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Login',
                  hintText: 'Enter login'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Login cannot be empty';
                } else if (value.length < 6) {
                  return 'Login must be at least 6 characters long ';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  hintText: 'Enter First Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Name cannot be empty';
                } else {
                  return null;
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: _lastNameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Last Name',
                  hintText: 'Enter Last Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Last Name cannot be empty';
                } else {
                  return null;
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number',
                  hintText: 'Enter Phone Number'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Phone Number cannot be empty';
                } else {
                  return null;
                }
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter secure password'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: _passwordConfirmController,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirm Password',
                  hintText: 'Enter secure password'),
              validator: (value) {
                if (value != _passwordController.text) {
                  return 'Password do not match!';
                }
                return null;
              },
            ),
          ),
          // MaterialButton(
          //   onPressed: () {},
          //   child: Text(
          //     'Forgot Password',
          //     style: TextStyle(color: Colors.blue, fontSize: 15),
          //   ),
          // ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            child: MaterialButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  var keys = Logic.getLogins();
                  //print(keys.length);
                  if (keys.contains(_loginController.text)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: const Text('User already exist')));
                    return;
                  }
                  user = User(
                      login: _loginController.text,
                      name: _nameController.text,
                      lastName: _lastNameController.text,
                      password: _passwordController.text,
                      phoneNumber: _phoneController.text);

                  Logic.saveUser(user);
                  Navigator.pushReplacementNamed(context, '/cabinet');
                }
              },
              child: Text(
                'Register',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
