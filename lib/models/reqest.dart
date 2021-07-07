import 'package:flutter/cupertino.dart';


class RequestsModel {
  String? state;
  String? image;
   String? device_id;
   String? timestamp;
  String? uId;
  String? notes;
  String? messege;
  String? department_id;
  String? id;
  String? engineer_id;

  RequestsModel({
    this.image = '',
    this.uId = '',
    this.state = '',
    this. device_id = '',
   this. timestamp = '',
   this. engineer_id = '',
    this. notes = '',
    this. messege = '',
    this. department_id = '',
   this. id = '',



  });

  RequestsModel.fromJson(Map<String, dynamic> json) {
  image = json['image'] ?? '';
    uId = json['uId'] ?? '';
    device_id = json['device_id '] ?? '';
    state = json['state'] ?? '';
    engineer_id = json['engineer_id'] ?? '';
    notes = json['notes'] ?? '';
    department_id = json['department_id'] ?? '';
    id = json['id'] ?? '';

  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'uId': uId,
      'state': state,
      'device_id ': device_id,
      'engineer_id ': engineer_id,
      'notes ': notes,
      'messege ': messege,
      'department_id ': department_id,
      'id ': id,


    };
  }
}
