import 'package:oranos_app/models/experts.dart';
import 'package:oranos_app/services/home_service.dart';

class ExpertsRepository {
  HomeService? homeService;
  ExpertsRepository(this.homeService);
  Future<List<Experts>> getHomeExperts() async {
    // var experts = homeService!.getHomeExperts(); // call api service to get data
    List<Experts> experts = [
      Experts(
        id: 1,
        name: 'Kareem Adel',
        profileImg: 'assets/images/card1.png',
        rating: 4.5,
        title: 'Supply Chain',
        isFavorite: false,
      ),
      Experts(
        id: 1,
        name: 'Merna Adel',
        profileImg: 'assets/images/card2.png',
        rating: 2.3,
        title: 'Supply Chain',
        isFavorite: true,
      ),
      Experts(
        id: 1,
        name: 'Kareem Adel',
        profileImg: 'assets/images/card1.png',
        rating: 3.2,
        title: 'Supply Chain',
        isFavorite: false,
      ),
      Experts(
        id: 1,
        name: 'Merna Adel',
        profileImg: 'assets/images/card2.png',
        rating: 1.5,
        title: 'Supply Chain',
        isFavorite: true,
      ),
    ];
    return experts;
  }

  Future<List<Experts>> getOnlineExperts() async {
    var expert = homeService!.getOnlineExperts();
    return expert;
  }
}
