import 'dart:convert';
class Customer{

  final String id;
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String token;

  Customer({
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
  factory Customer.fromMap(Map<String, dynamic> map){
    return Customer(
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
  factory Customer.fromJson(String source) => Customer.fromMap(json.decode(source));

}