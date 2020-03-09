import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatelessWidget {
  final DateTime date;
  final Function onChange;

  DatePicker({@required this.date, @required this.onChange});

  void _openDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      onChange(pickedDate);
    });
    print('...');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        child: Row(children: <Widget>[
          Expanded(
            child: Text(
              date == null ? 'No date chosen' : DateFormat.yMd().format(date),
            ),
          ),
          FlatButton(
            textColor: Theme.of(context).primaryColor,
            child: Text(
              'Choose Date',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () => _openDatePicker(context),
          )
        ]));
  }
}
