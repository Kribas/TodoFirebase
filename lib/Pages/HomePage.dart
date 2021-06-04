import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_firebase/GetXHelper/FirebaseController.dart';

class HomePage extends GetWidget<FirebaseController> {

  TextEditingController _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(icon: Icon(Icons.logout), onPressed: () {
            controller.signOut();
          })
        ],
      ),
      body: Column(

        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              alignment: Alignment.center,
              child: Text("Add Todo Here:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(20),
            child: Padding(padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                      controller: _todoController,
                    )
                ),
                IconButton(icon: Icon(Icons.add), onPressed: () {})
              ],
            ),
            ),
          )
        ],
      ),
    );
  }
}
