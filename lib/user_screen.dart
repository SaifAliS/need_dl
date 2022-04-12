import 'package:flutter/material.dart';

class user extends StatefulWidget {
  const user({Key? key}) : super(key: key);

  @override
  State<user> createState() => _userState();
}

class _userState extends State<user> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                
                backgroundColor: Colors.white,
                title: Row(children: [
                  Container(
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
                  SizedBox(
                    width:  MediaQuery.of(context).size.width * 0.2,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "USER",
                      style: TextStyle(
                          fontSize: 30,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber),
                    ),
                  )
                ]),
                centerTitle: true,
                elevation: 0.3,
                bottom: TabBar(
                    unselectedLabelColor: Colors.amber,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.amberAccent, Colors.orange]),
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.amber),
                    tabs: [
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("New Post"),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("ONGOING"),
                        ),
                      ),
                    ]),
              ),
              body: TabBarView(children: [
                Icon(Icons.apps),
                Icon(Icons.movie),
              ]),
            )));
  }
}
