import 'package:flutter/foundation.dart';
import './author.dart';

class Citation {
  final int id;
  final String text;
  final Author author;
  final DateTime added;

  Citation({
    @required this.id,
    @required this.text,
    @required this.author,
    @required this.added,
  });
}
