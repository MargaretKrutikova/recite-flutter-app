import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:recite_flutter/graphql/update_citation_mutation.graphql.dart';
import 'package:recite_flutter/models/citations.dart';
import 'package:recite_flutter/models/update_citation_form.dart';
import 'package:recite_flutter/widgets/citation_card.dart';
import 'update_citation.dart';

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

  void _closeBottomSheetNavigation(context) {
    Navigator.of(context).pop();
  }

  Future<QueryResult> updateCitation(
      BuildContext context, UpdateCitationForm citation) async {
    final variables = UpdateCitationArguments(
        id: citation.id,
        authorName: citation.author,
        date: DateTime.now(),
        text: citation.text,
        collectionId: widget.collectionId);

    final MutationOptions _options = MutationOptions(
      documentNode: UpdateCitationMutation(variables: variables).document,
      variables: variables.toJson(),
    );

    final queryResult = await widget.client.mutate(_options);

    _closeBottomSheetNavigation(context);
    return queryResult;
  }

  void cancelUpdate(BuildContext context) async {
    _closeBottomSheetNavigation(context);
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
                    var citation = _snapshot.data[index];
                    return CitationCard(
                      citation: citation,
                      onPress: () {
                        showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            backgroundColor: Theme.of(context).backgroundColor,
                            isScrollControlled: true,
                            builder: (context) => FractionallySizedBox(
                                heightFactor: 0.8,
                                child: UpdateCitation(
                                  citationToUpdate: citation,
                                  collectionId: widget.collectionId,
                                  onSubmit: (UpdateCitationForm citation) =>
                                      updateCitation(context, citation),
                                  onCancel: () => cancelUpdate(context),
                                )));
                      },
                    );
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
