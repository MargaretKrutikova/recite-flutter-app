import 'package:flutter/material.dart';

import './widgets/edit_citation.dart';
import './models/citation.dart';

void main() => runApp(ReciteApp());

class ReciteApp extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recite',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 22.0, fontFamily: 'Hind'),
        ),
      ),
      home: CitationsPage(title: 'Citations Page'),
    );
  }
}

class CitationsPage extends StatefulWidget {
  CitationsPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _CitationsPageState createState() => _CitationsPageState();
}

class _CitationsPageState extends State<CitationsPage> {
  List<Citation> _citations = <Citation>[];

  void _addCitation(Citation citation) {
    setState(() {
      _citations.add(citation);
    });
    _closeBottomSheetNavigation();
  }

  Widget _buildRow(Citation citation) {
    return ListTile(
      title: Text('${citation.citation} (c) ${citation.author}'),
    );
  }

  Widget _buildCitationsList() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _citations.length,
        itemBuilder: /*1*/ (context, i) {
          return _buildRow(_citations[i]);
        });
  }

  void _closeBottomSheetNavigation() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: new Center(
          child: new Column(
        children: <Widget>[
          Expanded(child: _buildCitationsList()),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      EditCitation(
                        onSubmit: _addCitation,
                      ),
                    ],
                  )));
        },
        tooltip: 'Add citation',
        child: Icon(Icons.add),
      ),
    );
  }
}
