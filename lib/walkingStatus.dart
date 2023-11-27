import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:camera/camera.dart';

void main() {
  runApp(MyMap());
}

class MyMap extends StatelessWidget {
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
            camera(),
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
          'assert/present.png',
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

class camera extends StatefulWidget {
  @override
  _cameraState createState() => _cameraState();
}

class _cameraState extends State<camera> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    availableCameras().then((cameras) {
      final firstCamera = cameras.first;
      _controller = CameraController(
        firstCamera,
        ResolutionPreset.medium,
      );
      _initializeControllerFuture = _controller.initialize();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CameraScreen(controller: _controller),
          ),
        );
      },
      child: Column(
        children: [
          Image.asset(
            'assert/camera.png',
            width: 100,
            height: 100,
          ),
          // 다른 위젯들을 추가할 수 있습니다.
        ],
      ),
    );
  }
}

class CameraScreen extends StatefulWidget {
  final CameraController controller;

  const CameraScreen({required this.controller});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  @override
  void initState() {
    super.initState();
    widget.controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.controller.value.isInitialized) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('카메라 모드'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // 이전 화면으로 돌아가기
          },
        ),
      ),
      body: CameraPreview(widget.controller),
    );
  }
}





