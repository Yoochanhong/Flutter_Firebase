import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인 성공하면 뜨는 페이지'),
        centerTitle: true,

        /// 앱바 제목 가운데 정렬
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut(); ///로그아웃 버튼
            },
            icon: Icon(Icons.exit_to_app_sharp),
          ),
        ],
      ),
      body: Center(
        child: Text(
          'SuccessScreen',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
