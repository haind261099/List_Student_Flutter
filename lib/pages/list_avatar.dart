import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:http/http.dart';
import 'package:list_students/http_service.dart';
import 'package:list_students/store/student_store.dart';
import 'package:list_students/students.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListAvatar extends StatefulWidget {
  final StudentStore studentStore = StudentStore();

  ListAvatar() {
    studentStore.getStudents();
    studentStore.changeListType();
  }

  @override
  _ListAvatarState createState() => _ListAvatarState();
}

class _ListAvatarState extends State<ListAvatar> {
  final HttpService httpService = HttpService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.studentStore.runReactionDisposer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.studentStore.releaseReaction();
  }

  @override
  Widget build(BuildContext context) {
    final future = widget.studentStore.students;
    return Scaffold(
        appBar: AppBar(title: Text('List Avatar'), centerTitle: true, actions: [
          InkWell(
            child: Icon(Icons.list),
            onTap: widget.studentStore.changeListType,
          ),
        ]),
        body: Center(
          child: Observer(
            builder: (context){
              bool listType = widget.studentStore.listType;
              return FutureBuilder(
                future: future,
                builder: (BuildContext context,
                    AsyncSnapshot<List<Students>> snapshot) {
                  // var getData = json.decode(snapshot.data.toString());
                  List<Students> students = snapshot.data;
                  
                  if (students == null) {
                    return CircularProgressIndicator();
                  }

                  //listType == false ? GridView : ListView
                  if (listType == false) {
                    return GridView.count(
                      crossAxisCount: 3, //moi hang hien thi 3 anh
                      crossAxisSpacing: 10, //khoang cach giua 2 anh
                      mainAxisSpacing: 10, //khoang cach giua 2 hang
                      children: <Widget>[
                        for (var i = 0; i < students.length; i++)
                          Image(
                            image: AssetImage(students[i].avatar),
                            fit: BoxFit.cover,
                          )
                      ],
                    );
                  } else if (listType == true) {
                    return ListView.builder(
                      itemCount: students.length,
                      itemBuilder: (context, item) {
                        return ListBody(
                          children: [
                            Card(
                                child: Image(
                              image: AssetImage(students[item].avatar),
                            )),
                          ],
                        );
                      },
                    );
                  }
                });
            } 
          ),
        ));
  }

  _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('data');
    if (data == null) {
      final String postUrl =
          "https://a76621db-af38-4376-958a-ae7d80b8ddd0.mock.pstmn.io/students";

      var response = await get(postUrl);
      final students = response.body;
      final prefs = await SharedPreferences.getInstance();
      final key = 'data';
      prefs.setString(key, students);
    }
  }

  Future<List<Students>> _read() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final key = 'data';
    final students = prefs.getString(key);
    List<dynamic> data = json.decode(students);
    List<Students> posts =
        data.map((dynamic item) => Students.fromJson(item)).toList();

    return posts;
  }
}
