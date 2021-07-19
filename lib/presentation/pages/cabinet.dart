import 'package:bonus_app/domain/models.dart';
import 'package:bonus_app/presentation/widgets/bottombar.dart';
import 'package:flutter/material.dart';

class CabinetPage extends StatefulWidget {
  final User? user;
  const CabinetPage({Key? key, this.user}) : super(key: key);

  @override
  _CabinetPageState createState() => _CabinetPageState();
}

class _CabinetPageState extends State<CabinetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Кабинет'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Кабинет'),
              SizedBox(
                height: 20,
              ),
              Text('Flutter - программа лояльности'),
              SizedBox(
                height: 20,
              ),
              Text('Активные бонусы: 244'),
              SizedBox(
                height: 20,
              ),
              Text('Таблица покупок'),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: <DataColumn>[
                    DataColumn(
                      label: Text(
                        'Дата',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Магазин',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Остаток бонусов',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                  rows: const <DataRow>[
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('19.7.2021')),
                        DataCell(Text('Shop')),
                        DataCell(Text('1300')),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('22.9.2021')),
                        DataCell(Text('Martet')),
                        DataCell(Text('567')),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('12.2.2021')),
                        DataCell(Text('Amazon')),
                        DataCell(Text('244')),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomBarWidget());
  }
}
