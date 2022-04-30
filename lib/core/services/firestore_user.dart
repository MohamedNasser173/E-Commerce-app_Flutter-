import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/user_model.dart';

class FireStoreUser {
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUserForFireStore(UserModel userModel) async {
    return await _userCollectionRef
        .doc(userModel.userId)
        .set(userModel.tojson());
  }

  Future<DocumentSnapshot> GetCurrentUser(String? uid) async {
    return _userCollectionRef.doc(uid).get();
  }
}
