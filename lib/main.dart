import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:recite_flutter/theme.dart';

import './graphql_client.dart';
import './citations_page.dart';

void main() => runApp(ReciteApp());

class ReciteApp extends StatelessWidget {
  Widget _buildApp(BuildContext context, GraphQLClient client) {
    return MaterialApp(
      title: 'Recite',
      theme: appThemeData,
      home: CitationsPage(
          title: 'Citations Page', collectionSlug: "test", client: client),
    );
  }

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    final client = createClient();

    return ClientProvider(
        client: client, child: _buildApp(context, client.value));
  }
}
