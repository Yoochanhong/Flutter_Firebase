import 'package:flutter/material.dart';
import 'package:github_login/github_login.dart';
import 'package:github_login_example/private.dart';
import 'package:github_sign_in/github_sign_in.dart';
import 'package:github_login/github_login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<UserCredential> signInWithGitHub() async {
      // Create a new provider
      GithubAuthProvider githubProvider = GithubAuthProvider();

      return await FirebaseAuth.instance.signInWithProvider(githubProvider);
    }

    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              signInWithGitHub();
            },
            child: Text('깃허브 로그인')),
      ),
    );
  }
}

class Success extends StatelessWidget {
  const Success({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Success"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: const [Text("로그인에 성공하셨습니다!")],
        ),
      ),
    );
  }
}
