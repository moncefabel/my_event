import 'dart:convert';
class Proprio{

  final String id;
  final String email;
  final String password;
  final String name;

  Proprio({
    required this.id, 
    required this.email, 
    required this.password, 
    required this.name
  });

  Map<String, dynamic> toMap() {
      return {
        '_id': id,
        'name': name,
        'email': email,
        'password': password,
      };
    }
  factory Proprio.fromMap(Map<String, dynamic> map){
    return Proprio(
      id: map['_id'] ?? '', 
      email: map['email'] ?? '', 
      password: map['password'] ?? '', 
      name: map['name'] ?? ''
    );
  }

  String toJson() => json.encode(toMap());
  factory Proprio.fromJson(String source) => Proprio.fromMap(json.decode(source));

}