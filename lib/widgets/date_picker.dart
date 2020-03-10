import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

typedef void DateChangedCallback(DateTime dateTime);

class DatePicker extends StatelessWidget {
  DatePicker({@required this.date, @required this.onDateChanged});

  final DateTime date;
  final DateChangedCallback onDateChanged;

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: this.date,
        firstDate: DateTime(2019),
        lastDate: DateTime.now());

    if (pickedDate != null && pickedDate != this.date) {
      onDateChanged(pickedDate);
    }
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
            onPressed: () => _selectDate(context),
          )
        ]));
  }
}
