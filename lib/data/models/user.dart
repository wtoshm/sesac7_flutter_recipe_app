import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  @override
  final String id;
  @override
  final String name;
  @override
  final String imageUrl;
  @override
  final String city;
  @override
  final Set<int> bookmarks;

  const User({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.city,
    required this.bookmarks,
  });
}