class UserModel {
  String userID;
  String email;
  String firstName;
  String type;
  bool isPurchase = false;

  UserModel(
      {this.userID, this.email, this.firstName, this.type, this.isPurchase});

  factory UserModel.fromJson(Map<String, dynamic> parsedJson) {
    return new UserModel(
        userID: parsedJson['userId'] ?? '',
        email: parsedJson['email'] ?? '',
        firstName: parsedJson['firstName'] ?? '',
        type: parsedJson['type'] ?? '',
        isPurchase: parsedJson['isPurchase'] ?? false);
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': this.userID,
      'email': this.email,
      'firstName': this.firstName,
      'type': this.type,
      'isPurchase': this.isPurchase
    };
  }
}
