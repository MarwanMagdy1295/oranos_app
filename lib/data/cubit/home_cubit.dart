// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:oranos_app/models/experts.dart';
import 'package:oranos_app/repository/experts_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ExpertsRepository? expertsRepository;
  HomeCubit(this.expertsRepository) : super(HomeInitial());
  List<Experts>? experts = [
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
  List<Experts>? onlineExperts;
  List<Experts> getHomeExperts() {
    expertsRepository!.getHomeExperts().then((experts) {
      emit(ExpertsLoaded(experts));
      this.experts = experts;
    });
    return experts!;
  }

  List<Experts> getOnlineExperts() {
    expertsRepository!.getOnlineExperts().then((onlineExperts) {
      emit(ExpertsLoaded(onlineExperts));
      this.onlineExperts = onlineExperts;
    });
    return experts!;
  }
}
