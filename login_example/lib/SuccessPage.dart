import 'package:flutter/material.dart';

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
