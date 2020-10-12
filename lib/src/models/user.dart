class Users {
  final String userId;
  final String email;

  Users({this.userId, this.email});

  Map<String, dynamic> toMap() {
    return {'userId': userId, 'email': email};
  }

  Users.fromFirestore(Map<String, dynamic> firestore)
      : userId = firestore['userId'],
        email = firestore['emaiol'];
}
