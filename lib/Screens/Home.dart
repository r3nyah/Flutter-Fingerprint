import 'package:fingerprint/main.dart';
import 'package:fingerprint/Screens/Login.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fingerprint Authentication'),
      ),
      body: Padding(
        padding: EdgeInsets.all(35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Home',
              style: TextStyle(fontSize: 50),
            ),
            SizedBox(height: 50,),
            buildLogoutButton(context),
          ],
        ),
      ),
    );
  }
}

Widget buildLogoutButton(BuildContext context){
  return ElevatedButton(
  style: ElevatedButton.styleFrom(
    minimumSize: Size.fromHeight(50),
  ),
  child: Text(
    'Logout',
    style: TextStyle(fontSize: 20),
  ),
  onPressed: () => Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) => FingerprintPage()),
  ),
);
}
