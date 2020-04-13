import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:recite_flutter/models/collection.dart';

import '../graphql/add_citation_mutation.dart';
import '../models/citation_form.dart';

import './edit_citation.dart';

class AddCitationButton extends StatelessWidget {
  AddCitationButton({@required this.client, @required this.collection});
  final GraphQLClient client;
  final Collection collection;

  void _closeBottomSheetNavigation(context) {
    Navigator.of(context).pop();
  }

  Future<QueryResult> addCitation(
      BuildContext context, CitationForm citation) async {
    final variables = AddCitationArguments(
        authorName: citation.author,
        date: DateTime.now(),
        text: citation.text,
        collectionId: this.collection.id);

    final MutationOptions _options = MutationOptions(
      documentNode: AddCitationMutation(variables: variables).document,
      variables: variables.toJson(),
    );

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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            backgroundColor: Theme.of(context).backgroundColor,
            isScrollControlled: true,
            builder: (context) => FractionallySizedBox(
                heightFactor: 0.8,
                child: EditCitation(
                  onSubmit: (CitationForm citation) =>
                      addCitation(context, citation),
                  authors: this.collection.authors,
                )));
        // Column(
        //   children: <Widget>[
        //     Expanded(child: Container(child: Text("Hej"))),
        //     Text("Hej"),
        //     Container(
        //         padding: EdgeInsets.all(20.0),
        //         child: EditCitation(
        //           onSubmit: (CitationForm citation) =>
        //               addCitation(context, citation),
        //           authors: this.collection.authors,
        //         ))
        //   ],
        // )));
        // FractionallySizedBox(
        //     heightFactor: 0.8,
        //     child: Container(
        //         child: Container(
        //             padding: EdgeInsets.all(20.0),
        //             child: EditCitation(
        //               onSubmit: (CitationForm citation) =>
        //                   addCitation(context, citation),
        //               authors: this.collection.authors,
        //             )))));
      },
      tooltip: 'Add citation',
      child: Icon(Icons.add),
    );
  }
}
