// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpi_question_bank/database_service.dart';

class AuthServices {
  final FirebaseAuth auth = FirebaseAuth.instance;

  // login
  Future loginUser(String email, String password) async {
    try {
      User user = (await auth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;

      if (user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      return e.message;
    }
  }

  // register
  Future registerUser(
      String fullName, String password, String email, String matric) async {
    try {
      User user = (await auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;

      if (user != null) {
        // call our database to update user
        DatabaseService(user.uid).savingUserData(fullName, email, matric);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      return e.message;
    }
  }

  // logout

}
