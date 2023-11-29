import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'loginLogic.dart'; // LoginLogic 클래스를 사용하기 위해 import 합니다.

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // 이 줄이 필요한 경우에만 추가합니다.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyLoginApp());
}

class MyLoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginLogic loginLogic = LoginLogic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              'Images/loginimage.png',
              height: 200,
            ),
            SizedBox(height: 48),
            TextField(
              controller: emailController, // emailController를 해당 TextField에 연결합니다.
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'ID/Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: passwordController, // passwordController를 해당 TextField에 연결합니다.
              obscureText: true, // 비밀번호를 별표(*) 처리
              decoration: InputDecoration(
                labelText: '비밀번호',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              child: Text('로그인'),
              onPressed: () async {
                // 로그인 로직 구현
                final email = emailController.text;
                final password = passwordController.text;
                try {
                  final user = await loginLogic.signIn(email, password);
                  print('User logged in: ${user?.user?.email ?? 'No email'}');
                  // 성공시 -> 메인페이지로 이동
                } catch (e) {
                  print(e.toString());
                  // 실패시 -> 없는 계정이나 id/pw 오류 안내창 표시
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}