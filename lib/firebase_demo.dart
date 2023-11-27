import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirebaseDemo(),
    );
  }
}

class FirebaseDemo extends StatefulWidget {
  @override
  _FirebaseDemoState createState() => _FirebaseDemoState();
}

class _FirebaseDemoState extends State<FirebaseDemo> {
  late DatabaseReference _databaseReference;
  List<Map<dynamic, dynamic>> _postsData = [];

  @override
  void initState() {
    super.initState();
    _initializeDatabaseReference();
    _fetchDataFromFirebase();
  }

  void _initializeDatabaseReference() {
    _databaseReference = FirebaseDatabase.instance.ref('posts/1');
  }

  Future<void> _fetchDataFromFirebase() async {
    try {
      DataSnapshot snapshot = await _databaseReference.get();
      if (snapshot.value != null) {
        Map<dynamic, dynamic>? values = snapshot.value as Map<dynamic, dynamic>?;

        if (values != null) {
          setState(() {
            _postsData = values.values.toList().cast<Map<dynamic, dynamic>>();
          });
        }
      } else {
        print('No data available.');
      }
    } catch (error) {
      print('Failed to fetch data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Posts (${_postsData.length} times)'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: ListView.builder(
            itemCount: _postsData.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Dog Name: ${_postsData[index]['dog_name']}'),
                subtitle: Text('Likes: ${_postsData[index]['like']}'),
              );
            },
          ),
        ),
      ),
    );
  }
}