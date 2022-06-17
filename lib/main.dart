import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Screens/Login.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fingerprint Authentication',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple
      ),
      home: FingerprintPage(),
    );
  }
}

