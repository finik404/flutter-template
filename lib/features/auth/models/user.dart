class UserModel {
  int id;
  String firstName;
  String email;
  String? token;

  UserModel({
    required this.id,
    required this.firstName,
    required this.email,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstName: json['first_name'],
      email: json['email'],
      token: json['token'],
    );
  }
}
