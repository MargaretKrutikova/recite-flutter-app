import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:recite_flutter/theme.dart';

typedef void DateChangedCallback(DateTime dateTime);

class DatePicker extends StatelessWidget {
  DatePicker({@required this.date, @required this.onDateChanged});

  final DateTime date;
  final DateChangedCallback onDateChanged;

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: Theme.of(context).copyWith(
              dialogBackgroundColor:
                  AppColors.darkerBackgroundColor, //Background color
            ),
            child: child,
          );
        },
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
            child: new GestureDetector(
                onTap: () => _selectDate(context),
                child: Text(
                  date == null
                      ? 'No date chosen'
                      : DateFormat.yMd().format(date),
                )),
          ),
          FlatButton(
            textColor: Theme.of(context).primaryColor,
            child: Text(
              'Choose Date',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Theme.of(context).primaryTextTheme.button.color),
            ),
            onPressed: () => _selectDate(context),
          )
        ]));
  }
}
