part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class ExpertsLoaded extends HomeState {
  final List<Experts>? expertsList;
  ExpertsLoaded(this.expertsList);
}
