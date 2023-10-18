import 'package:flutter/material.dart';
import 'package:movieapp/Components/responsive/bottomnavigation.dart';
import 'package:movieapp/services/authservice.dart';
import 'package:movieapp/view/login.dart';
// import 'package:movieapp/view/screen_1.dart';

class Authchecker extends StatelessWidget {
  const Authchecker({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Authservices.authSateChange(),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return Login();
        } else {
          return Navigation1();
        }
      },
    );
  }
}
