import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String address;

  @HiveField(3)
  final String? profileImage;

  UserModel({
    required this.name,
    required this.email,
    required this.address,
    this.profileImage,
  });

  UserModel copyWith({
    String? name,
    String? email,
    String? address,
    String? profileImage,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      address: address ?? this.address,
      profileImage: profileImage ?? this.profileImage,
    );
  }
}
