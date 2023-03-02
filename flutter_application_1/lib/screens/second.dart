import 'dart:convert';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/secondscreen.dart';
import 'package:http/http.dart' as http;

class second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              "Wellcome....",
              style: TextStyle(color: Colors.white, fontSize: 25),
            )),
        body: Container(
          child: Center(
            child: Container(
              color: Colors.transparent,
              height: 50,
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent),
                child: Text(
                  "Go for your quote",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  print("pressed");
                  // var url = Uri.parse('https://randomuser.me/api/?results=10');
                  var url = Uri.parse('https://zenquotes.io/api/random');
                  var response = await http.get(url);
                  print('Response status: ${response.statusCode}');
                  print('Response body: ${response.body}');
                  final json = jsonDecode(response.body);
                  print(json[0]['q']);
                  //  setState(){}
                  String quote = json[0]['q'];
                  String name = json[0]['a'];

                  print("done!!");
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => secondscreen(
                            quotetext: quote,
                            nametext: name,
                          )));
                },
              ),
            ),
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blueGrey.shade300, Colors.black],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
        ));
  }
}
