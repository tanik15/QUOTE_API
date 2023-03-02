import 'dart:convert';
import 'dart:js';

import 'package:flutter/material.dart';
// import 'package:flutter_application_1/screens/second.dart';
import 'package:http/http.dart' as http;

class homescreen extends StatelessWidget {
  List<dynamic> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Api call")),
      body: Row(
        children: [
          ListView.builder(
              itemCount: users.length,
              itemBuilder: ((context, index) {
                final user = users[index];
                // final email = user['email'];
                return ListTile(
                  title: Text("hii"),
                );
              })),
          ElevatedButton(
            child: Text("press it"),
            onPressed: () => fetchUsers(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers,
      ),
    );
  }

  void fetchUsers() async {
    // print("pressed");
    var url = Uri.parse('https://randomuser.me/api/?results=10');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');

    // print('Response body: ${response.body}');
    final json = jsonDecode(response.body);
    print(json['results'][0]['email']);
  //  setState(){}
   String quote = json['results'][0]['email'];
    

    print("done!!");
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => secondscreen()));
  }
}
//  ListView.builder(
//           itemCount: users.length,
//           itemBuilder: ((context, index) {
//             final user = users[index];
//             final email = user['email'];
//             return ListTile(
//               title: Text(email),
//             );
//           })),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           fetchUsers;
//         },
//       ),
