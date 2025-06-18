import 'package:e_commerce_app/Blocs/home_event_bloc.dart';
import 'package:e_commerce_app/Blocs/home_state_bloc.dart';
import 'package:e_commerce_app/helper/hive_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/models/service_model.dart';
import 'package:e_commerce_app/models/restaurant_model.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HiveService hiveService;

  HomeBloc(this.hiveService) : super(HomeInitialState()) {
    on<LoadHomeDataEvent>(_onLoadHomeData);
    on<LoadServicesEvent>(_onLoadServices);
    on<LoadRestaurantsEvent>(_onLoadRestaurants);
    on<LoadUserDataEvent>(_onLoadUserData);
    on<UpdateRestaurantEvent>(_onUpdateRestaurant);
    on<UpdateServiceEvent>(_onUpdateService);
    on<UpdateUserDataEvent>(_onUpdateUser);
  }

  Future<void> _onLoadHomeData(
    LoadHomeDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(HomeLoadingState());

      await _initializeSampleData();

      final services = await hiveService.getServices();
      final restaurants = await hiveService.getRestaurants();
      final user = await hiveService.getCurrentUser();

      emit(
        HomeLoadedState(
          services: services,
          restaurants: restaurants,
          user: user,
        ),
      );
    } catch (e) {
      emit(HomeErrorState(message: e.toString()));
    }
  }

  Future<void> _onLoadServices(
    LoadServicesEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      final services = await hiveService.getServices();
      if (state is HomeLoadedState) {
        final currentState = state as HomeLoadedState;
        emit(
          HomeLoadedState(
            services: services,
            restaurants: currentState.restaurants,
            user: currentState.user,
          ),
        );
      }
    } catch (e) {
      emit(HomeErrorState(message: e.toString()));
    }
  }

  Future<void> _onLoadRestaurants(
    LoadRestaurantsEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      final restaurants = await hiveService.getRestaurants();
      if (state is HomeLoadedState) {
        final currentState = state as HomeLoadedState;
        emit(
          HomeLoadedState(
            services: currentState.services,
            restaurants: restaurants,
            user: currentState.user,
          ),
        );
      }
    } catch (e) {
      emit(HomeErrorState(message: e.toString()));
    }
  }

  Future<void> _onLoadUserData(
    LoadUserDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      final user = await hiveService.getCurrentUser();
      if (state is HomeLoadedState) {
        final currentState = state as HomeLoadedState;
        emit(
          HomeLoadedState(
            services: currentState.services,
            restaurants: currentState.restaurants,
            user: user,
          ),
        );
      }
    } catch (e) {
      emit(HomeErrorState(message: e.toString()));
    }
  }

  Future<void> _onUpdateRestaurant(
    UpdateRestaurantEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      await hiveService.addRestaurant(event.updatedRestaurant);
      add(LoadRestaurantsEvent());
    } catch (e) {
      emit(HomeErrorState(message: e.toString()));
    }
  }

  Future<void> _onUpdateService(
    UpdateServiceEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      await hiveService.addService(event.updatedService);
      add(LoadServicesEvent());
    } catch (e) {
      emit(HomeErrorState(message: e.toString()));
    }
  }

  Future<void> _onUpdateUser(
    UpdateUserDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      await hiveService.saveUser(event.updateUserData);
      add(LoadUserDataEvent());
    } catch (e) {
      emit(HomeErrorState(message: e.toString()));
    }
  }

  Future<void> _initializeSampleData() async {
    final services = [
      ServiceModel(id: '1', name: 'Food', image: 'assets/images/Group 76.png'),
      ServiceModel(
        id: '2',
        name: 'Health',
        image:
            'assets/images/vector-a-set-of-medicine-and-prescription-removebg-preview-2048x1773 1.png',
      ),
      ServiceModel(
        id: '3',
        name: 'Groceries',
        image: 'assets/images/Group 78.png',
      ),
    ];

    for (final service in services) {
      await hiveService.addService(service); // overwrites by id
    }

    final restaurants = [
      RestaurantModel(
        id: '1',
        name: 'Allo Beirut', // update here to test hot reload
        image: 'assets/images/Group 16.png',
        rating: 4.5,
        category: 'Lebanese',
        isPopular: true,
      ),
      RestaurantModel(
        id: '2',
        name: 'Laffah',
        image: 'assets/images/Group 13.png',
        rating: 4.2,
        category: 'Middle Eastern',
        isPopular: true,
      ),
      RestaurantModel(
        id: '3',
        name: 'Falafil A Rabiah',
        image: 'assets/images/Group 14.png',
        rating: 4.3,
        category: 'Arabic',
        isPopular: true,
      ),
      RestaurantModel(
        id: '4',
        name: 'Barbar',
        image: 'assets/images/Group 17.png',
        rating: 4.1,
        category: 'Lebanese',
        isPopular: true,
      ),
    ];

    for (final restaurant in restaurants) {
      await hiveService.addRestaurant(restaurant); // overwrites by id
    }
  }
}
