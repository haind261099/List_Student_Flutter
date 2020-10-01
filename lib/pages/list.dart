import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:list_students/constants.dart';
import 'package:list_students/http_service.dart';
import 'package:list_students/shared_preferences.dart';
import 'package:list_students/store/student_store.dart';
import 'package:list_students/student_api.dart';
import 'package:list_students/students.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class ListStudent extends StatelessWidget {
  final HttpService httpService = HttpService();
  final StudentApi studentApi = StudentApi();
  final StudentStore studentStore = StudentStore();
  ListStudent() {
    studentStore.getStudents();
  }
                                                                                                                                                                                                                                                                                                                                                                                                                                            
  @override
  Widget build(BuildContext context) {
    final future = studentStore.students;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'List Students',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        // leading: FlatButton(
        //   onPressed: _saveData(),
        // ),
      ),
      body: FutureBuilder(
        // final getData = json.decode(snapshot.data.toString());
        // students = getData
        // .map<Students>((data) => Students.fromJson(data))
        // .toList(); //tro den tat ca phan tu cua getData va chuyen ve dang List
        future: future,
        builder:
            (BuildContext context, AsyncSnapshot<List<Students>> snapshot) {
          List<Students> _students = snapshot.data;
          if (_students == null) {
            return CircularProgressIndicator();
          } else
            return ListView.builder(
              itemCount: _students
                  .length, //neu students count = null thi khong load trang
              itemBuilder: (context, item) {
                //BuildContext: dieu huong den vi tri mot Widget
                return Card(
                  elevation: 2,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(_students[item].avatar),
                            radius: 35.0,
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                _students[item].name,
                                style: TextStyle(fontSize: 25.0),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                _students[item].id.toString(),
                                style: TextStyle(fontSize: 25.0),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                );
                // return ListTile(
                //   //ListTile: Design cac item trong list
                //   onTap: (() {
                //     Navigator.of(context).pushNamed(
                //       listDetail,
                //       arguments: _students[item].toJson(),
                //     );
                //   }),
                //   leading: CircleAvatar(
                //     backgroundImage: AssetImage(_students[item].avatar),
                //   ),
                //   title: Text(_students[item].name),
                //   subtitle: Text('ID: ' + _students[item].id.toString()),
                // );
              },
            );
        },
      ),
    );
  }

  _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('data');
    var dio = Dio();
    if (data == null) {
      final String postUrl =
          "https://a76621db-af38-4376-958a-ae7d80b8ddd0.mock.pstmn.io/students";

      var response = await dio.get(postUrl);
      final students = response.data;
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
