import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:need_dl/auth_functions.dart';
import 'package:need_dl/supervisor_screen.dart';
import 'package:need_dl/user_screen.dart';
import 'package:need_dl/worker_screen.dart';
import 'package:need_dl/signup_page.dart';

enum SingingCharacter { User, Worker, Supervisor }

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  @override
  SingingCharacter? _character = SingingCharacter.User;
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
        body: Padding(
          padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 23),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Sign into your account",
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "SELECT YOUR ROLE",
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.left,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: const Text('User'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.User,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: const Text('Worker'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.Worker,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Radio<SingingCharacter>(
                    value: SingingCharacter.Supervisor,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Supervisor',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "YOUR EMAIL/PHONE NUMBER",
                  style: TextStyle(fontSize: 14),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 50,
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    fillColor: Color.fromRGBO(224, 224, 224, 1),
                    filled: true,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
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
                child: TextField(
                  controller: passwordController,
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => signup()),
                );
              },
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
                onTap: () async {
                  final res = await loginAccount(
                      email: emailController.text,
                      password: passwordController.text);

                  if (res == true) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (con) => user(),
                      ),
                    );
                  }

                  // if (_character == SingingCharacter.User) {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => user()),
                  //   );
                  // } else if (_character == SingingCharacter.Worker) {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => worker()),
                  //   );
                  // } else {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => supervisor()),
                  //   );
                }),
          ],
        ));
  }
}
