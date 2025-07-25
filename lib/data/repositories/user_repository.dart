import 'package:flutter_recipe_app/data/models/user.dart';

abstract interface class UserRepository {
  Future<User> getUser(String id);
}