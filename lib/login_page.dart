import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 150,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          title: Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                width: MediaQuery.of(context).size.width * 0.4,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/NeedDL_logo.png"),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                width: MediaQuery.of(context).size.width * 0.5,
                height: 73,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/NeedDL.png"),
                  ),
                ),
              )
            ],
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
              child: Text(
                "Login",
                style: TextStyle(fontSize: 23),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(25, 7, 0, 0),
              alignment: Alignment.centerLeft,
              child: Text(
                "Sign into your account",
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(25, 7, 0, 0),
              alignment: Alignment.centerLeft,
              child: Text(
                "YOUR EMAIL/PHONE NUMBER",
                style: TextStyle(fontSize: 14),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(25, 7, 25, 0),
              child: TextField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color.fromRGBO(224, 224, 224, 1),
                  filled: true,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.fromLTRB(25, 7, 0, 0),
              alignment: Alignment.centerLeft,
              child: Text(
                "PASSWORD",
                style: TextStyle(fontSize: 14),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(25, 7, 25, 0),
              child: TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color.fromRGBO(224, 224, 224, 1),
                  filled: true,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.fromLTRB(25, 7, 0, 0),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(fontSize: 14),
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
        bottomSheet: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "I don't have an account!",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onTap: () {},
            ),
            SizedBox(height: 10),
            GestureDetector(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.09,
                width: MediaQuery.of(context).size.width * 1.0,
                color: Colors.amber[400],
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(fontSize: 23, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {},
            ),
          ],
        ));
  }
}
