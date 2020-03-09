import 'package:flutter/foundation.dart';

class Citation {
  final String citation;
  final String author;
  final DateTime addedDate;

  Citation({
    @required this.citation,
    @required this.author,
    @required this.addedDate,
  });
}
