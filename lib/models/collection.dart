import 'package:recite_flutter/graphql/collection_query.dart';

class Collection {
  const Collection({
    this.id,
    this.name,
    this.slug,
  });

  final String id;
  final String name;
  final String slug;

  factory Collection.fromCollectionQuery(
          Collection$query_root$collections collection) =>
      new Collection(
        id: collection.id,
        name: collection.name,
        slug: collection.slug,
      );
}
