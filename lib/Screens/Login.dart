import 'package:fingerprint/main.dart';
import 'package:fingerprint/Api/Api.dart';
import 'package:fingerprint/Screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class FingerprintPage extends StatelessWidget {
  //const FingerprintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fingerprint Authentication'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(35),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildAvailability(context),
              SizedBox(height: 25,),
              buildAuthenticate(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildAvailability(BuildContext context) {
  return buildButton(
    text: 'Check Availability',
    icon: Icons.event_available,
    onClicked: () async {
      final isAvailable = await LocalAuthApi.hasBiometrics();
      final biometrics = await LocalAuthApi.getBiometrics();

      final hasFingerprint = biometrics.contains(BiometricType.fingerprint);

      showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              title: Text('Availability'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildText('Biometrics', isAvailable),
                  buildText('Fingerprint', hasFingerprint),
                ],
              ),
            ),
      );
    },
  );
}

Widget buildText(String text, bool checked){
  return Container(
  margin: EdgeInsets.symmetric(vertical: 8),
  child: Row(
    children: [
      checked
          ? Icon(Icons.check, color: Colors.green, size: 24)
          : Icon(Icons.close, color: Colors.red, size: 24),
      const SizedBox(width: 12),
      Text(text, style: TextStyle(fontSize: 24)),
    ],
  ),
);
}

Widget buildAuthenticate(BuildContext context){
  return buildButton(
    text: 'Authenticate',
    icon: Icons.lock_open,
    onClicked: () async {
      final isAuthenticated = await LocalAuthApi.authenticate();

      if (isAuthenticated) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    },
  );
}

Widget buildButton({
  required String text,
  required IconData icon,
  required VoidCallback onClicked,
}) {
  return ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
      minimumSize: Size.fromHeight(50),
    ),
    icon: Icon(icon, size: 26),
    label: Text(
      text,
      style: TextStyle(fontSize: 20),
    ),
    onPressed: onClicked,
  );
}
