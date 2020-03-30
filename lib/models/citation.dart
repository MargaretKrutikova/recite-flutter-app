import 'package:flutter/foundation.dart';
import 'package:recite_flutter/graphql/citations_query.graphql.dart';
import 'package:recite_flutter/graphql/subscribe_to_citations.graphql.dart';
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

  factory Citation.fromCitationQuery(Citations$query_root$citations citation) =>
      new Citation(
          id: citation.id,
          text: citation.text,
          author: Author(id: citation.author.id, name: citation.author.name),
          added: citation.added);

  factory Citation.fromCitationSubscription(
          GetCitationsAfterId$subscription_root$citations citation) =>
      new Citation(
          id: citation.id,
          text: citation.text,
          author: Author(id: citation.author.id, name: citation.author.name),
          added: citation.added);
}
