import 'package:bonus_app/domain/logic.dart';
import 'package:flutter/material.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({Key? key}) : super(key: key);

  @override
  _BottomBarWidgetState createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: Logic.currentIndex,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Кабинет'),
        BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: 'QR'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
      ],
      onTap: (index) {
        Logic.currentIndex = index;

        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/cabinet');
            break;
          case 1:
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Container(
                      child: Image.asset('asset/images/qr.png'),
                    ),
                  );
                });

            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/profile');
            break;
        }
      },
    );
  }
}
