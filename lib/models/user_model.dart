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
}
