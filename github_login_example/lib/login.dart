import 'package:flutter/material.dart';
import 'package:github_login/github_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:github_sign_in/github_sign_in.dart';
import 'package:github_login_example/private.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> githubLogin() async {
      final GitHubSignIn gitHubSignIn = GitHubSignIn(
          clientId: clientId,
          clientSecret: clientSecret,
          redirectUrl: redirectUrl);
      var result = await gitHubSignIn.signIn(context);
      switch (result.status) {
        case GitHubSignInResultStatus.ok:
          print(result.token);
          break;

        case GitHubSignInResultStatus.cancelled:
        case GitHubSignInResultStatus.failed:
          print(result.errorMessage);
          break;
      }
    }

    return Scaffold(
      body: Center(
        child: MaterialButton(
          color: Colors.black,
          onPressed: () {
            githubLogin();
          },
          child: Text(
            '깃허브 로그인',
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
