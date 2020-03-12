import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import './graphql_client.dart';
import './citations_page.dart';

void main() => runApp(ReciteApp());

final GRAPHQL_ENDPOINT = 'https://recite-api.margareta.dev/v1/graphql';

class ReciteApp extends StatelessWidget {
  Widget _buildApp(BuildContext context, GraphQLClient client) {
    return MaterialApp(
      title: 'Recite',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 22.0, fontFamily: 'Hind'),
        ),
      ),
      home: CitationsPage(
          title: 'Citations Page', collectionSlug: "test", client: client),
    );
  }

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    final client = clientFor(uri: GRAPHQL_ENDPOINT);

    return ClientProvider(
        client: client, child: _buildApp(context, client.value));
  }
}
