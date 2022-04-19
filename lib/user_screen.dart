import 'package:flutter/material.dart';
import 'package:need_dl/login_page.dart';
import 'package:need_dl/signup_page.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

class user extends StatefulWidget {
  const user({Key? key}) : super(key: key);

  @override
  State<user> createState() => _userState();
}

class _userState extends State<user> {
  int currentStep = 0;
  bool iscom = false;
  String dropdownvalue = 'Electrician';
  String cell = "Your Phone No";
  String name = "Your Name";

  // List of items in our dropdown menu
  var items = [
    'Electrician',
    'Carpentry',
    'Wood Work',
    'Mason Work',
    'House Cleaning',
  ];
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardC = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardD= new GlobalKey();


  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    );
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: Row(children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
  
                    },
                    child: Container(
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
              body: Theme(
                data: ThemeData(
                  primarySwatch: Colors.amber,
                ),
                child: TabBarView(children: [
                  Column(
                    children: iscom
                        ? [post_details()]
                        : [
                            Stepper(
                                steps: getSteps(),
                                currentStep: currentStep,
                                onStepTapped: (int step) {
                                  setState(() {
                                    currentStep = step;
                                  });
                                },
                                onStepCancel: () {
                                  currentStep > 0
                                      ? setState(() => currentStep -= 1)
                                      : null;
                                },
                                onStepContinue: () {
                                  if (currentStep == 2) {
                                    setState(() => iscom = true);
                                  } else {
                                    setState(() => currentStep += 1);
                                  }
                                }),
                          ],
                  ),
                  ListView(
                    children: [
                      ExpansionTileCard(
                        key: cardA,
                        leading: CircleAvatar(child: Text('A')),
                        title: Text('Carpentry'),
                        subtitle: Text('Need 3 Workers'),
                        children: <Widget>[
                          Divider(
                            thickness: 1.0,
                            height: 1.0,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 8.0,
                              ),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Name : " + name,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Phone No : " + cell,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Type of Work : " + cell,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "No of Workers : " + cell,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Payable : " + cell,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                          ButtonBar(
                            alignment: MainAxisAlignment.spaceAround,
                            buttonHeight: 52.0,
                            buttonMinWidth: 90.0,
                            children: <Widget>[
                              TextButton(
                                style: flatButtonStyle,
                                onPressed: () {
                                  cardB.currentState?.expand();
                                },
                                child: Column(
                                  children: <Widget>[
                                    Icon(
                                      Icons.done_all,
                                      color: Colors.green,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2.0),
                                    ),
                                    Text(
                                      'Completed',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              
                            ],
                          ),
                        ],
                      ),SizedBox(height: 10,),
                      ExpansionTileCard(
                        key: cardB,
                        leading: CircleAvatar(child: Text('B')),
                        title: Text('Electrician'),
                        subtitle: Text('Need 7 Workers'),
                        children: <Widget>[
                          Divider(
                            thickness: 1.0,
                            height: 1.0,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 8.0,
                              ),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Name : " + name,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Phone No : " + cell,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Type of Work : " + cell,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "No of Workers : " + cell,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Payable : " + cell,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                          ButtonBar(
                            alignment: MainAxisAlignment.spaceAround,
                            buttonHeight: 52.0,
                            buttonMinWidth: 90.0,
                            children: <Widget>[
                              TextButton(
                                style: flatButtonStyle,
                                onPressed: () {
                                  cardB.currentState?.expand();
                                },
                                child: Column(
                                  children: <Widget>[
                                    Icon(
                                      Icons.done_all,
                                      color: Colors.green,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2.0),
                                    ),
                                    Text(
                                      'Completed',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              
                            ],
                          ),
                        ],
                      ),SizedBox(height: 10,),
                      ExpansionTileCard(
                        key: cardC,
                        leading: CircleAvatar(child: Text('C')),
                        title: Text('House Cleaning'),
                        subtitle: Text('Need 3 Workers'),
                        children: <Widget>[
                          Divider(
                            thickness: 1.0,
                            height: 1.0,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 8.0,
                              ),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Name : " + name,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Phone No : " + cell,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Type of Work : " + cell,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "No of Workers : " + cell,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Payable : " + cell,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                          ButtonBar(
                            alignment: MainAxisAlignment.spaceAround,
                            buttonHeight: 52.0,
                            buttonMinWidth: 90.0,
                            children: <Widget>[
                               TextButton(
                                style: flatButtonStyle,
                                onPressed: () {
                                  cardB.currentState?.expand();
                                },
                                child: Column(
                                  children: <Widget>[
                                    Icon(
                                      Icons.access_time_outlined,
                                      color: Colors.amber,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2.0),
                                    ),
                                    Text(
                                      'Ongoing',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              
                            ],
                          ),
                        ],
                      ),SizedBox(height: 10,),
                      ExpansionTileCard(
                        key: cardD,
                        leading: CircleAvatar(child: Text('D')),
                        title: Text('Plumber'),
                        subtitle: Text('Need 5 Workers'),
                        children: <Widget>[
                          Divider(
                            thickness: 1.0,
                            height: 1.0,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 8.0,
                              ),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Name : " + name,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Phone No : " + cell,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Type of Work : " + cell,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "No of Workers : " + cell,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Payable : " + cell,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                          ButtonBar(
                            alignment: MainAxisAlignment.spaceAround,
                            buttonHeight: 52.0,
                            buttonMinWidth: 90.0,
                            children: <Widget>[
                              TextButton(
                                style: flatButtonStyle,
                                onPressed: () {
                                  cardB.currentState?.expand();
                                },
                                child: Column(
                                  children: <Widget>[
                                    Icon(
                                      Icons.access_time_outlined,
                                      color: Colors.amber,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2.0),
                                    ),
                                    Text(
                                      'Ongoing',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              
                            ],
                          ),
                        ],
                      ),SizedBox(height: 10,),
                      
                    ],
                  ),
                ]),
              ),
            )));
  }

  List<Step> getSteps() {
    return [
      Step(
        title: new Text('Payer Details'),
        content: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Phone No'),
            ),
          ],
        ),
        isActive: currentStep > 0,
        state: currentStep == 0 ? StepState.editing : StepState.complete,
      ),
      Step(
        title: new Text('Work Details'),
        content: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
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
            TextFormField(
              decoration:
                  InputDecoration(labelText: 'Number of Workers Required'),
            ),
          ],
        ),
        isActive: currentStep > 1,
        state: currentStep == 1
            ? StepState.editing
            : currentStep > 1
                ? StepState.complete
                : StepState.disabled,
      ),
      Step(
        title: new Text("Payment Details"),
        content: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Amount to be paid'),
            ),
          ],
        ),
        isActive: currentStep > 2,
        state: currentStep == 2
            ? StepState.editing
            : currentStep > 2
                ? StepState.complete
                : StepState.disabled,
      ),
    ];
  }
}

class post_details extends StatefulWidget {
  const post_details({Key? key}) : super(key: key);

  @override
  State<post_details> createState() => _post_detailsState();
}

class _post_detailsState extends State<post_details> {
  String name = "Your Name";
  String cell = "Your Phone No";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(25, 10, 0, 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Name : " + name,
              style: TextStyle(fontSize: 15),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Phone No : " + cell,
              style: TextStyle(fontSize: 15),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Type of Work : " + cell,
              style: TextStyle(fontSize: 15),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "No of Workers : " + cell,
              style: TextStyle(fontSize: 15),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Payable : " + cell,
              style: TextStyle(fontSize: 15),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.4,
                child: ElevatedButton(onPressed: () {}, child: Text("Confirm")),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.07,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.4,
                child: ElevatedButton(onPressed: () {}, child: Text("Cancel")),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
