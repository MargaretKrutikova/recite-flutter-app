import 'package:flutter/material.dart';
import 'package:recite_flutter/theme.dart';
import 'package:recite_flutter/widgets/primary_button.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final _collectionTextController = TextEditingController();

  void _fetchCollection() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.darkBackgroundColor,
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
                          style: Theme.of(context).textTheme.body1,
                        ),
                      ),
                      PrimaryButton(
                          onPressed: this._fetchCollection, text: 'Save')
                    ],
                  ),
                ))));
  }
}
