import 'package:Signs/Utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddRemoveListView extends StatefulWidget {
  _AddRemoveListViewState createState() => _AddRemoveListViewState();
}

class _AddRemoveListViewState extends State<AddRemoveListView> {
  TextEditingController _textController = TextEditingController();

  List<String> _listViewData = [
    "Swipe Right / Left to remove",
    "Swipe Right / Left to remove",
    "Swipe Right / Left to remove",
    "Swipe Right / Left to remove",
    "Swipe Right / Left to remove",
    "Swipe Right / Left to remove",
    "Swipe Right / Left to remove",
    "Swipe Right / Left to remove",
    "Swipe Right / Left to remove",
  ];

  _onSubmit() {
    setState(() {
      _listViewData.add(_textController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings().getAddRemoveLabel()),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 15.0),
          TextField(
            controller: _textController,
            decoration: InputDecoration(
              hintText: Strings().getEnterTextAddLabel(),
            ),
          ),
          SizedBox(height: 15.0),
          Center(
            child: RaisedButton(
              onPressed: _onSubmit,
              child: Text(Strings().getAddListLabel()),
              color: Colors.red,
            ),
          ),
          SizedBox(height: 20.0),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(10.0),
              children: _listViewData.reversed.map((data) {
                return Dismissible(
                  key: Key(data),
                  child: ListTile(
                    title: Text(data),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}