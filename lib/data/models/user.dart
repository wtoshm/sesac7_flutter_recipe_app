import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  @override
  final int id;
  @override
  final String name;
  @override
  final String imageUrl;
  @override
  final String city;

  const User({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.city,
  });
}