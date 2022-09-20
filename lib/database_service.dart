import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;

  DatabaseService(this.uid);

  // reference for our collection
  final CollectionReference userCollrction =
      FirebaseFirestore.instance.collection('users');

  //update the user data
  Future savingUserData(
      String fullName, String email, String matric) async {
    return await userCollrction.doc(uid).set({
      "fullName": fullName,
      "email": email,
      "profilePic": '',
      "matric": matric,
      "uid": uid,
    });
  }

  // gettinguser data
  Future gettingUserData(email) async {
    QuerySnapshot snapshot =
        await userCollrction.where('email', isEqualTo: email).get();
    return snapshot;
  }
}
