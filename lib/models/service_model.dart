import 'package:hive/hive.dart';

part 'service_model.g.dart';

@HiveType(typeId: 1)
class ServiceModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String image;

  ServiceModel({required this.id, required this.name, required this.image});

  ServiceModel copyWith({String? id, String? name, String? image}) {
    return ServiceModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }
}
