import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String firstName;
  String lastName;
  String email;
  String password;

  UserModel({this.id, this.email});

  Map<String, dynamic> toMap() {
    return {
      "firstName": this.firstName,
      "lastName": this.lastName,
      "email": this.email,
      "password": this.password
    };
  }

  UserModel.fromDocument(DocumentSnapshot doc) {
    this.id = doc.id;
    this.firstName = doc.data()['first_name'] ?? "";
    this.lastName = doc.data()['last_name'] ?? "";
    this.email = doc.data()['email'] ?? "";
    this.password = doc.data()['password'] ?? "";
  }

  DocumentReference get _userReference =>
      FirebaseFirestore.instance.doc("users/$id");
}
