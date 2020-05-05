import 'package:flutter/material.dart';
import 'package:recite_flutter/models/citation.dart';

class CitationCard extends StatelessWidget {
  CitationCard({@required this.citation, @required this.onPress});

  final Citation citation;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return new Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: new InkWell(
          onTap: this.onPress,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      children: <Widget>[
                        Flexible(child: new Text(citation.text))
                      ],
                    )),
                new Text(citation.author.name,
                    style: Theme.of(context).textTheme.subhead),
              ],
            ),
          )),
    );
  }
}
