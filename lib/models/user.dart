import 'dart:convert';
class User{

  final String id;
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String token;

  User({
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
  factory User.fromMap(Map<String, dynamic> map){
    return User(
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
  factory User.fromJson(String source) => User.fromMap(json.decode(source));

}