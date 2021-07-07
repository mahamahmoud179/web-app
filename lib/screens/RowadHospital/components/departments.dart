import 'package:admin/firebase/firebasehelper.dart';
import 'package:admin/models/department.dart';
import 'package:admin/screens/RowadHospital/components/OR.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:admin/responsive.dart';
import 'package:admin/screens/main/components/side_menu.dart';

class Departments extends StatefulWidget {
  static const String id = 'departments';
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Departments> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //FirebaseHelper.getALlDepartements();
  }

  /*@override
  Widget build(BuildContext context) {
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
                          child: Image.asset('images/done.jpg'),
                          footer: Container(
                            color: Colors.black.withOpacity(0.0005),
                            child: Text(
                              'Operation room',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed('OR');
                        },
                      ),
                      InkWell(
                        child: GridTile(
                          child: Image.asset('images/beds.jpg'),
                          footer: Container(
                            color: Colors.black.withOpacity(0.0005),
                            child: Text(
                              'ICU',
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
                      InkWell(
                        child: GridTile(
                          child: Image.asset('images/ct.jpg'),
                          footer: Container(
                            color: Colors.black.withOpacity(0.0005),
                            child: Text(
                              'Radiology',
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
                      InkWell(
                        child: GridTile(
                          child: Image.asset('images/mri.jpg'),
                          footer: Container(
                            color: Colors.black.withOpacity(0.0005),
                            child: Text(
                              'Cardiology',
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
                      InkWell(
                        child: GridTile(
                          child: Image.asset('images/ct.jpg'),
                          footer: Container(
                            color: Colors.black.withOpacity(0.0005),
                            child: Text(
                              'ER',
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
                      InkWell(
                        child: GridTile(
                          child: Image.asset('images/ct.jpg'),
                          footer: Container(
                            color: Colors.black.withOpacity(0.0005),
                            child: Text(
                              'outpatient',
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
                      /*InkWell(
                child: GridTile(
                  child: Image.asset('images/ct.jpg'),
                  footer: Container(
                    color: Colors.black.withOpacity(0.0005),
                    child: Text(
                      'Problem in CT',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                onTap: () {
                  print("tap");
                },
              ),
              InkWell(
                child: GridTile(
                  child: Image.asset('images/ct.jpg'),
                  footer: Container(
                    color: Colors.black.withOpacity(0.0005),
                    child: Text(
                      'Problem in CT',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                onTap: () {
                  print("tap");
                },
              ),
              InkWell(
                child: GridTile(
                  child: Image.asset('images/ct.jpg'),
                  footer: Container(
                    color: Colors.black.withOpacity(0.0005),
                    child: Text(
                      'party with children ',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                onTap: () {
                  print("tap");
                },
              ),*/
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
  final departements =
      FirebaseFirestore.instance.collection('department').snapshots();
  @override
  Widget build(BuildContext context) {
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
        body: StreamBuilder<QuerySnapshot>(
          stream: departements,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            return new GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                DepartmentsModel model = DepartmentsModel.fromJson(data);
                return InkWell(
                  onTap: () {
                    print(document.id);
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => OR(document.id)));
                  },
                  child: Column(
                    children: [
                      Image.network(
                        model.image,
                        width: 200,
                        height: 200,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        model.name,
                        style: TextStyle(fontSize: 25),
                      )
                    ],
                  ),
                );
              }).toList(),
            );
          },
        ));
  }
}
/**
 * 
 */
