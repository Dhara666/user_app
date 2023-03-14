import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meditation_twoplus/model/user_model/user_model.dart';

class UserService {
  CollectionReference userTable =
      FirebaseFirestore.instance.collection("users");

  Future createUser(UserModel userModel) async {
    try {
      await userTable.doc(userModel.userID).set(userModel.toJson());
    } catch (e) {
      print("Catch error in Get createUser: $e");
    }
  }

  Future<List<UserModel>> getUserList() async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection('users').get();
    List<QueryDocumentSnapshot> docs = querySnapshot.docs;
    final userList = docs.map((doc) => UserModel.fromJson(doc.data())).toList();
    return userList;
  }

  isPurchaseTrue() {
    var currentUserId = FirebaseAuth.instance.currentUser.uid;
    FirebaseFirestore.instance
        .collection("users")
        .doc(currentUserId)
        .update({'isPurchase': true});
  }
}
