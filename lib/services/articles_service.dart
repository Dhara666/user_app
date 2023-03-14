import 'package:cloud_firestore/cloud_firestore.dart';

class ArticlesService {
  final CollectionReference articlesCollection =
      FirebaseFirestore.instance.collection('articles');

  Future<List<QueryDocumentSnapshot>> getArticlesData() async {
    try {
      QuerySnapshot articleData = await articlesCollection.get();
      List<QueryDocumentSnapshot> articlesData = articleData.docs.toList();
      return articlesData;
    } catch (e) {
      print('Catch error in Get Articles Data : $e');
      return null;
    }
  }
}
