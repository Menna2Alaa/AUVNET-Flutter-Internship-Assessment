import 'package:hive/hive.dart';

part 'restaurant_model.g.dart';

@HiveType(typeId: 2)
class RestaurantModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String image;

  @HiveField(3)
  final double rating;

  @HiveField(4)
  final String category;

  @HiveField(5)
  final bool isPopular;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.image,
    required this.rating,
    required this.category,
    this.isPopular = false,
  });

  RestaurantModel copyWith({
    String? id,
    String? name,
    String? image,
    double? rating,
    String? category,
    bool? isPopular,
  }) {
    return RestaurantModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      rating: rating ?? this.rating,
      category: category ?? this.category,
      isPopular: isPopular ?? this.isPopular,
    );
  }
}
