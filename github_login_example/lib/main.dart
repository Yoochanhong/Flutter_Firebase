import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:github_login_example/private.dart';
import 'dart:convert';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final flutterWebviewPlugin = FlutterWebviewPlugin();
  String? accessToken;

  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin.onUrlChanged.listen((url) {
      if (url.startsWith(redirectUrl)) {
        final code = url.split('code=')[1];
        getAccessToken(code);
      }
    });
  }

  void getAccessToken(String code) async {
    final response = await http.post(
      Uri.parse('https://github.com/login/oauth/access_token'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: jsonEncode({
        'client_id': clientId,
        'client_secret': clientSecret,
        'code': code,
      }),
    );
    final responseJson = jsonDecode(response.body);
    setState(() {
      accessToken = responseJson['access_token'];
    });
    print(accessToken);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: accessToken == null
          ? Center(
              child: ElevatedButton(
                child: const Text('Login with GitHub'),
                onPressed: () {
                  flutterWebviewPlugin.launch(
                    'https://github.com/login/oauth/authorize?client_id=$clientId&redirect_uri=$redirectUrl',
                    clearCache: true,
                    clearCookies: true,
                  );
                },
              ),
            )
          : const Center(
              child: Text(
                '성공',
              ),
            ),
    );
  }
}
