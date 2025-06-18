// home_view.dart
import 'package:e_commerce_app/Blocs/home_bloc.dart';
import 'package:e_commerce_app/Blocs/home_event_bloc.dart';
import 'package:e_commerce_app/Blocs/home_state_bloc.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/widgets/custome_bottom_navigator_bar.dart';
import 'package:e_commerce_app/widgets/custome_promo_banner.dart';
import 'package:e_commerce_app/widgets/custome_qr_code.dart';
import 'package:e_commerce_app/widgets/custome_restaurants.dart';
import 'package:e_commerce_app/widgets/custome_services.dart';
import 'package:e_commerce_app/widgets/custome_shortcuts.dart';
import 'package:e_commerce_app/widgets/custome_welcome_user_message.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static String id = kHomeId;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(LoadHomeDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(color: Color(0xff8900FE)),
              );
            }

            if (state is HomeErrorState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, size: 60, color: Colors.red),
                    SizedBox(height: 16),
                    Text(
                      'Error: ${state.message}',
                      style: TextStyle(fontSize: 16, color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<HomeBloc>().add(LoadHomeDataEvent());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff8900FE),
                      ),
                      child: Text(
                        'Retry',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              );
            }

            if (state is HomeLoadedState) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<HomeBloc>().add(LoadHomeDataEvent());
                },
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                      left: 16,
                      right: 16,
                    ),
                    child: Column(
                      children: [
                        CustomeWelcomeUserMessage(user: state.user),
                        SizedBox(height: 20),
                        CustomeServices(services: state.services),
                        SizedBox(height: 20),
                        CustomeQrCode(),
                        SizedBox(height: 20),
                        CustomeShortcuts(),
                        SizedBox(height: 20),
                        CustomePromoBanner(),
                        SizedBox(height: 20),
                        CustomeRestaurants(restaurants: state.restaurants),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              );
            }

            return Container(); // Default empty container
          },
        ),
      ),
      bottomNavigationBar: CustomeBottomNavigatorBar(),
    );
  }
}
