import 'package:bonus_app/domain/logic.dart';
import 'package:bonus_app/domain/models.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditPage extends StatefulWidget {
  const EditPage({
    Key? key,
  }) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final _editFormKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _lastNameController;
  late TextEditingController _phoneController;

  late User user;
  @override
  void initState() {
    user = Logic.currentUser;
    _nameController = TextEditingController(text: user.name);
    _lastNameController = TextEditingController(text: user.lastName);
    _phoneController = TextEditingController(text: user.phoneNumber);
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _editFormKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  //initialValue: user.name,
                  controller: _nameController,
                  decoration: InputDecoration(
                      // border: OutlineInputBorder(),
                      labelText: 'Name',
                      hintText: 'Edit First Name'),
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
                  //initialValue: user.lastName,
                  controller: _lastNameController,
                  decoration: InputDecoration(
                      // border: OutlineInputBorder(),
                      labelText: 'Last Name',
                      hintText: 'Edit First Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Last name cannot be empty';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  //initialValue: user.phoneNumber,
                  controller: _phoneController,
                  decoration: InputDecoration(
                      // border: OutlineInputBorder(),
                      labelText: 'Phone number',
                      hintText: 'Enter First Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone cannot be empty';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              MaterialButton(
                color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.calendar_today),
                    SizedBox(
                      width: 10,
                    ),
                    user.dr == ''
                        ? Text('Добавить дату рождения ')
                        : Text(
                            'Редактировать дату рождения \n ${DateFormat('dd.MM.yyyy').format(DateTime.parse(user.dr!))}'),
                  ],
                ),
                onPressed: () {
                  setDr(context);
                },
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                      color: Colors.red,
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/profile');
                      }),
                  MaterialButton(
                      color: Colors.amber,
                      child: Text('Save'),
                      onPressed: () {
                        if (_editFormKey.currentState!.validate()) {
                          user = user.copy(name: _nameController.text);
                          user = user.copy(lastName: _lastNameController.text);
                          user = user.copy(phoneNumber: _phoneController.text);
                          Logic.saveUser(user);
                          Navigator.pushReplacementNamed(context, '/profile');
                        }
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future setDr(context) async {
    DateTime? time = await showDatePicker(
      context: context,
      initialDate: user.dr == '' ? DateTime.now() : DateTime.parse(user.dr!),
      firstDate: DateTime(DateTime.now().year - 2),
      lastDate: DateTime(DateTime.now().year + 2),
    );

    var mytime;
    if (time != null) {
      mytime = time.toIso8601String();
    }

    setState(() {
      user = user.copy(dr: mytime);
    });
  }
}
