import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.pink,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => MyPage(),

        }
    );
  }
}
class MyPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('프로필'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
                child: Card(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage('Image/profilePhoto.png'),
                        ),
                        title: Text('김민수'),
                        subtitle: Text('강아지를 사랑하는 집사'),
                        trailing: IconButton(
                          icon: Icon(Icons.settings),
                          onPressed: () {
                            // 설정 아이콘 클릭 시 작동할 기능인데 나중에
                          },
                        ),
                      ),
                      ListTile(
                        title: Text('이름: 뽀삐'),
                        subtitle: Text('종: 말티즈\n나이: 25개월\n성별: 남'),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child:

                Image.asset('Image/profilePhoto.png'),
                height: 200,
              ),
              SizedBox(height: 16),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // 세로축 기준 중앙 정렬
                  crossAxisAlignment: CrossAxisAlignment.center, // 가로축 기준 중앙 정렬
                  children: <Widget>[
                    Text(
                      '평균 별점',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 12),
                    Text(
                      '4.0점/5.0점',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return Icon(
                          index < 4 ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                        );
                      }),
                    ),
                  ],
                ),
              ),

              Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      )
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '최근 후기',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '젠틀하시고 좋은 분이셨어요!!\n'
                              '나중에 또 부탁드리고 싶네요',
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ]

                  )
              ),

            ],
          ),
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