import 'package:cloud_firestore/cloud_firestore.dart';

class MeditationsService {
  final CollectionReference meditationsCollection =
      FirebaseFirestore.instance.collection('meditations');

  Future<List<QueryDocumentSnapshot>> getMeditationsData() async {
    try {
      QuerySnapshot meditationsData = await meditationsCollection.get();
      List<QueryDocumentSnapshot> meditationData =
          meditationsData.docs.toList();
      return meditationData;
    } catch (e) {
      print('Catch error in Get Meditations Data : $e');
      return null;
    }
  }
}
