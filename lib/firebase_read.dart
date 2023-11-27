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
  FirebaseApp app = await Firebase.initializeApp();
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

  void setMessage(String message) {
    setState(() {
      _message = message;
    });
  }

  void setDBData(String key, String value) {
    setState(() {
      _readDataKey = key.substring(1, key.length-1);
      _readDataValue = value.substring(1, value.length-1);
    });
  }

  Future<void> _sendAnalyticsEvent() async {
    await analytics.logEvent(
      name: 'testevent_20231107',
      parameters: <String, dynamic> {
        'string':'hello',
        'int':100,
      },
    );
    setMessage('send analytics~~~~!');
  }

  Future<void> readData() async {
    FirebaseDatabase realtime = FirebaseDatabase.instance;
    DataSnapshot snapshot = await realtime.ref().child("posts/1").get();
    Map<dynamic, dynamic> value = snapshot.value as Map<dynamic, dynamic>;
    print(value.keys);
    print(value.values);

    setDBData(value.keys.toString(), value.values.toString());
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
            ElevatedButton(
              onPressed: _sendAnalyticsEvent,
              child: const Text('event test'),
            ),

            // https://basic231107-default-rtdb.firebaseio.com/
            ElevatedButton(
              onPressed: readData,
              child: const Text('readData'),
            ),
            Text(
              'KEY : $_readDataKey, VALUE : $_readDataValue',
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
