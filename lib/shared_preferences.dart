import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:list_students/students.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static Future<List<Students>> _read() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final key = 'data';
    final students = prefs.getString(key);
    List<dynamic> data = json.decode(students);
    List<Students> posts =
        data.map((dynamic item) => Students.fromJson(item)).toList();

    return posts;
  }
}
