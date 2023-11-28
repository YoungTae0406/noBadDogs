import 'package:flutter/material.dart';
import 'loginPage.dart';

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black // 색상 변경
      ..style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(size.width / 2, size.height); // 중앙 하단에서 시작
    path.lineTo(0, 0); // 왼쪽 상단으로 이동
    path.lineTo(size.width, 0); // 오른쪽 상단으로 이동
    path.close(); // 처음의 점과 연결하여 도형을 완성

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class Triangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TrianglePainter(),
    );
  }
}

void main() {
  runApp(MyMainApp());
}

class MyMainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '메인 페이지',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => MainPage(),

      },

    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Container(
                  //padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Column(
                    children: <Widget>[
                      Image.asset('Images/main.jpg'), // 메인이미지
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 15, top: 10),
                            child: Row(
                              children: [
                                Text(
                                  '대전광역시 유성구 궁동',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  width: 24,
                                  height: 24,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 4, top: 7, right: 4, bottom: 5),
                                    child: Triangle(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        // 가로선 그리기
                        color: Colors.black, // 가로선 색상 설정
                        height: 20, // 가로선 높이 설정
                        thickness: 2, // 가로선 두께 설정
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text(
                              '키워드로 알맞은 강아지 검색',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Image.asset(
                            'Images/이미지2.png', // 이미지의 경로를 지정해야 합니다.
                            width: 25, // 이미지의 너비 설정
                            height: 25, // 이미지의 높이 설정
                          ),
                        ],
                      ),
                      Divider(
                        // 가로선 그리기
                        color: Colors.black, // 가로선 색상 설정
                        height: 20, // 가로선 높이 설정
                        thickness: 2, // 가로선 두께 설정
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              //강아지리스트
              padding: EdgeInsets.zero,
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: index % 2 == 0 ? Colors.grey : Colors.blue,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 411,
                        height: 178,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 169.50,
                              top: 118.94,
                              child: Container(
                                width: 200,
                                height: 21.47,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 62,
                                        height: 21.47,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFFD9D9D9),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(35),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 70,
                                      top: 0,
                                      child: Container(
                                        width: 62,
                                        height: 21.47,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFFD9D9D9),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(35),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 138,
                                      top: 0,
                                      child: Container(
                                        width: 62,
                                        height: 21.47,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFFD9D9D9),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(35),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 10,
                                      top: 5.37,
                                      child: SizedBox(
                                        width: 44,
                                        height: 12.07,
                                        child: Text(
                                          '소형견',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 7,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 80,
                                      top: 5.37,
                                      child: SizedBox(
                                        width: 44,
                                        height: 12.07,
                                        child: Text(
                                          '물지않아요',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 7,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 148,
                                      top: 5.37,
                                      child: SizedBox(
                                        width: 44,
                                        height: 12.07,
                                        child: Text(
                                          '물어요',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 7,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 25,
                              top: 25,
                              child: Container(
                                width: 317.50,
                                height: 134.17,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 148.50,
                                      top: 26.81,
                                      child: SizedBox(
                                        width: 160,
                                        height: 40.25,
                                        child: Text(
                                          '호두(7세, 여)\n',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 151.50,
                                      top: 57.03,
                                      child: SizedBox(
                                        width: 166,
                                        height: 38.91,
                                        child: Text(
                                          '2km, 1만원',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 135.35,
                                        height: 134.17,
                                        decoration: ShapeDecoration(
                                          image: DecorationImage(
                                            image:
                                            AssetImage('Images/개이미지.png'),
                                            fit: BoxFit.fill,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(width: 3),
                                            borderRadius:
                                            BorderRadius.circular(30),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 326.50,
                              top: 19,
                              child: Container(
                                width: 60,
                                height: 25,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                            AssetImage("Images/이미지4.png"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 30,
                                      top: 7,
                                      child: SizedBox(
                                        width: 30,
                                        height: 17.44,
                                        child: Text(
                                          '방금 전',
                                          style: TextStyle(
                                            color:
                                            Colors.black.withOpacity(0.5),
                                            fontSize: 9,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 314.50,
                              top: 148,
                              child: Container(
                                width: 73,
                                height: 25,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 66,
                                      top: 7.14,
                                      child: SizedBox(
                                        width: 7,
                                        height: 17.44,
                                        child: Text(
                                          '2',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 9,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                            AssetImage("Images/이미지5.png"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 38,
                                      top: 0,
                                      child: Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                            AssetImage("Images/이미지5.png"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 28,
                                      top: 7,
                                      child: SizedBox(
                                        width: 7,
                                        height: 17.44,
                                        child: Text(
                                          '1',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 9,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 411,
                        height: 178,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 169.50,
                              top: 118.94,
                              child: Container(
                                width: 200,
                                height: 21.47,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 62,
                                        height: 21.47,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFFD9D9D9),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(35),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 70,
                                      top: 0,
                                      child: Container(
                                        width: 62,
                                        height: 21.47,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFFD9D9D9),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(35),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 138,
                                      top: 0,
                                      child: Container(
                                        width: 62,
                                        height: 21.47,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFFD9D9D9),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(35),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 10,
                                      top: 5.37,
                                      child: SizedBox(
                                        width: 44,
                                        height: 12.07,
                                        child: Text(
                                          '소형견',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 7,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 80,
                                      top: 5.37,
                                      child: SizedBox(
                                        width: 44,
                                        height: 12.07,
                                        child: Text(
                                          '물지않아요',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 7,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 148,
                                      top: 5.37,
                                      child: SizedBox(
                                        width: 44,
                                        height: 12.07,
                                        child: Text(
                                          '물어요',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 7,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 25,
                              top: 25,
                              child: Container(
                                width: 317.50,
                                height: 134.17,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 148.50,
                                      top: 26.81,
                                      child: SizedBox(
                                        width: 160,
                                        height: 40.25,
                                        child: Text(
                                          '호두(7세, 여)\n',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 151.50,
                                      top: 57.03,
                                      child: SizedBox(
                                        width: 166,
                                        height: 38.91,
                                        child: Text(
                                          '2km, 1만원',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 135.35,
                                        height: 134.17,
                                        decoration: ShapeDecoration(
                                          image: DecorationImage(
                                            image:
                                            AssetImage('Images/개이미지.png'),
                                            fit: BoxFit.fill,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(width: 3),
                                            borderRadius:
                                            BorderRadius.circular(30),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 326.50,
                              top: 19,
                              child: Container(
                                width: 60,
                                height: 25,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                            AssetImage("Images/이미지4.png"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 30,
                                      top: 7,
                                      child: SizedBox(
                                        width: 30,
                                        height: 17.44,
                                        child: Text(
                                          '방금 전',
                                          style: TextStyle(
                                            color:
                                            Colors.black.withOpacity(0.5),
                                            fontSize: 9,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 314.50,
                              top: 148,
                              child: Container(
                                width: 73,
                                height: 25,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 66,
                                      top: 7.14,
                                      child: SizedBox(
                                        width: 7,
                                        height: 17.44,
                                        child: Text(
                                          '2',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 9,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                            AssetImage("Images/이미지5.png"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 38,
                                      top: 0,
                                      child: Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                            AssetImage("Images/이미지5.png"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 28,
                                      top: 7,
                                      child: SizedBox(
                                        width: 7,
                                        height: 17.44,
                                        child: Text(
                                          '1',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 9,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 411,
                        height: 178,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 169.50,
                              top: 118.94,
                              child: Container(
                                width: 200,
                                height: 21.47,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 62,
                                        height: 21.47,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFFD9D9D9),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(35),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 70,
                                      top: 0,
                                      child: Container(
                                        width: 62,
                                        height: 21.47,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFFD9D9D9),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(35),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 138,
                                      top: 0,
                                      child: Container(
                                        width: 62,
                                        height: 21.47,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFFD9D9D9),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(35),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 10,
                                      top: 5.37,
                                      child: SizedBox(
                                        width: 44,
                                        height: 12.07,
                                        child: Text(
                                          '소형견',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 7,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 80,
                                      top: 5.37,
                                      child: SizedBox(
                                        width: 44,
                                        height: 12.07,
                                        child: Text(
                                          '물지않아요',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 7,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 148,
                                      top: 5.37,
                                      child: SizedBox(
                                        width: 44,
                                        height: 12.07,
                                        child: Text(
                                          '물어요',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 7,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 25,
                              top: 25,
                              child: Container(
                                width: 317.50,
                                height: 134.17,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 148.50,
                                      top: 26.81,
                                      child: SizedBox(
                                        width: 160,
                                        height: 40.25,
                                        child: Text(
                                          '호두(7세, 여)\n',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 151.50,
                                      top: 57.03,
                                      child: SizedBox(
                                        width: 166,
                                        height: 38.91,
                                        child: Text(
                                          '2km, 1만원',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 135.35,
                                        height: 134.17,
                                        decoration: ShapeDecoration(
                                          image: DecorationImage(
                                            image:
                                            AssetImage('Images/개이미지.png'),
                                            fit: BoxFit.fill,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(width: 3),
                                            borderRadius:
                                            BorderRadius.circular(30),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 326.50,
                              top: 19,
                              child: Container(
                                width: 60,
                                height: 25,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                            AssetImage("Images/이미지4.png"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 30,
                                      top: 7,
                                      child: SizedBox(
                                        width: 30,
                                        height: 17.44,
                                        child: Text(
                                          '방금 전',
                                          style: TextStyle(
                                            color:
                                            Colors.black.withOpacity(0.5),
                                            fontSize: 9,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 314.50,
                              top: 148,
                              child: Container(
                                width: 73,
                                height: 25,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 66,
                                      top: 7.14,
                                      child: SizedBox(
                                        width: 7,
                                        height: 17.44,
                                        child: Text(
                                          '2',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 9,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                            AssetImage("Images/이미지5.png"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 38,
                                      top: 0,
                                      child: Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                            AssetImage("Images/이미지5.png"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 28,
                                      top: 7,
                                      child: SizedBox(
                                        width: 7,
                                        height: 17.44,
                                        child: Text(
                                          '1',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 9,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 411,
                        height: 178,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 169.50,
                              top: 118.94,
                              child: Container(
                                width: 200,
                                height: 21.47,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 62,
                                        height: 21.47,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFFD9D9D9),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(35),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 70,
                                      top: 0,
                                      child: Container(
                                        width: 62,
                                        height: 21.47,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFFD9D9D9),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(35),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 138,
                                      top: 0,
                                      child: Container(
                                        width: 62,
                                        height: 21.47,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFFD9D9D9),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(35),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 10,
                                      top: 5.37,
                                      child: SizedBox(
                                        width: 44,
                                        height: 12.07,
                                        child: Text(
                                          '소형견',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 7,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 80,
                                      top: 5.37,
                                      child: SizedBox(
                                        width: 44,
                                        height: 12.07,
                                        child: Text(
                                          '물지않아요',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 7,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 148,
                                      top: 5.37,
                                      child: SizedBox(
                                        width: 44,
                                        height: 12.07,
                                        child: Text(
                                          '물어요',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 7,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 25,
                              top: 25,
                              child: Container(
                                width: 317.50,
                                height: 134.17,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 148.50,
                                      top: 26.81,
                                      child: SizedBox(
                                        width: 160,
                                        height: 40.25,
                                        child: Text(
                                          '호두(7세, 여)\n',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 151.50,
                                      top: 57.03,
                                      child: SizedBox(
                                        width: 166,
                                        height: 38.91,
                                        child: Text(
                                          '2km, 1만원',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 135.35,
                                        height: 134.17,
                                        decoration: ShapeDecoration(
                                          image: DecorationImage(
                                            image:
                                            AssetImage('Images/개이미지.png'),
                                            fit: BoxFit.fill,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(width: 3),
                                            borderRadius:
                                            BorderRadius.circular(30),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 326.50,
                              top: 19,
                              child: Container(
                                width: 60,
                                height: 25,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                            AssetImage("Images/이미지4.png"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 30,
                                      top: 7,
                                      child: SizedBox(
                                        width: 30,
                                        height: 17.44,
                                        child: Text(
                                          '방금 전',
                                          style: TextStyle(
                                            color:
                                            Colors.black.withOpacity(0.5),
                                            fontSize: 9,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 314.50,
                              top: 148,
                              child: Container(
                                width: 73,
                                height: 25,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 66,
                                      top: 7.14,
                                      child: SizedBox(
                                        width: 7,
                                        height: 17.44,
                                        child: Text(
                                          '2',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 9,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                            AssetImage("Images/이미지5.png"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 38,
                                      top: 0,
                                      child: Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                            AssetImage("Images/이미지5.png"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 28,
                                      top: 7,
                                      child: SizedBox(
                                        width: 7,
                                        height: 17.44,
                                        child: Text(
                                          '1',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 9,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
