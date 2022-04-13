import 'package:flutter/material.dart';

class user extends StatefulWidget {
  const user({Key? key}) : super(key: key);

  @override
  State<user> createState() => _userState();
}

class _userState extends State<user> {
  int currentStep=0;
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
                    width: MediaQuery.of(context).size.width * 0.2,
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
                Column(
                  children: [
                    Stepper(
        steps:getSteps(),
        currentStep: currentStep,
        onStepTapped: (int step)
        {
          setState(() {
            currentStep = step;
          });
        },
        onStepCancel: ()
        {
          currentStep > 0 ?
          setState(() => currentStep -= 1) : null;
        },
        onStepContinue: ()
        {
          currentStep < 2 ?
          setState(() => currentStep += 1): null;
        },
      ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.movie),
                  ],
                ),
              ]),
            )));
  }
  List<Step> getSteps()
  {
    return[
      Step(
        title: new Text('Person With Work'),
        content: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email Address'),
            ),
          ],
        ),
        isActive: currentStep >= 0,
        state: currentStep == 0 ?
        StepState.editing : StepState.complete,
      ),
      Step(
        title: new Text('Work Details'),
        content: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Home Address'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Mobile No'),
            ),
          ],
        ),
        isActive: currentStep >= 1,
        state: currentStep == 1 ?
        StepState.editing : currentStep < 1 ? StepState.disabled: StepState.complete,
      ),
      Step(
        title: new Text("Amount to be Paid"),
        content: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Account No'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'IFSC Code'),
            ),
          ],
        ),
        isActive:currentStep >= 2,
        state: currentStep == 2 ?
        StepState.editing : currentStep < 2 ? StepState.disabled: StepState.complete,
      ),
    ];
  }
}


