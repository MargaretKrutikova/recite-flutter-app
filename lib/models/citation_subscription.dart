import 'dart:async';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:recite_flutter/graphql/subscribe_to_citations.graphql.dart';
import 'package:recite_flutter/models/citation.dart';

typedef OnSubscriptionReceive = void Function(List<Citation> citations);

class CitationSubscription {
  GraphQLClient _client;
  String _collectionId;
  StreamSubscription<FetchResult> _subscription;
  OnSubscriptionReceive _onSubscriptionReceive;

  CitationSubscription(GraphQLClient client, String collectionId,
      OnSubscriptionReceive onReceive) {
    _client = client;
    _collectionId = collectionId;
    _onSubscriptionReceive = onReceive;
  }

  void _onReceiveSubscription(final FetchResult message) {
    if (message.data != null) {
      final response =
          GetCitationsAfterId$subscription_root.fromJson(message.data);

      final citations = response.get_citations_after_id
          .map((citation) => Citation.fromCitationSubscription(citation))
          .toList();

      subscribeToLatest(citations);

      _onSubscriptionReceive(citations);
    }
  }

  void _onError(final Object error) {
    print("GOT ERRORS");
  }

  void subscribeToLatest(final List<Citation> citations) {
    if (citations.length > 0) {
      var lastCitationId = citations[0].id;
      _subscribe(lastCitationId);
    }
  }

  void _subscribe(int lastCitationId) async {
    final subscription = GetCitationsAfterIdMutation(
        variables: GetCitationsAfterIdArguments(
            lastCitationId: lastCitationId, collectionId: _collectionId));

    final stream = this._client.subscribe(Operation(
          documentNode: subscription.document,
          variables: subscription.variables.toJson(),
        ));

    _subscription?.cancel();

    _subscription = stream.listen(
      _onReceiveSubscription,
      onError: _onError,
    );
  }
}
