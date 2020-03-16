import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/material.dart';

final graphqlUri = 'https://recite-api.margareta.dev/v1/graphql';
final subscriptionUri = 'wss://recite-api.margareta.dev/v1/graphql';

ValueNotifier<GraphQLClient> createClient() {
  Link link = HttpLink(uri: graphqlUri);

  final WebSocketLink websocketLink = WebSocketLink(
    url: subscriptionUri,
    config: SocketClientConfig(
      autoReconnect: true,
      inactivityTimeout: Duration(seconds: 30),
    ),
  );

  link = link.concat(websocketLink);

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
