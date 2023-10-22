import 'package:flutter/material.dart';
import 'package:flutter_formreg_aierke/main.dart';

class UserDetailsPage extends StatelessWidget {
  final NewUser newUser;

  UserDetailsPage({required this.newUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Данные пользователя'),
      ),
      body: Center(
        child: DataTable(
          columns: [
            DataColumn(label: Text('Поле')),
            DataColumn(label: Text('Значение')),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('ФИО')),
              DataCell(Text(newUser.fullName)),
            ]),
            DataRow(cells: [
              DataCell(Text('Номер телефона')),
              DataCell(Text(newUser.phoneNumber)),
            ]),
            DataRow(cells: [
              DataCell(Text('Почта')),
              DataCell(Text(newUser.email)),
            ]),
            DataRow(cells: [
              DataCell(Text('Страна')),
              DataCell(Text(newUser.country)),
            ]),
            DataRow(cells: [
              DataCell(Text('Рассказ о себе')),
              DataCell(Text(newUser.about)),
            ]),
          ],
        ),
      ),
    );
  }
}
