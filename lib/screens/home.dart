import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  String? email;
  String? pass;

  TextEditingController emails = TextEditingController();
  TextEditingController password = TextEditingController();

  bool login = true;

  _login() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Login"),
        Container(
          padding: EdgeInsets.all(20),
          child: TextField(
            controller: emails,
            decoration: InputDecoration(
              hintText: "Email",
              prefixIcon: Icon(Icons.person),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: TextField(
            controller: password,
            decoration: InputDecoration(
              hintText: "Password",
              prefixIcon: Icon(Icons.vpn_key),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () async {
              try {
                await firebaseAuth
                    .signInWithEmailAndPassword(
                        email: emails.text, password: password.text)
                    .then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text('Welcome'),
                    duration: const Duration(seconds: 1),
                  ));
                });
                setState(() {});
                Navigator.of(context).pushNamed('/index');
                return;
              } catch (e) {
                print(e);
              }
            },
            child: Text("Login")),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Dont HAve an Account"),
            TextButton(
              onPressed: () {
                setState(() {
                  login = false;
                });
              },
              child: Text("SignUp"),
            ),
          ],
        )
      ],
    );
  }

  _signup() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("SignUp"),
        Container(
          padding: EdgeInsets.all(20),
          child: TextField(
            controller: emails,
            decoration: InputDecoration(
              hintText: "Email",
              prefixIcon: Icon(Icons.person),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: TextField(
            controller: password,
            decoration: InputDecoration(
              hintText: "Password",
              prefixIcon: Icon(Icons.vpn_key),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () async {
              try {
                await firebaseAuth
                    .createUserWithEmailAndPassword(
                        email: emails.text, password: password.text)
                    .then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text('Account hAs been Created'),
                    duration: const Duration(seconds: 1),
                    action: SnackBarAction(
                      label: 'doNE',
                      onPressed: () {
                        setState(() {
                          login = true;
                        });
                      },
                    ),
                  ));
                });
                return;
              } catch (e) {
                print(e);
              }
            },
            child: Text("SignUp")),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already  HAve an Account"),
            TextButton(
              onPressed: () {
                setState(() {
                  login = true;
                });
              },
              child: Text("login"),
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(top: 100),
          child: login == true ? _login() : _signup()),
    );
  }
}
