import 'dart:async';
import 'package:firebase_core/firebase_core.dart';

import '../models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:market/src/services/firestore_service.dart';
import 'package:rxdart/rxdart.dart';

final RegExp regExpEmail = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

class AuthBloc {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = FirestoreService();

  //get Stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get isValid =>
      CombineLatestStream.combine2(email, password, (a, b) => true);

  //set Data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  //stream Transformer

  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      if (regExpEmail.hasMatch(data.trim())) {
        sink.add(data.trim());
      } else {
        sink.addError("Must be Valid Email");
      }
    },
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      if (data.length >= 8) {
        sink.add(data.trim());
      } else {
        sink.addError("Must be More Then 8 Characters");
      }
    },
  );

  signup() async {
    print("Signin IN");
    try {
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(
          email: _email.value.trim(), password: _password.value.trim());
      var user = Users(userId: authResult.user.uid, email: _email.value.trim());
      _firestoreService.addUser(user);
    } catch (error) {
      print(error);
    }
  }

  dispose() {
    _email.close();
    _password.close();
  }
}
