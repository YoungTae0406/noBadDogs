import 'package:flutter/material.dart';
import 'googlemap.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'post',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyPostPage(),
    );
  }
}

class MyPostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            // Handle back button
          },
        ),
        title: Text('글 쓰기'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('산책 경로를 정해주세요', style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            Expanded(
              child: Image.asset(
                'Image/postexample.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),

            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              // Column을 Center 위젯으로 감싸서 가운데 정렬
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('산책 예상 시간', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                    Text('25분', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                    SizedBox(height: 16),

                    SizedBox(height: 8),
                    Text('산책 예상 시간', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                    Text('12000원', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                    SizedBox(height: 16),
                    Text('본문 입력', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '본문 입력',
                      ),
                    ),
                ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.photo),
                    onPressed: () {

                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.camera_alt),
                    onPressed: () {
          // Handle camera button press
                    },
                  ),
              ],
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // 등록핸들
                },
                child: Text('등록'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
