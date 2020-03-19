import 'dart:async';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:recite_flutter/graphql/citations_query.dart';
import 'package:recite_flutter/graphql/subscribe_to_citations.graphql.dart';
import 'package:recite_flutter/models/author.dart';
import 'package:recite_flutter/models/citation.dart';

class CitationsModel {
  GraphQLClient _client;

  Stream<List<Citation>> stream;
  bool hasMore;

  bool _isLoading;
  StreamSubscription<FetchResult> _subscription;

  List<Citation> _data;
  StreamController<List<Citation>> _controller;

  CitationsModel(GraphQLClient client) {
    _data = List<Citation>();
    _controller = StreamController<List<Citation>>.broadcast();
    _isLoading = false;

    _client = client;

    stream = _controller.stream.map((List<Citation> citations) {
      return citations.toList();
    });
    hasMore = true;
    // refresh();
  }

  Future<void> loadInitData(String slug) {
    return this
        ._client
        .query(QueryOptions(
          documentNode:
              CitationsQuery(variables: CitationsArguments(slug: slug))
                  .document,
          variables: CitationsArguments(slug: slug).toJson(),
        ))
        .then((res) {
      if (!res.hasException && res.data != null) {
        final data = Citations$query_root.fromJson(res.data);
        final collection =
            data.collections.length > 0 ? data.collections[0] : null;
        final List<Citations$query_root$collections$citations> graphqCitations =
            collection != null ? collection.citations : [];

        final citations = graphqCitations
            .map((citation) => Citation(
                id: citation.id,
                text: citation.text,
                author:
                    Author(id: citation.author.id, name: citation.author.name),
                added: citation.added))
            .toList();

        _data = citations;
        _controller.add(citations);
        _subscribe(_data[0].id);
      }
    });
  }

  void _onData(final FetchResult message) {
    if (message.data != null) {
      final response =
          GetCitationsAfterId$subscription_root.fromJson(message.data);
      final citations = response.get_citations_after_id.map((incoming) =>
          Citation(
              id: incoming.id,
              text: incoming.text,
              author:
                  Author(id: incoming.author.id, name: incoming.author.name),
              added: incoming.added));

      _data = new List.from(citations)..addAll(_data);
      _controller.add(_data);
      _subscribe(_data[0].id);
    }
  }

  void _onError(final Object error) {
    print("GOT ERRORS");
  }

  void _onDone() {
    print("GOT DONW");
  }

  void _subscribe(int lastCitationId) async {
    final subscription = GetCitationsAfterIdMutation(
        variables: GetCitationsAfterIdArguments(
            lastCitationId: lastCitationId,
            collectionId: 'd60ab8c3-e49b-4c9e-8382-506e4b82c35e'));

    final stream = this._client.subscribe(Operation(
          documentNode: subscription.document,
          variables: subscription.variables.toJson(),
        ));

    _subscription?.cancel();

    _subscription = stream.listen(
      _onData,
      onError: _onError,
      onDone: _onDone,
    );
  }

  // Future<void> refresh() {
  //   return loadMore(clearCachedData: true);
  // }

  // Future<void> loadMore({bool clearCachedData = false}) {
  //   if (clearCachedData) {
  //     _data = List<Map>();
  //     hasMore = true;
  //   }
  //   if (_isLoading || !hasMore) {
  //     return Future.value();
  //   }
  //   _isLoading = true;
  //   return _getExampleServerData(10).then((postsData) {
  //     _isLoading = false;
  //     _data.addAll(postsData);
  //     hasMore = (_data.length < 30);
  //     _controller.add(_data);
  //   });
  // }
}
