import 'package:flutter/material.dart';
import 'package:recite_flutter/theme.dart';
import 'package:recite_flutter/widgets/primary_button.dart';

typedef OnCollectionSubmit = void Function(String);

class CollectionPage extends StatefulWidget {
  CollectionPage({@required this.onSubmit, @required this.isLoading});
  final OnCollectionSubmit onSubmit;
  final bool isLoading;

  @override
  _CollectionPageState createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  final _collectionTextController = TextEditingController();

  bool _isCollectionValid() {
    return _collectionTextController.text.isNotEmpty;
  }

  void _setCollection() {
    if (_isCollectionValid()) {
      widget.onSubmit(_collectionTextController.text);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.darkBackgroundColor,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: new Container(
                margin: const EdgeInsets.all(20.0),
                alignment: Alignment.center,
                child: FractionallySizedBox(
                  heightFactor: 0.7,
                  child: Column(
                    children: [
                      SizedBox(
                          height: 150,
                          width: 150,
                          child:
                              Image(image: AssetImage('images/icon-512.png'))),
                      Container(
                        margin: const EdgeInsets.only(top: 20.0, bottom: 30.0),
                        child: TextField(
                          decoration: InputDecoration(labelText: 'Collection'),
                          controller: _collectionTextController,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      PrimaryButton(
                          onPressed: this._setCollection, text: 'Continue'),
                      widget.isLoading
                          ? Padding(
                              padding: EdgeInsets.symmetric(vertical: 32.0),
                              child: Center(child: CircularProgressIndicator()),
                            )
                          : Container()
                    ],
                  ),
                ))));
  }
}
