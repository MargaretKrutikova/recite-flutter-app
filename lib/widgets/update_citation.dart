import 'package:flutter/material.dart';
import 'package:recite_flutter/models/citation.dart';
import 'package:recite_flutter/models/update_citation_form.dart';
import 'package:recite_flutter/widgets/author_picker.dart';
import 'package:recite_flutter/widgets/primary_button.dart';
import './date_picker.dart';
import 'cancel_button.dart';

class UpdateCitation extends StatefulWidget {
  UpdateCitation(
      {@required this.onSubmit,
      @required this.onCancel,
      @required this.collectionId,
      @required this.citationToUpdate});
  final Function onSubmit;
  final Function onCancel;
  final String collectionId;
  final Citation citationToUpdate;

  @override
  _UpdateCitationState createState() => _UpdateCitationState();
}

class _UpdateCitationState extends State<UpdateCitation> {
  final _citationTextController = TextEditingController();
  final _authorController = TextEditingController();
  String _authorName = "";
  DateTime _addedDate = DateTime.now();

  @override
  void initState() {
    super.initState();

    this._citationTextController.text = widget.citationToUpdate.text;
    this._authorController.text = widget.citationToUpdate.author.name;
    this._addedDate = widget.citationToUpdate.added;
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

    widget.onSubmit(UpdateCitationForm(
        id: widget.citationToUpdate.id,
        addedDate: _addedDate,
        author: _authorController.text,
        text: _citationTextController.text));
  }

  void _cancelEdit() {
    widget.onCancel();
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
              padding: EdgeInsets.only(bottom: 15.0),
              child: PrimaryButton(
                onPressed: this._submitData,
                text: "Save",
              )),
          Container(
              padding: EdgeInsets.only(bottom: 20.0),
              child: CancelButton(
                onPressed: this._cancelEdit,
                text: "Cancel",
              )),
        ],
      ),
    );
  }
}
