import 'package:flutter/material.dart';
import 'package:nobaddogs/loginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '회원가입 페이지',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            Text(

              '아이디를 작성해주세요',
              style: TextStyle(
                fontSize: 15.0,
              )
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: '아이디',
                hintText: '아이디를 입력해주세요',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '아이디를 입력해주세요';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            Text(
                '닉네임을 작성해주세요',
                style: TextStyle(
                  fontSize: 15.0,
                )
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: '닉네임',
                hintText: '닉네임을 입력해주세요',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '닉네임을 입력해주세요';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            Text(
                '비밀번호를 작성해주세요',
                style: TextStyle(
                  fontSize: 15.0,
                )
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: '비밀번호',
                hintText: '비밀번호를 입력해주세요',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
                '비밀번호를 다시 작성해주세요',
                style: TextStyle(
                  fontSize: 15.0,
                )
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: '비밀번호 확인',
                hintText: '비밀번호를 다시 입력해주세요',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),

                  );
                  // 입력된 데이터가 유효한지 아닌지 확인
                }
              },
              child: Text('다음'),
              style: ElevatedButton.styleFrom(
                primary: Colors.pink,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
