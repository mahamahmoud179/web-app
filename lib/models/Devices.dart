List<String> types = ['nurse', 'doctor', 'engineer'];
                  //    0         1           2

class DevicesModel {
  late String name;
 late String image;
  late String manual;
  late String id;



  DevicesModel.fromJson(Map<String, dynamic> json) {
  image = json['image'] ?? '';
    id = json['id'] ?? '';
    manual = json['manual '] ?? '';
    name = json['name'] ?? '';
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'deviceId': id,
      'name': name,
      'manual ': manual,


    };
  }
}
