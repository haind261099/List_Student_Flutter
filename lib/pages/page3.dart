import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Page3 extends StatelessWidget {
  final Function(int) getIndex;
  Page3({Key key, this.getIndex}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Page3'),
          centerTitle: true,
        ),
        body: Center(
            child: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            getIndex(0);
          },
        )));
  }

  _removeData() async {
    final prefs = SharedPreferences.getInstance();
  }
}

// final String postUrl = "https://a76621db-af38-4376-958a-ae7d80b8ddd0.mock.pstmn.io/students";

// var response = await get(postUrl);
// final students = response.body;
// final prefs = await SharedPreferences.getInstance();
// final key = 'data';
// prefs.setString(key, students);
