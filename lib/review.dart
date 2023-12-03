import 'package:flutter/material.dart';
import 'MainPage.dart';

void main() {
  runApp(Review());
}

class Review extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: null,
        body: Stack(
          children: [
            Image.asset(
              'Images/review.png',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(16.0), // 적절한 패딩을 추가합니다.
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.pink),
                  ),
                  child: Text('완료'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
