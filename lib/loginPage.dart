import 'package:flutter/material.dart';
import 'mainpage.dart';

import 'mainpage.dart';

void main() {
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
<<<<<<< HEAD
      initialRoute: '/',
      routes : {
        '/': (context) => LoginPage(),
        '/main' : (context) => MainPage(),
      },

=======
      home: LoginPage(),
>>>>>>> 548eedb69aa62bdf81a15403e9fcf5381076da54
    );
  }
}

class LoginPage extends StatelessWidget {
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
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'ID/Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true, // 비밀번호를 별표(*) 처리
              decoration: InputDecoration(
                labelText: '비밀번호',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              child: Text('로그인'),
              onPressed: () {
                //if(){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                );
                //}
                // 로그인 로직 구현해야됨
              },
            ),
          ],
        ),
      ),
    );
  }
}
