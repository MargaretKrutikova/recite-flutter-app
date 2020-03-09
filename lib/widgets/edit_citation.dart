import 'package:flutter/material.dart';
import './date_picker.dart';

import '../models/citation.dart';

class EditCitation extends StatefulWidget {
  EditCitation({@required this.onSubmit});
  final Function onSubmit;

  @override
  _EditCitationState createState() => _EditCitationState();
}

class _EditCitationState extends State<EditCitation> {
  final _citationTextController = TextEditingController();
  final _authorController = TextEditingController();
  DateTime _addedDate = DateTime.now();

  bool _isValid() {
    final citationText = _citationTextController.text;
    final author = _authorController.text;

    return citationText.isNotEmpty && author.isNotEmpty && _addedDate != null;
  }

  void _setAddedDate(DateTime date) {
    setState(() {
      _addedDate = date;
    });
  }

  void _submitData() {
    if (!_isValid()) return;

    widget.onSubmit(Citation(
        addedDate: _addedDate,
        author: _authorController.text,
        citation: _citationTextController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
          child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Citation'),
            controller: _citationTextController,
            onSubmitted: (_) => _submitData(),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Author'),
            controller: _authorController,
            onSubmitted: (_) => _submitData(),
          ),
          DatePicker(
            date: _addedDate,
            onChange: _setAddedDate,
          )
        ],
      )),
    );
  }
}
