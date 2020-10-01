import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:http/http.dart';
import 'package:list_students/constants.dart';
import 'package:list_students/store/student_store.dart';
import 'package:list_students/student_api.dart';
import 'package:list_students/students.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/list.dart';
import 'pages/list_avatar.dart';
import 'pages/page3.dart';
import 'pages/tinder.dart';
import 'router.dart';

void main() async {
  runApp(MaterialApp(
    home: MyApp(),
    initialRoute: listStudent,
    onGenerateRoute: Router.generateRoute,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // int selectedIndex = 0;

  // List<Widget> pages = [];

  StudentStore studentStore = StudentStore();
  StudentApi studentApi = StudentApi();

  // void onItemTapped(int index) {
  //   setState(() {
  //     selectedIndex = index;
  //   });
  // }

  // @override
  // // ignore: must_call_super
  // void initState() {
  //   pages = <Widget>[
  //     ListStudent(),
  //     ListAvatar(),
  //     Page3(getIndex: onItemTapped),
  //     Tinder(),
  //   ];
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: studentStore.pageController,
        children: [
          ListStudent(),
          ListAvatar(),
          Page3(getIndex: studentStore.changePage),
          Tinder(),
        ],
      ),
      bottomNavigationBar: Observer(
        builder: (context) => BottomNavigationBar(
          backgroundColor: Colors.black87,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.grey),
                title: Text('List Student')),
            BottomNavigationBarItem(
                icon: Icon(Icons.list, color: Colors.grey),
                title: Text('List Avatar')),
            BottomNavigationBarItem(
              icon: Icon(Icons.pages, color: Colors.grey),
              title: Text('Page3'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pageview, color: Colors.grey),
              title: Text('Tinder'),
            ),
          ],
          currentIndex: studentStore.selectedIndex,
          onTap: (index) => studentStore.changePage(index),
        ),
      ),
    );
  }

  Future<List<Students>> _read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'data';
    final students = prefs.getString(key);
    List<dynamic> data = json.decode(students);
    List<Students> posts =
        data.map((dynamic item) => Students.fromJson(item)).toList();

    return posts;
  }

  _save() async {
    final String postUrl =
        "https://a76621db-af38-4376-958a-ae7d80b8ddd0.mock.pstmn.io/students";

    var response = await get(postUrl);
    final students = response.body;
    final prefs = await SharedPreferences.getInstance();
    final key = 'data';
    prefs.setString(key, students);
  }
}
