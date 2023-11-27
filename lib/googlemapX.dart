import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Walk Path Chooser",
      home: const WalkPathPage(),
    );
  }
}

class WalkPathPage extends StatefulWidget {
  const WalkPathPage({Key? key}) : super(key: key);

  @override
  State<WalkPathPage> createState() => _WalkPathPageState();
}

class _WalkPathPageState extends State<WalkPathPage> {
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _initializeMarkers();
  }

  void _initializeMarkers() {
    //미리 정해진 마커들을 추가
    _markers.add(
      Marker(
        markerId: MarkerId('marker_1'),
        position: LatLng(36.36615, 127.3480), // 궁동근린공원
        infoWindow: InfoWindow(
          title: '궁동근린공원',
        ),
      ),
    );
    _markers.add(
      Marker(
        markerId: MarkerId('marker_2'),
        position: LatLng(36.37268, 127.3254), // 노은동은구비공원
        infoWindow: InfoWindow(
          title: '은구비공원',
        ),
      ),
    );
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("경로 지정"),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('산책 경로를 정해주세요'),
            trailing: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Scaffold(
                    appBar: AppBar(
                      title: const Text('구글 지도에서 경로 선택'),
                    ),
                    body: GoogleMap(
                      onMapCreated: (controller) {

                      },
                      initialCameraPosition: CameraPosition(
                        target: LatLng(37.566535, 126.97796919999996),
                        zoom: 14,
                      ),
                      markers: _markers,
                      onTap: (LatLng location) {
                        // 사용자가 지도를 탭했을 때
                      },
                    ),
                  ),
                ));
              },
              child: const Icon(Icons.map),
            ),
          ),
        ],
      ),
    );
  }
}