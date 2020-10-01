import 'package:flutter/material.dart';

class ListDetail extends StatelessWidget {

  final Map data;
  ListDetail({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Student Info',
          style: TextStyle(
            fontSize: 20.0
          )
        )
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage(data["avatar"]),
                    radius: 40.0,
                  ),
                ),
                SizedBox(height: 50.0),
                Text(
                  'NAME',
                  style: TextStyle(color: Colors.grey, letterSpacing: 2.0),
                ),
                SizedBox(height: 10.0), //k hoang cach giua 2 widget
                Text(
                  data["name"],
                  style: TextStyle(
                    color: Colors.amberAccent[200],
                    letterSpacing: 2.0,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30.0),
                Text(
                  'ID',
                  style: TextStyle(color: Colors.grey, letterSpacing: 2.0),
                ),
                SizedBox(height: 10.0), //khoang cach giua 2 widget
                Text(
                  data["id"].toString(),
                  style: TextStyle(
                    color: Colors.amberAccent[200],
                    letterSpacing: 2.0,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30.0),
                Text(
                  'Age',
                  style: TextStyle(color: Colors.grey, letterSpacing: 2.0),
                ),
                SizedBox(height: 10.0), //khoang cach giua 2 widget
                Text(
                  data["age"].toString(),
                  style: TextStyle(
                    color: Colors.amberAccent[200],
                    letterSpacing: 2.0,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30.0),
                Text(
                  'Address',
                  style: TextStyle(color: Colors.grey, letterSpacing: 2.0),
                ),
                SizedBox(height: 10.0), //khoang cach giua 2 widget
                Text(
                  data["address"],
                  style: TextStyle(
                    color: Colors.amberAccent[200],
                    letterSpacing: 2.0,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]
          )
      ),
    );
  }
}