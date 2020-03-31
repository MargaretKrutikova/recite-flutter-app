import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:recite_flutter/models/app_settings.dart';
import 'package:recite_flutter/start_page.dart';
import 'package:recite_flutter/theme.dart';

import './graphql_client.dart';
import './citations_page.dart';

void main() => runApp(ReciteApp());

class ReciteApp extends StatefulWidget {
  @override
  _ReciteAppState createState() => _ReciteAppState();
}

class _ReciteAppState extends State<ReciteApp> {
  String activeCollectionName;

  void _onCollectionSubmit(String collectionName) async {
    await AppSettings.saveAppSettings(collectionName);
    setState(() {
      activeCollectionName = collectionName;
    });
  }

  Widget _buildApp(BuildContext context, GraphQLClient client) {
    return MaterialApp(
        title: 'Recite',
        theme: appThemeData,
        home: StartPage(
          client: client,
        ));
  }

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    final client = createClient();

    return ClientProvider(
        client: client, child: _buildApp(context, client.value));
  }
}
