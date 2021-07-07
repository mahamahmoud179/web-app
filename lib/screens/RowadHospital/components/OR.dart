import 'package:admin/models/Devices.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:admin/responsive.dart';
import 'package:admin/screens/main/components/side_menu.dart';

class OR extends StatefulWidget {
  //static const String id = 'OR';
  final id;

  const OR(this.id);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState(id);
  }
}

class HomeState extends State<OR> {
  //@override
  /*Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "hospital system",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
        centerTitle: true,
        elevation: 20,
      ),
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                child: SideMenu(),
              ),
            Expanded(
              flex: 5,
              child: ListView(children: <Widget>[
                Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    children: <Widget>[
                      InkWell(
                        child: GridTile(
                          child: Image.asset('images/Ventilator.jpg'),
                          footer: Container(
                            color: Colors.black.withOpacity(0.0005),
                            child: Text(
                              'Ventilator',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed('ventilator');
                        
                        },
                      ),
                      InkWell(
                        child: GridTile(
                          child: Image.asset('images/Anesthesia.jpeg'),
                          footer: Container(
                            color: Colors.black.withOpacity(0.0005),
                            child: Text(
                              'Anesthesia',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        onTap: () {
                          print("tap");
                        },
                      ),
                      ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }*/
  final id;

  HomeState(this.id);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    CollectionReference users =
        FirebaseFirestore.instance.collection('department');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "hospital system",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
        centerTitle: true,
        elevation: 20,
      ),
      drawer: SideMenu(),
      body: FutureBuilder<DocumentSnapshot>(
        future: users.doc(id).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            print(data);
            //return Text("Full Name: ${data['full_name']} ${data['last_name']}");
            return GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              children: data['devices'].map<Widget>((device) {
                DevicesModel deviceModel =
                    DevicesModel.fromJson(device as Map<String, dynamic>);
                return InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Image.network(
                        deviceModel.image,
                        width: 200,
                        height: 200,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        deviceModel.name,
                        style: TextStyle(fontSize: 25),
                      )
                    ],
                  ),
                );
              }).toList(),
            );
          }

          return Text("loading");
        },
      ),
    );
  }
}
