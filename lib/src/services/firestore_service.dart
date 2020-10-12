import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:market/src/models/user.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addUser(Users user) {
    return _db.collection("user").doc(user.userId).set(user.toMap());
  }

  Future<Users> fetchUser(String userId) {
    return _db
        .collection('user')
        .doc(userId)
        .get()
        .then((snapshot) => Users.fromFirestore(snapshot.data()));
  }
}
