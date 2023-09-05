
class User {

  final List<UserModel> userModel;

  User({required this.userModel});

  factory User.fromJson(Map<String, dynamic> json) {

    var list = json['data'] as List;
    List<UserModel> userList = list.map((e) => UserModel.fromJson(e)).toList();
    
    return User(userModel: userList);
  }

}

class UserModel {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  UserModel({this.id, this.email, this.firstName, this.lastName, this.avatar});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }
}