import 'package:flutter/material.dart';
import './widgets/edit_citation.dart';
import './models/citation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import './graphql/citations_query.dart';
import './graphql/add_citation_mutation.dart';

class CitationsPage extends StatelessWidget {
  CitationsPage({Key key, @required this.title, @required this.client})
      : super(key: key);

  final String title;
  final GraphQLClient client;

  Future<QueryResult> addCitation(BuildContext context,
      Refetch refetchCitations, String collectionId, Citation citation) async {
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

  Widget _buildRow(Citations$query_root$collections$citations citation) {
    return ListTile(
      title: Text('${citation.text} (c) ${citation.author.name}'),
    );
  }

  Widget _buildCitationsList(
      List<Citations$query_root$collections$citations> citations) {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: citations.length,
        itemBuilder: /*1*/ (context, i) {
          return _buildRow(citations[i]);
        });
  }

  void _closeBottomSheetNavigation(context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(
          documentNode:
              CitationsQuery(variables: CitationsArguments(slug: "test"))
                  .document,
          variables: CitationsArguments(slug: "test").toJson(),
        ),
        builder: (
          QueryResult result, {
          Refetch refetch,
          FetchMore fetchMore,
        }) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          if (result.loading && result.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final data = Citations$query_root.fromJson(result.data);
          final collection =
              data.collections.length > 0 ? data.collections[0] : null;
          final List<Citations$query_root$collections$citations> citations =
              collection != null ? collection.citations : [];

          final collectionId = collection != null ? collection.id : null;

          return Scaffold(
            appBar: AppBar(
              // Here we take the value from the MyHomePage object that was created by
              // the App.build method, and use it to set our appbar title.
              title: Text(this.title),
            ),
            body: new Center(
                child: new Column(
              children: <Widget>[
                Expanded(child: _buildCitationsList(citations)),
              ],
            )),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          children: <Widget>[
                            EditCitation(
                              onSubmit: (Citation citation) => addCitation(
                                  context, refetch, collectionId, citation),
                            ),
                          ],
                        )));
              },
              tooltip: 'Add citation',
              child: Icon(Icons.add),
            ),
          );
        });
  }
}
