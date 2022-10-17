import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var firestore = FirebaseFirestore.instance;
  var collection = "강좌";
  var doc = "클래스유";
  var title;

  @override
  void initState() {
    title ??= "";
    print("init : " + title);
  }

  @override
  Widget build(BuildContext context) {
    print("build : " + title);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("강의  : $title"),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                ElevatedButton(
                  ///클릭하면 데이터를 추가해줌
                  onPressed: () {
                    firestore
                        .collection(collection)
                        .doc(doc)
                        .set({'만족도': 100, 'title': 'Do it Flutter'});
                    print('save');
                  },
                  child: Text(
                    "Create",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Read",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Update",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Delete",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
