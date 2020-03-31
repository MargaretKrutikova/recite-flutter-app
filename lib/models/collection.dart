import 'package:recite_flutter/graphql/collection_query.dart';
import 'package:recite_flutter/models/author.dart';

class Collection {
  const Collection({
    this.id,
    this.name,
    this.slug,
    this.authors,
  });

  final String id;
  final String name;
  final String slug;
  final List<Author> authors;

  factory Collection.fromCollectionQuery(
          Collection$query_root$collections collection) =>
      new Collection(
          id: collection.id,
          name: collection.name,
          slug: collection.slug,
          authors: collection.authors == null
              ? []
              : collection.authors
                  .map((author) => Author(id: author.id, name: author.name))
                  .toList());
}
