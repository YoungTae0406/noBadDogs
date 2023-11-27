import 'package:flutter/material.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(
          children: [
            GooglePixel2Xl7(),
          ],
        ),
      ),
    );
  }
}

class GooglePixel2Xl7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 411,
      height: 823,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 44),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 411,
              height: 280,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('Images/개이미지.png'), // 그림 파일 경로
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(height: 19),
          Container(
            width: double.infinity, // 폭을 화면의 폭으로 확장
            height: 50,
            color: Colors.pink, // 핑크색으로 변경
            child: Row(
              children: [
                SizedBox(width: 10),
                Text(
                  '멍뭉이(3세, 남)',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                SizedBox(width: 100),
                Text(
                  '2km',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  '10,000 ₩',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  '25분 ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            color: Colors.white60,
            child: Row(
              children: [
                SizedBox(width: 12),
                Container(
                  width: 25,
                  height: 25,
                  padding: EdgeInsets.only(left: 501.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('Images/개이미지.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Text(
                  '동글이',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                SizedBox(width: 140),
                Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('Images/개이미지.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(width: 4),
                Text(
                  '방금 전',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 9,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  '유성구 봉명동  ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 29,
            padding: EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                Container(
                  width: 112,
                  height: 29,
                  decoration: BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Center(
                    child: Text(
                      '대형견',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 18),
                Container(
                  width: 112,
                  height: 29,
                  decoration: BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Center(
                    child: Text(
                      '착해요',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 18),
                Container(
                  width: 112,
                  height: 29,
                  decoration: BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Center(
                    child: Text(
                      '호기심많아요',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
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
          SizedBox(height: 18),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: SizedBox(
              width: 375,
              height: 186,
              child: Text(
                '저희 강아지는 어려서부터 교육을 잘해서 입질은 안해요. 그래도 다른 사람 지나갈 때는 조심해주세요.ㅎㅎㅎ',
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
          SizedBox(height: 8),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 50,
              height: 112,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 62,
                    child: Container(
                      width: 50,
                      height: 50,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('Images/개이미지.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 50,
                      height: 50,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 5),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Container(
                          width: 26.25,
                          height: 26.25,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('Images/개이미지.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
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
    );
  }
}
