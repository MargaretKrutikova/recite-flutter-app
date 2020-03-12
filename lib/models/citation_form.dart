import 'package:flutter/foundation.dart';

class CitationForm {
  final String text;
  final String author;
  final DateTime addedDate;

  CitationForm({
    @required this.text,
    @required this.author,
    @required this.addedDate,
  });
}
