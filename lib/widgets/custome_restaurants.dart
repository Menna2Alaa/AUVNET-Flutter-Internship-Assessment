// custome_restaurants.dart
import 'package:e_commerce_app/widgets/custome_button.dart';
import 'package:e_commerce_app/widgets/custome_text.dart';
import 'package:e_commerce_app/widgets/services_and_restaurnts_items.dart';
import 'package:e_commerce_app/models/restaurant_model.dart';
import 'package:flutter/material.dart';

class CustomeRestaurants extends StatelessWidget {
  final List<RestaurantModel> restaurants;

  const CustomeRestaurants({super.key, required this.restaurants});

  @override
  Widget build(BuildContext context) {
    final popularRestaurants = restaurants.where((r) => r.isPopular).toList();

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: CustomeText(
            text: "Popular restaurants nearby",
            textColor: Colors.black,
            font: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 150,
          child: popularRestaurants.isEmpty
              ? Center(
                  child: CustomeText(
                    text: 'No popular restaurants available',
                    textColor: Colors.grey,
                    fontSize: 14,
                  ),
                )
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: popularRestaurants.length,
                  itemBuilder: (context, index) {
                    final restaurant = popularRestaurants[index];
                    return Padding(
                      padding: EdgeInsets.only(
                        right: index < popularRestaurants.length - 1 ? 20 : 0,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          //print('Restaurant tapped: ${restaurant.name}');
                          showRestaurantDetails(context, restaurant);
                        },
                        child: Column(
                          children: [
                            ServicesndResturntsItems(
                              image: restaurant.image,
                              text: restaurant.name,
                            ),
                            SizedBox(height: 4),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 14),
                                SizedBox(width: 4),
                                CustomeText(
                                  text: restaurant.rating.toString(),
                                  textColor: Colors.grey[600]!,
                                  fontSize: 12,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  void showRestaurantDetails(BuildContext context, RestaurantModel restaurant) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xffF5F5F5),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      restaurant.image,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.restaurant,
                          size: 40,
                          color: Colors.grey,
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomeText(
                        text: restaurant.name,
                        textColor: Colors.black,
                      ),

                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          SizedBox(width: 4),
                          CustomeText(
                            text: '${restaurant.rating} Rating',
                            textColor: Colors.grey[600]!,
                            fontSize: 14,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: CustomeButton(
                onTap: () {
                  Navigator.pop(context);
                },
                text: 'View',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
