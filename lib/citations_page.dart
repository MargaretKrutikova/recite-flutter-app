import 'package:flutter/material.dart';
import './widgets/edit_citation.dart';
import './models/citation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import './graphql/citations_query.dart';

class CitationsPage extends StatefulWidget {
  CitationsPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _CitationsPageState createState() => _CitationsPageState();
}

class _CitationsPageState extends State<CitationsPage> {
  List<Citation> _citations = <Citation>[];

  void _addCitation(Citation citation) {
    setState(() {
      _citations.add(citation);
    });
    _closeBottomSheetNavigation();
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

  void _closeBottomSheetNavigation() {
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
          final List<Citations$query_root$collections$citations> citations =
              data.collections.length > 0 ? data.collections[0].citations : [];

          return Scaffold(
            appBar: AppBar(
              // Here we take the value from the MyHomePage object that was created by
              // the App.build method, and use it to set our appbar title.
              title: Text(widget.title),
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
                              onSubmit: _addCitation,
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
