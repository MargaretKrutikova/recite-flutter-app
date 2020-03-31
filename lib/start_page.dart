import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:recite_flutter/citations_page.dart';
import 'package:recite_flutter/collection_page.dart';
import 'package:recite_flutter/graphql/collection_query.dart';
import 'package:recite_flutter/models/collection.dart';

class StartPage extends StatefulWidget {
  StartPage({@required this.client});
  final GraphQLClient client;

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  bool _isLoading = false;
  bool _isError = false;

  void _onCollectionQueryError() {
    setState(() {
      _isLoading = false;
      _isError = true;
    });
  }

  void _fetchCollection(String collectionName) async {
    final _variables =
        CollectionArguments(namePattern: "" + collectionName + "");

    final WatchQueryOptions _options = WatchQueryOptions(
        documentNode: CollectionQuery(variables: _variables).document,
        variables: _variables.toJson());

    try {
      final result = await widget.client.query(_options);

      if (!result.hasException && result.data != null) {
        final collections =
            Collection$query_root.fromJson(result.data).collections;
        final foundCollection = collections.isNotEmpty ? collections[0] : null;
        if (foundCollection != null) {
          setState(() {
            _isLoading = false;
            _isError = false;
          });
          final collection = Collection.fromCollectionQuery(foundCollection);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CitationsPage(
                    title: 'Citations for ' + collection.name,
                    collectionId: collection.id,
                    client: widget.client)),
          );
        }
      } else {
        _onCollectionQueryError();
      }
    } catch (err) {
      print(err);
      _onCollectionQueryError();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CollectionPage(
      onSubmit: this._fetchCollection,
      isLoading: _isLoading,
    );
  }
}
