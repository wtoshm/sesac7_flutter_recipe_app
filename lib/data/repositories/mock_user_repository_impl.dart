import 'package:flutter_recipe_app/data/models/user.dart';
import 'package:flutter_recipe_app/data/repositories/user_repository.dart';

class MockUserRepositoryImpl implements UserRepository {
  @override
  Future<User> getUser(String id) async {
    await Future.delayed(const Duration(seconds: 1));

    return User(
      id: 'currentUser',
      name: 'David',
      imageUrl:
          "https://cdn.pixabay.com/photo/2014/11/28/19/10/lump-sugar-549096_1280.jpg",
      city: 'Seoul, Korea',
      bookmarks: {1, 3, 5, 7},
    );
  }
}
