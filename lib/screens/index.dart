import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Index extends StatelessWidget {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [Text("Welcome"), Text(firebaseAuth.currentUser!.email!)],
        ),
      ),
    );
  }
}
