import 'package:flutter/material.dart';

class secondscreen extends StatelessWidget {
  String quotetext;
  String nametext;
  secondscreen({Key? key, required this.quotetext, required this.nametext})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Quote of the day",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        body: Container(
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    " ``$quotetext",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "- $nametext",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blueGrey.shade300, Colors.black],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
        ),
      ),
    );
  }
}
