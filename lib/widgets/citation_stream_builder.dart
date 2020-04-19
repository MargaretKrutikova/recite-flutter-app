import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:recite_flutter/models/citations.dart';
import 'package:recite_flutter/widgets/citation_card.dart';

typedef OnRefresh = Future<void> Function();

class CitationStreamBuilder extends StatefulWidget {
  CitationStreamBuilder({@required this.client, @required this.collectionId});

  final String collectionId;
  final GraphQLClient client;

  @override
  _CitationStreamBuilderState createState() => _CitationStreamBuilderState();
}

class _CitationStreamBuilderState extends State<CitationStreamBuilder> {
  final _scrollController = ScrollController();
  CitationsModel citations;

  @override
  void initState() {
    citations = CitationsModel(widget.client, widget.collectionId);
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        citations.loadMore();
      }
    });
    citations.loadInitData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: citations.stream,
      builder: (BuildContext _context, AsyncSnapshot _snapshot) {
        if (!_snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          return RefreshIndicator(
              onRefresh: citations.refresh,
              child: Scrollbar(
                  child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                controller: _scrollController,
                itemCount: _snapshot.data.length + 1,
                itemBuilder: (BuildContext _context, int index) {
                  if (index < _snapshot.data.length) {
                    return CitationCard(citation: _snapshot.data[index]);
                  } else if (citations.isLoading) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 32.0),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return Text("");
                  }
                },
              )));
        }
      },
    );
  }
}
