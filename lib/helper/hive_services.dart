import 'package:hive/hive.dart';
import 'package:e_commerce_app/models/user_model.dart';
import 'package:e_commerce_app/models/service_model.dart';
import 'package:e_commerce_app/models/restaurant_model.dart';

class HiveService {
  static const String userBoxName = 'users';
  static const String serviceBoxName = 'services';
  static const String restaurantBoxName = 'restaurants';
  static const String currentUserKey = 'current_user';

  Future<void> saveUser(UserModel user) async {
    final box = await Hive.openBox<UserModel>(userBoxName);
    await box.put(currentUserKey, user);
  }

  Future<UserModel?> getCurrentUser() async {
    final box = await Hive.openBox<UserModel>(userBoxName);
    return box.get(currentUserKey);
  }

  Future<void> updateUser(UserModel user) async {
    final box = await Hive.openBox<UserModel>(userBoxName);
    await box.put(currentUserKey, user);
  }

  Future<void> deleteUser() async {
    final box = await Hive.openBox<UserModel>(userBoxName);
    await box.delete(currentUserKey);
  }

  Future<void> addService(ServiceModel service) async {
    final box = await Hive.openBox<ServiceModel>(serviceBoxName);
    await box.put(service.id, service);
  }

  Future<List<ServiceModel>> getServices() async {
    final box = await Hive.openBox<ServiceModel>(serviceBoxName);
    return box.values.toList();
  }

  Future<ServiceModel?> getService(String id) async {
    final box = await Hive.openBox<ServiceModel>(serviceBoxName);
    return box.get(id);
  }

  Future<void> updateService(ServiceModel service) async {
    final box = await Hive.openBox<ServiceModel>(serviceBoxName);
    await box.put(service.id, service);
  }

  Future<void> deleteService(String id) async {
    final box = await Hive.openBox<ServiceModel>(serviceBoxName);
    await box.delete(id);
  }

  Future<void> addRestaurant(RestaurantModel restaurant) async {
    final box = await Hive.openBox<RestaurantModel>(restaurantBoxName);
    await box.put(restaurant.id, restaurant);
  }

  Future<List<RestaurantModel>> getRestaurants() async {
    final box = await Hive.openBox<RestaurantModel>(restaurantBoxName);
    return box.values.toList();
  }

  Future<List<RestaurantModel>> getPopularRestaurants() async {
    final box = await Hive.openBox<RestaurantModel>(restaurantBoxName);
    return box.values.where((restaurant) => restaurant.isPopular).toList();
  }

  Future<RestaurantModel?> getRestaurant(String id) async {
    final box = await Hive.openBox<RestaurantModel>(restaurantBoxName);
    return box.get(id);
  }

  Future<void> updateRestaurant(RestaurantModel restaurant) async {
    final box = await Hive.openBox<RestaurantModel>(restaurantBoxName);
    await box.put(restaurant.id, restaurant);
  }

  Future<void> deleteRestaurant(String id) async {
    final box = await Hive.openBox<RestaurantModel>(restaurantBoxName);
    await box.delete(id);
  }

  Future<void> clearAllData() async {
    await Hive.deleteBoxFromDisk(userBoxName);
    await Hive.deleteBoxFromDisk(serviceBoxName);
    await Hive.deleteBoxFromDisk(restaurantBoxName);
  }

  static Future<void> initHive() async {
    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(ServiceModelAdapter());
    Hive.registerAdapter(RestaurantModelAdapter());
  }
}
