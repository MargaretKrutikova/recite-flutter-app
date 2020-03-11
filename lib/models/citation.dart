import 'package:flutter/foundation.dart';

class Citation {
  final String text;
  final String author;
  final DateTime addedDate;

  Citation({
    @required this.text,
    @required this.author,
    @required this.addedDate,
  });
}
