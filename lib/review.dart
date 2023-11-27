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
            Center(
              child: Image.asset(
                'Image/review.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 200,
              left: 0,
              right: 0,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FigmaToCodeApp()),
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
