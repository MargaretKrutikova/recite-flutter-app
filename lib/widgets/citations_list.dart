import 'package:flutter/material.dart';

import '../graphql/citations_query.dart';

class CitationsList extends StatelessWidget {
  CitationsList({@required this.citations});

  final List<Citations$query_root$collections$citations> citations;

  Widget _buildRow(Citations$query_root$collections$citations citation) {
    return ListTile(
      title: Text('${citation.text} (c) ${citation.author.name}'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: citations.length,
        itemBuilder: /*1*/ (context, i) {
          return _buildRow(citations[i]);
        });
  }
}
