import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'review.dart';

void main() {
  runApp(MyWStatus());
}

class MyWStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // 이전 화면으로 돌아가기
            },
          ),
          title: Container(

            child: Text(
              '산책 현황',
              style: TextStyle(
                color: Color(0xFF020202),
                fontSize: 24,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                letterSpacing: 0.37,
              ),
            ),
          ),
        ),
        body: ListView(
          children: [
            walktime(),
            googlemaps(),
            Camera(),
          ],
        ),
      ),
    );
  }
}

class walktime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'Images/present.png',
          width: 350.0,
          height: 350.0,
        ),
        // 다른 위젯들을 추가할 수 있습니다.
      ],
    );
  }
}

class googlemaps extends StatefulWidget {
  @override
  _googlemapsState createState() => _googlemapsState();
}

class _googlemapsState extends State<googlemaps> {
  late Completer<GoogleMapController> _controller;
  static const LatLng _center = const LatLng(37.422, -122.084);

  @override
  void initState() {
    super.initState();
    _controller = Completer<GoogleMapController>();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '현위치',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              height: 1.0,
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            width: 350.0,
            height: 250.0,
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Camera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to another Dart file when the image is clicked
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Review()),
        );
      },
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Review()),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.pink),
            ),
            child: Text('확인'),
          ),
        ],
      ),
    );
  }
}






