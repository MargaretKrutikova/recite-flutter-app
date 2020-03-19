import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:recite_flutter/models/citations.dart';
import 'package:recite_flutter/widgets/add_citation_button.dart';
import 'package:recite_flutter/widgets/citation_stream_builder.dart';

class CitationsPage extends StatefulWidget {
  CitationsPage({
    Key key,
    @required this.title,
    @required this.client,
    @required this.collectionSlug,
  }) : super(key: key);

  final String title;
  final String collectionSlug;

  final GraphQLClient client;

  @override
  _CitationsPageState createState() => _CitationsPageState();
}

class _CitationsPageState extends State<CitationsPage> {
  final scrollController = ScrollController();
  CitationsModel citations;

  @override
  void initState() {
    citations = CitationsModel(widget.client);
    scrollController.addListener(() {
      // if (scrollController.position.maxScrollExtent == scrollController.offset) {
      //   posts.loadMore();
      // }
    });
    citations.loadInitData(widget.collectionSlug);
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
            onRefresh: () => Completer().future,
            stream: citations.stream,
          )),
        ],
      )),
      floatingActionButton: AddCitationButton(
        client: widget.client,
        collectionId: 'd60ab8c3-e49b-4c9e-8382-506e4b82c35e',
      ),
    );
  }
}
