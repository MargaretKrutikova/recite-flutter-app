import 'package:flutter/material.dart';
import 'package:recite_flutter/widgets/author_picker.dart';
import 'package:recite_flutter/widgets/primary_button.dart';
import './date_picker.dart';

import '../models/citation_form.dart';

class EditCitation extends StatefulWidget {
  EditCitation(
      {@required this.onSubmit,
      @required this.collectionId,
      @required this.citationForm});
  final Function onSubmit;
  final String collectionId;
  final CitationForm citationForm;

  @override
  _EditCitationState createState() => _EditCitationState();
}

class _EditCitationState extends State<EditCitation> {
  final _citationTextController = TextEditingController();
  final _authorController = TextEditingController();
  String _authorName = "";
  DateTime _addedDate = DateTime.now();

  @override
  void initState() {
    super.initState();

    this._citationTextController.text = widget.citationForm.text;
    this._authorController.text = widget.citationForm.author;
    this._addedDate = widget.citationForm.addedDate;
  }

  bool _isValid() {
    final citationText = _citationTextController.text;
    final author = _authorController.text;

    return citationText.isNotEmpty && author.isNotEmpty && _addedDate != null;
  }

  void _setAuthorName(String name) {
    setState(() {
      _authorName = name;
    });
    _authorController.value = TextEditingValue(text: name);
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
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Citation'),
            controller: _citationTextController,
            style: Theme.of(context).textTheme.body1,
          ),
          Container(
              margin: EdgeInsets.only(bottom: 20.0),
              child: TextField(
                decoration: InputDecoration(labelText: 'Author'),
                controller: _authorController,
                style: Theme.of(context).textTheme.body1,
              )),
          Expanded(
              child: AuthorPicker(
            collectionId: widget.collectionId,
            onSelect: _setAuthorName,
            selectedAuthorName: _authorName,
          )),
          DatePicker(
            date: _addedDate,
            onDateChanged: _setAddedDate,
          ),
          Container(
              padding: EdgeInsets.only(bottom: 50.0),
              child: PrimaryButton(
                onPressed: this._submitData,
                text: "Save",
              )),
        ],
      ),
    );
  }
}
