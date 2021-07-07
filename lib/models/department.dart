import 'package:admin/models/Devices.dart';

class DepartmentsModel {
  late String name;
  late String image;
  late List<DevicesModel> devices;
  late String id;

  DepartmentsModel.fromJson(Map<String, dynamic> json) {
    devices = [];
    image = json['image'] ?? '';
    id = json['id'] ?? '';
    json['devices'].forEach((element) {
      devices.add(DevicesModel.fromJson(element));
    });
    //print(json['devices']);
    devices = [];
    //1 2 3
    name = json['name'] ?? '';
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'id': id,
      'name': name,
      'devives ': devices,
    };
  }
}
