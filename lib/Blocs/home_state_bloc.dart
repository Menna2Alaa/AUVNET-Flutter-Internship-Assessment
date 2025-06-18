// home_state.dart
import 'package:e_commerce_app/models/restaurant_model.dart';
import 'package:e_commerce_app/models/service_model.dart';
import 'package:e_commerce_app/models/user_model.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<ServiceModel> services;
  final List<RestaurantModel> restaurants;
  final UserModel? user;

  HomeLoadedState({
    required this.services,
    required this.restaurants,
    this.user,
  });
}

class HomeErrorState extends HomeState {
  final String message;

  HomeErrorState({required this.message});
}
