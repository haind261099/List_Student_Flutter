import 'dart:convert';

import 'package:dio/dio.dart';

import 'students.dart';

class StudentApi {
  Dio dio = Dio();

  final String postUrl =
      'https://a76621db-af38-4376-958a-ae7d80b8ddd0.mock.pstmn.io/students';

  Future<List<Students>> getPost() async {
    try {
      var response = await dio.get(postUrl);

      if (response.statusCode == 200) {
        List<dynamic> students = await json.decode(response.data);

        List<Students> posts =
            students.map((dynamic item) => Students.fromJson(item)).toList();
        return posts;
      }
    } catch (e) {
      return List<Students>();
    }
  }
}
