import 'package:admin/models/Devices.dart';
import 'package:admin/models/department.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseHelper {
  static List<DepartmentsModel> departmentList = [];
  static getALlDepartements() async{
    return await FirebaseFirestore.instance.collection('department').snapshots();
    /*.then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        DepartmentsModel model =
            DepartmentsModel.fromJson(element.data() as Map<String, dynamic>);
        departmentList.add(model);
        print(departmentList);
      });
    });*/
  }
}
//1 2 3
