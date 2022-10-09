import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인이 성공하면 보이는 화면'),

        ///제목 가운데정렬
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut(); ///로그아웃
            },
            icon: Icon(
              Icons.exit_to_app_sharp,
            ),
          ),
        ],
      ),
      body: Center(
        child: Text(
          '로그인 성공',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
