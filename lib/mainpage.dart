import 'package:flutter/material.dart';
import 'chatMainPage.dart';
import 'loginPage.dart';
import 'postView.dart';

class Dog {
  final String name;
  final String age;
  final String gender;
  final String distance;
  final String price;
  final String temperament;
  final String imageUrl;
  final Widget Function(BuildContext) pageBuilder;

  Dog({
    required this.name,
    required this.age,
    required this.gender,
    required this.distance,
    required this.price,
    required this.temperament,
    required this.imageUrl,
    required this.pageBuilder,
  });
}

final List<Dog> dogs = [
  Dog(name: '비나', age: '3세', gender: '남', distance: '2km', price: '1만원', temperament: '소형견, 물지않아요~', imageUrl: 'Images/maindog1.png', pageBuilder: (context) => PostView()),
  Dog(name: '호두', age: '6세', gender: '여', distance: '4km', price: '1만원', temperament: '소형견, 물지않아요~', imageUrl: 'Images/maindog2.png', pageBuilder: (context) => PostView()),
  Dog(name: '요미', age: '1세', gender: '여', distance: '3km', price: '1만원', temperament: '소형견, 물지않아요~', imageUrl: 'Images/maindog3.png', pageBuilder: (context) => UI3_demo()),
];

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
          Container(
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
                            'Images/maindodbogi.png', // 이미지의 경로를 지정해야 합니다.
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
              padding: EdgeInsets.zero,
              itemCount: dogs.length,
              itemBuilder: (BuildContext context, int index) {
                final dog = dogs[index];

                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: dog.pageBuilder),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10), // 주변 여백을 추가합니다.
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12), // 코너 둥글게 처리합니다.
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: Offset(0, 5), // 그림자 위치 조정
                        ),
                      ],
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                            ),
                            image: DecorationImage(
                              image: AssetImage(dog.imageUrl), // 강아지 이미지
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '${dog.name}(${dog.age}, ${dog.gender})',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  '${dog.distance}, ${dog.price}',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  dog.temperament,
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end, // 아이콘들을 오른쪽 끝에 정렬합니다.
                            children: <Widget>[
                              Icon(Icons.access_time, color: Colors.grey), // 시계 아이콘
                              SizedBox(width: 4),
                              Text('방금 전', style: TextStyle(color: Colors.grey, fontSize: 12)),
                              SizedBox(width: 16), // 아이콘 사이의 간격을 넓힙니다.
                              Icon(Icons.comment, color: Colors.grey), // 채팅 아이콘
                              SizedBox(width: 4),
                              Text('1', style: TextStyle(color: Colors.grey, fontSize: 12)),
                              SizedBox(width: 16),
                              Icon(Icons.favorite_border, color: Colors.grey), // 좋아요 아이콘
                              SizedBox(width: 4),
                              Text('2', style: TextStyle(color: Colors.grey, fontSize: 12)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
              backgroundColor: Colors.pink,

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chat',
              backgroundColor: Colors.pink,

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
              backgroundColor: Colors.pink,
            ),
          ]
      ),
    );
  }
}
