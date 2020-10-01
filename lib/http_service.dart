import 'dart:convert';

import 'package:http/http.dart';
import 'students.dart';

class HttpService{
  final String postUrl = "https://a76621db-af38-4376-958a-ae7d80b8ddd0.mock.pstmn.io/students";

  Future<List<Students>> getPosts() async {
    try{
      Response res = await get(postUrl);
      if(res.statusCode == 200){
        List<dynamic> students = await json.decode(res.body);

        List<Students> posts = students.map((dynamic item) => Students.fromJson(item)).toList();

        return posts;
      } else {
        return List<Students>();
      }
    }catch(e){
      return List<Students>();
    }
  }
}