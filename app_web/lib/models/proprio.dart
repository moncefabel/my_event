import 'dart:convert';
class Proprio{

  final String id;
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String token;

  Proprio({
    required this.id, 
    required this.email, 
    required this.password, 
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.token
  });

  Map<String, dynamic> toMap() {
      return {
        '_id': id,
        'firstName': firstName,
        'email': email,
        'password': password,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'token': token
      };
    }
  factory Proprio.fromMap(Map<String, dynamic> map){
    return Proprio(
      id: map['_id'] ?? '', 
      email: map['email'] ?? '', 
      password: map['password'] ?? '', 
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());
  factory Proprio.fromJson(String source) => Proprio.fromMap(json.decode(source));

}