import 'package:bonus_app/domain/logic.dart';
import 'package:bonus_app/domain/models.dart';
//import 'package:bonus_app/presentation/pages/edit.dart';
import 'package:bonus_app/presentation/widgets/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late User user;
  @override
  void initState() {
    user = Logic.currentUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Профиль'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text('Профиль',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            Text('${user.name} ${user.lastName}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            Text('Flutter - программа лояльности',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            Container(
              child: MaterialButton(
                color: Colors.red,
                child: Text('Edit'),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/edit');
                },
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Логин: ${user.login}'),
                  // Text(
                  //     'Дата рождения: ${DateFormat('dd.MM.yyyy').format(DateTime.parse(user.dr!))}'),
                  user.dr == ''
                      ? Text('Дата рождения:')
                      : Text(
                          'Дата рождения: ${DateFormat('dd.MM.yyyy').format(DateTime.parse(user.dr!))}'),
                  Text('Номер карты: ${user.cardNumber}'),
                  Text('Номер телефона: ${user.phoneNumber}'),
                  Text('Описание уровня'),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomBarWidget(),
    );
  }
}
