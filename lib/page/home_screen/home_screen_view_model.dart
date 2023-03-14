import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meditation_twoplus/constant/image_constant.dart';
import 'package:meditation_twoplus/model/article_model/article_model.dart';
import 'package:meditation_twoplus/model/meditation_model/meditation_model.dart';
import 'package:meditation_twoplus/page/home_screen/home_screen.dart';
import 'package:meditation_twoplus/services/articles_service.dart';
import 'package:meditation_twoplus/services/meditations_service.dart';

class HomeScreenViewModel {
  HomeScreenState homeScreenState;
  MeditationsService meditationsService = MeditationsService();
  ArticlesService articlesService = ArticlesService();
  Stream meditationStream;
  List<MeditationsModel> meditationModelData = [];
  List<ArticlesModel> articleModelData = [];
  List<String> meditationIcon = [
    ImagePath.subGrid1,
    ImagePath.subGrid2,
    ImagePath.subGrid3,
    ImagePath.subGrid4,
    ImagePath.subGrid1,
  ];

  HomeScreenViewModel(this.homeScreenState) {
    fetchMeditationData();
    fetchArticleData();
  }

  fetchMeditationData() async {
    List<QueryDocumentSnapshot> meditationData =
        await meditationsService.getMeditationsData();
    for (int i = 0; i < meditationData.length; i++) {
      meditationModelData.add(
        MeditationsModel.fromMap(meditationData[i].data()),
      );
    }
    // ignore: invalid_use_of_protected_member
    homeScreenState.setState(() {});
  }

  fetchArticleData() async {
    List<QueryDocumentSnapshot> articalData =
        await articlesService.getArticlesData();
    for (int i = 0; i < articalData.length; i++) {
      articleModelData.add(
        ArticlesModel.fromMap(articalData[i].data()),
      );
    }
    // ignore: invalid_use_of_protected_member
    homeScreenState.setState(() {});
  }
}
