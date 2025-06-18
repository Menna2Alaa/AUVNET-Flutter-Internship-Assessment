// home_event.dart
import 'package:e_commerce_app/models/restaurant_model.dart';
import 'package:e_commerce_app/models/service_model.dart';
import 'package:e_commerce_app/models/user_model.dart';

abstract class HomeEvent {}

class LoadHomeDataEvent extends HomeEvent {}

class LoadServicesEvent extends HomeEvent {}

class LoadRestaurantsEvent extends HomeEvent {}

class LoadUserDataEvent extends HomeEvent {}

class UpdateRestaurantEvent extends HomeEvent {
  final RestaurantModel updatedRestaurant;

  UpdateRestaurantEvent(this.updatedRestaurant);
}

class UpdateServiceEvent extends HomeEvent {
  final ServiceModel updatedService;

  UpdateServiceEvent(this.updatedService);
}

class UpdateUserDataEvent extends HomeEvent {
  final UserModel updateUserData;

  UpdateUserDataEvent(this.updateUserData);
}
