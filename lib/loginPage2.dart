import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'loginLogic.dart';
import 'mainpage.dart';
import 'signUpPage.dart';

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
      initialRoute: '/',
      routes : {
        '/': (context) => LoginPage(),
        '/main' : (context) => MainPage(),
        '/signuppage' : (context) => SignUpPage(),
      },
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
                if(email.isEmpty || password.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('오류'),
                      content: Text('이메일과 비밀번호를 모두 입력해주세요.'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('닫기'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  );
                  return;
                }
                try {
                  final user = await loginLogic.signIn(email, password);
                  if (user != null) {
                    Navigator.pushReplacement( // Navigator.push 대신에 pushReplacement를 사용합니다.
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                    );
                  }
                  print('User logged in: ${user?.user?.email ?? 'No email'}');
                  // 성공시 -> 메인페이지로 이동
                } catch (e) {
                  print(e.toString());
                  // 실패시 -> 없는 계정이나 id/pw 오류 안내창 표시
                }
              },
            ),
            ElevatedButton(
                child: Text('회원가입'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                }
            ),

          ],
        ),
      ),
    );
  }
}