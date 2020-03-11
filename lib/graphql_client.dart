import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/material.dart';

ValueNotifier<GraphQLClient> clientFor({
  @required String uri,
}) {
  Link link = HttpLink(uri: uri);

  return ValueNotifier<GraphQLClient>(
    GraphQLClient(
      cache: InMemoryCache(),
      link: link,
    ),
  );
}

/// Wraps the root application with the `graphql_flutter` client.
/// We use the cache for all state management.
class ClientProvider extends StatelessWidget {
  ClientProvider({
    @required this.client,
    @required this.child,
    String subscriptionUri,
  });

  final Widget child;
  final ValueNotifier<GraphQLClient> client;

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: child,
    );
  }
}
