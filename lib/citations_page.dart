import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:recite_flutter/models/citations.dart';
import 'package:recite_flutter/widgets/add_citation_button.dart';
import 'package:recite_flutter/widgets/citation_stream_builder.dart';

class CitationsPage extends StatefulWidget {
  CitationsPage(
      {Key key,
      @required this.title,
      @required this.client,
      @required this.collectionId})
      : super(key: key);

  final String title;
  final String collectionId;
  final GraphQLClient client;

  @override
  _CitationsPageState createState() => _CitationsPageState();
}

class _CitationsPageState extends State<CitationsPage> {
  final scrollController = ScrollController();
  CitationsModel citations;

  @override
  void initState() {
    citations = CitationsModel(widget.client, widget.collectionId);
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        citations.loadMore();
      }
    });
    citations.loadInitData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: new Center(
          child: new Column(
        children: <Widget>[
          Expanded(
              child: CitationStreamBuilder(
            isLoading: citations.isLoading,
            onRefresh: citations.refresh,
            stream: citations.stream,
          )),
        ],
      )),
      floatingActionButton: AddCitationButton(
        client: widget.client,
        collectionId: widget.collectionId,
      ),
    );
  }
}
