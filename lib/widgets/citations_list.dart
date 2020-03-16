import 'package:flutter/material.dart';
import 'package:recite_flutter/models/citation.dart';

class CitationsList extends StatelessWidget {
  CitationsList({@required this.citations});

  final List<Citation> citations;

  Widget _buildRow(Citation citation, BuildContext context) {
    return new Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
                margin: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  children: <Widget>[Flexible(child: new Text(citation.text))],
                )),
            new Text(citation.author.name,
                style: Theme.of(context).textTheme.subhead),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: citations.length,
        itemBuilder: (context, i) => _buildRow(citations[i], context));
  }
}
