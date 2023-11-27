import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDefault();
  runApp(const MyApp());
}

Future<void> initializeDefault() async {
  FirebaseApp app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print('Initialized default app $app');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Firebase Event', analytics: analytics),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title, required this.analytics});

  final String title;
  final FirebaseAnalytics analytics;


  @override
  State<MyHomePage> createState() => _MyHomePageState(analytics);
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState(this.analytics);

  final FirebaseAnalytics analytics;

  String _message = '';
  String _readDataKey = 'Key';
  String _readDataValue = 'Value';
  String _content = "content_here";

  // void setDBData(Map<dynamic, dynamic> data) {
  //   setState(() {
  //   // Initialize _content or use your own initialization logic
  //     data.forEach((key, value) {
  //       _content += '$key: $value\n'; // Concatenate key-value pairs to _content
  //     });
  //   });
  // }

  // Future<void> readData() async {
  //   FirebaseDatabase realtime = FirebaseDatabase.instance;
  //
  //   DataSnapshot snapshot = await realtime.ref().child("posts/2").get();
  //   Map<dynamic, dynamic> value = snapshot.value as Map<dynamic, dynamic>;
  //
  //   setDBData(value);
  // }

  void setDBData(List<Map<dynamic, dynamic>> dataList) {
    setState(() {
      _content = ''; // Initialize _content or use your own initialization logic
      for (var data in dataList) {
        data.forEach((key, value) {
          _content += '$key: $value\n'; // Concatenate key-value pairs to _content
        });
      }
    });
  }

  Future<void> readData() async {
    FirebaseDatabase realtime = FirebaseDatabase.instance;

    try {
      List<String> postNumbers = ['1', '2']; // Specify the post numbers here
      List<Map<dynamic, dynamic>> dataList = [];

      for (var postNumber in postNumbers) {
        DataSnapshot snapshot = await realtime.ref().child("posts/$postNumber").get();
        Map<dynamic, dynamic> value = snapshot.value as Map<dynamic, dynamic>;

        // Add the retrieved data to a list
        if (value != null) {
          dataList.add(value);
        }
      }

      // Process the collected data list as needed
      setDBData(dataList);
    } catch (error) {
      print('Failed to fetch data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // https://basic231107-default-rtdb.firebaseio.com/
            ElevatedButton(
              onPressed: readData,
              child: const Text('readData'),
            ),
            Text(
              //'KEY : $_readDataKey, VALUE : $_readDataValue',
              '$_content',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              _message,
              style: const TextStyle(color: Colors.blueAccent),
            ),
          ],
        ),
      ),
    );
  }
}
