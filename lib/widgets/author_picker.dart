import 'package:flutter/material.dart';
import 'package:recite_flutter/models/author.dart';
import 'package:recite_flutter/theme.dart';

typedef OnSelect = void Function(String);

class AuthorPicker extends StatelessWidget {
  AuthorPicker(
      {@required this.authors,
      this.selectedAuthorName,
      @required this.onSelect});

  final OnSelect onSelect;
  final String selectedAuthorName;
  final List<Author> authors;

  Widget _buildRow(Author author, BuildContext context) {
    return GestureDetector(
        onTap: () => this.onSelect(author.name),
        child: Container(
            padding: EdgeInsets.all(12.0),
            height: 50.0,
            decoration: new BoxDecoration(
                color: AppColors.darkerBackgroundColor,
                border: new Border(
                    bottom: BorderSide(color: Colors.grey[600], width: 1.0))),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  author.name,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                selectedAuthorName == author.name
                    ? Icon(Icons.done, color: AppColors.primaryColor)
                    : SizedBox.shrink()
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            itemCount: authors.length,
            itemBuilder: (context, i) => _buildRow(authors[i], context)));
  }
}
