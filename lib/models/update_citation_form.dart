import 'package:flutter/foundation.dart';

class UpdateCitationForm {
  final int id;
  final String text;
  final String author;
  final DateTime addedDate;

  UpdateCitationForm({
    @required this.id,
    @required this.text,
    @required this.author,
    @required this.addedDate,
  });
}
