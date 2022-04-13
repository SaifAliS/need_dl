import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          // padding: EdgeInsets.fromLTRB(left, top, right, bottom),
          alignment: Alignment.topRight,
          width: MediaQuery.of(context).size.width * 0.4,
          height: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/NeedDL.png"),
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0.3,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "SIGN UP",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Fill in your details to sign up with NeedDL",
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "First Name *",
                style: TextStyle(fontSize: 17),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              child: TextField(
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
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Middle Name ",
                style: TextStyle(fontSize: 17),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              child: TextField(
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
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Last Name *",
                style: TextStyle(fontSize: 17),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              child: TextField(
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
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Phone No *",
                style: TextStyle(fontSize: 17),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              child: TextField(
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.phone),
                  border: InputBorder.none,
                  fillColor: Color.fromRGBO(224, 224, 224, 1),
                  filled: true,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Email ID *",
                style: TextStyle(fontSize: 17),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              child: TextField(
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.email),
                  border: InputBorder.none,
                  fillColor: Color.fromRGBO(224, 224, 224, 1),
                  filled: true,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Password *",
                style: TextStyle(fontSize: 17),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              child: TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.password),
                  border: InputBorder.none,
                  fillColor: Color.fromRGBO(224, 224, 224, 1),
                  filled: true,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              width: 150,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ))),
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 19),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
