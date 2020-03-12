import 'package:flutter/material.dart';
import './date_picker.dart';

import '../models/citation_form.dart';

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

    widget.onSubmit(CitationForm(
        addedDate: _addedDate,
        author: _authorController.text,
        text: _citationTextController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Citation'),
            controller: _citationTextController,
            style: Theme.of(context).textTheme.body1,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Author'),
            controller: _authorController,
            style: Theme.of(context).textTheme.body1,
          ),
          DatePicker(
            date: _addedDate,
            onDateChanged: _setAddedDate,
          ),
          RaisedButton(
              child: const Text('Save'),
              onPressed: this._submitData,
              color: Colors.green),
        ],
      ),
    );
  }
}
