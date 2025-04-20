class UserModel {
  late final String id;
  late final String email;
  late final String firstName;
  late final String lastName;
  late final String mobile;
  late final String createdDate;

  //convert to dart from json
  //named constructor
  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'] ?? '';
    email = json['email'] ?? '';
    firstName = json['firstName'] ?? '';
    lastName = json['lastName'] ?? '';
    mobile = json['mobile'] ?? '';
    createdDate = json['createdDate'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'mobile': mobile,
      'createdDate': createdDate,
    };
  }

  String get userName {
    return '$firstName $lastName';
  }
}
