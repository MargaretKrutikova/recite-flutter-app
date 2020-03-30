import 'dart:async';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:recite_flutter/graphql/citations_query.dart';
import 'package:recite_flutter/models/citation.dart';
import 'package:recite_flutter/models/citation_subscription.dart';

class CitationsModel {
  final _limit = 20;

  GraphQLClient _client;
  String _collectionId;
  CitationSubscription _subscription;

  List<Citation> _data;
  StreamController<List<Citation>> _controller;

  Stream<List<Citation>> stream;
  bool hasMore;
  bool isLoading;
  bool hasError;

  CitationsModel(GraphQLClient client, String collectionId) {
    _data = List<Citation>();
    _controller = StreamController<List<Citation>>.broadcast();
    _subscription =
        new CitationSubscription(client, collectionId, _onReceiveSubscription);

    _client = client;
    _collectionId = collectionId;

    stream = _controller.stream.map((List<Citation> citations) {
      return citations.toList();
    });

    isLoading = false;
    hasMore = true;
  }

  Future<void> loadInitData() {
    return _loadData();
  }

  Future<void> refresh() {
    if (isLoading) {
      return Future.value();
    }

    return loadInitData();
  }

  Future<void> loadMore() {
    if (isLoading || !hasMore) {
      return Future.value();
    }

    return _loadData(offset: _data.length);
  }

  /// private

  void _onDataLoaded(dynamic data) {
    isLoading = false;
    hasError = false;

    final root = Citations$query_root.fromJson(data);
    final citations = root.citations
        .map((citation) => Citation.fromCitationQuery(citation))
        .toList();

    _data.addAll(citations);
    _controller.add(_data);
  }

  void onLoadQuery(QueryResult result, bool shouldResubscribe) {
    if (result.hasException) {
      hasError = true;
    } else if (result.data != null) {
      _onDataLoaded(result.data);
      if (shouldResubscribe) {
        _subscription.subscribeToLatest(_data);
      }
    }
  }

  Future<void> _loadData({int offset = 0}) {
    var variables = CitationsArguments(
        collectionId: _collectionId, offset: offset, limit: _limit);

    var shouldResubscribe = offset == 0;

    return this
        ._client
        .query(QueryOptions(
          documentNode: CitationsQuery(variables: variables).document,
          variables: variables.toJson(),
        ))
        .then((res) => onLoadQuery(res, shouldResubscribe));
  }

  void _onReceiveSubscription(final List<Citation> citations) {
    _data = new List.from(citations)..addAll(_data);
    _controller.add(_data);
  }
}
