import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:recite_flutter/models/app_settings.dart';
import 'package:recite_flutter/start_page.dart';
import 'package:recite_flutter/theme.dart';

import './graphql_client.dart';
import './citations_page.dart';

void main() => runApp(ReciteApp());

class ReciteApp extends StatelessWidget {
  Widget _buildApp(BuildContext context, GraphQLClient client) {
    return MaterialApp(
        title: 'Recite',
        theme: appThemeData,
        home: FutureBuilder<AppSettings>(
            // get the languageCode, saved in the preferences
            future: AppSettings.readAppSettings(),
            initialData: null,
            builder:
                (BuildContext context, AsyncSnapshot<AppSettings> snapshot) {
              return snapshot.hasData && snapshot.data.collectionName != null
                  ? CitationsPage(
                      title: 'Citations Page: ' + snapshot.data.collectionName,
                      collectionId: 'd60ab8c3-e49b-4c9e-8382-506e4b82c35e',
                      client: client)
                  : StartPage();
            }));
  }

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    final client = createClient();

    return ClientProvider(
        client: client, child: _buildApp(context, client.value));
  }
}
