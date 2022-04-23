import 'package:flutter/material.dart';
import 'package:need_dl/auth_functions.dart';
import 'package:need_dl/supervisor_screen.dart';
import 'package:need_dl/user_screen.dart';
import 'package:need_dl/worker_screen.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

// woekof@gailclm.coje
// oiweoifwepoi
class _signupState extends State<signup> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  String dropdownvalue = 'u';

  var items = ['u', 's', 'w'];

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
                "Name *",
                style: TextStyle(fontSize: 17),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              child: TextField(
                controller: nameController,
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
                controller: phoneController,
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
                controller: emailController,
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
                controller: passwordController,
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
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Select Role for Sign Up *",
                style: TextStyle(fontSize: 17),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: DropdownButton(
                value: dropdownvalue,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              width: 150,
              child: ElevatedButton(
                onPressed: () async {
                  bool isSuccess = await createAccount(
                    name: nameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                    userType: dropdownvalue,
                    phoneNumber: phoneController.text,
                  );

                  if (isSuccess) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (con) => dropdownvalue == 'u'
                              ? user()
                              : dropdownvalue == 'w'
                                  ? worker()
                                  : supervisor(),
                        ));
                  }
                },
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
