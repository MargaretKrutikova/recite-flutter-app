import 'package:flutter/material.dart';
import 'package:recite_flutter/models/citation.dart';
import 'package:recite_flutter/widgets/citation_card.dart';

typedef OnRefresh = Future<void> Function();

class CitationStreamBuilder extends StatelessWidget {
  CitationStreamBuilder({@required this.stream, @required this.onRefresh});

  final Stream<List<Citation>> stream;
  final OnRefresh onRefresh;

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (BuildContext _context, AsyncSnapshot _snapshot) {
        if (!_snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          return RefreshIndicator(
            onRefresh: onRefresh,
            child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                controller: scrollController,
                separatorBuilder: (context, index) => Divider(),
                itemCount: _snapshot.data.length + 1,
                itemBuilder: (BuildContext _context, int index) =>
                    CitationCard(citation: _snapshot.data[index])),
          );
        }
      },
    );
  }
}
