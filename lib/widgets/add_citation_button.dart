import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../graphql/add_citation_mutation.dart';
import '../models/citation_form.dart';

import './edit_citation.dart';

class AddCitationButton extends StatelessWidget {
  AddCitationButton(
      {@required this.client,
      @required this.collectionId,
      @required this.refetch});
  final GraphQLClient client;
  final String collectionId;
  final Function refetch;

  void _closeBottomSheetNavigation(context) {
    Navigator.of(context).pop();
  }

  Future<QueryResult> addCitation(
      BuildContext context,
      Refetch refetchCitations,
      String collectionId,
      CitationForm citation) async {
    final variables = AddCitationArguments(
        authorName: citation.author,
        date: DateTime.now(),
        text: citation.text,
        collectionId: collectionId);

    // TODO: implement cache updates instead of full refetch
    final MutationOptions _options = MutationOptions(
        documentNode: AddCitationMutation(variables: variables).document,
        variables: variables.toJson(),
        update: (Cache cache, QueryResult result) => {},
        onCompleted: (dynamic data) => refetchCitations());

    final queryResult = await this.client.mutate(_options);

    _closeBottomSheetNavigation(context);
    return queryResult;
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) => Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    EditCitation(
                      onSubmit: (CitationForm citation) =>
                          addCitation(context, refetch, collectionId, citation),
                    ),
                  ],
                )));
      },
      tooltip: 'Add citation',
      child: Icon(Icons.add),
    );
  }
}
