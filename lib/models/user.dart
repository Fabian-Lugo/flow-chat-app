class UserModel {
  final String uid;
  final String name;
  final String email;
  final bool online;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.online,
  });

  factory UserModel.fromMap(Map<String, dynamic> json, String id) {
    return UserModel(
      uid: id, 
      name: json['name'], 
      email: json['email'], 
      online: json['online']
    );
  }
  
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'online': online
    };
  }
}
