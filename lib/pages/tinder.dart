import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:http/http.dart';
import 'package:list_students/http_service.dart';
import 'package:list_students/store/student_store.dart';
import 'dart:convert';

import 'package:list_students/students.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(MaterialApp(
    home: Tinder(),
  ));
}

class Tinder extends StatelessWidget {

  List<Students> students;
  final HttpService httpService = HttpService();
  final StudentStore studentStore = StudentStore();

  Tinder(){
    studentStore.getStudents();
  }

  @override
  Widget build(BuildContext context) {
    final future = studentStore.students;
    // ignore: unused_local_variable
    CardController controller;
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: future,
          builder: (context, snapshot){  //FutureBuilder: get API 
          // var getData = json.decode(snapshot.data.toString());
          students = snapshot.data;
          if(students == null){
            return Text('');
          } else return Container(
            // height: MediaQuery.of(context).size.height * 0.6, //chieu cao cua man hinh * 0.6
            child: new TinderSwapCard( //Widget co chuc nang hoan doi Card 
              orientation: AmassOrientation.TOP, //huong cua stack Card
              totalNum: students == null ? 0 : students.length, //so phan tu
              stackNum: 3, //so luong anh trong 1 stack
              swipeEdge: 3.0,
              maxWidth: MediaQuery.of(context).size.width * 0.6, //chieu dai toi da cua phan tu bang chieu dai man hinh * 0.6
              maxHeight: MediaQuery.of(context).size.height * 0.6, //chieu cao toi da cua phan tu bang chieu cao man hinh * 0.6
              minWidth: MediaQuery.of(context).size.width * 0.3, //chieu dai toi thieu cua phan tu bang chieu dai man hinh * 0.5
              minHeight: MediaQuery.of(context).size.height * 0.3, //chieu dai toi thieu cua phan tu bang chieu cao man hinh * 0.5
              cardBuilder: (context, index) {
                if(index == null){
                  return Text('End');
                } else return Card(
                  child: Image.asset(students[index].avatar),
                );
              },
              cardController: controller = CardController(),
              // swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
              //   /// Get swiping card's alignment
              //   if (align.x < 0) {
              //     //print("Card is LEFT swiping");
              //   } else if (align.x > 0) {
              //     //print("Card is RIGHT swiping");
              //   }
              // },
              // swipeCompleteCallback:
              //     (CardSwipeOrientation orientation, int index) {
              //   print(orientation.toString());
              //   if (orientation == CardSwipeOrientation.LEFT) {
              //     print("Card is LEFT swiping");
              //     print(welcomeImages.length);
              //   } else if (orientation == CardSwipeOrientation.RIGHT) {
              //     print("Card is RIGHT swiping");
              //     print(welcomeImages.length);
              //   }
              // },
              ),
            );
          }, 
        ),
      )
    );
  }
  Future<List<Students>> _read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'data';
    final students = prefs.getString(key);
    List<dynamic> data = json.decode(students);
    List<Students> posts = data.map((dynamic item) => Students.fromJson(item)).toList();

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

