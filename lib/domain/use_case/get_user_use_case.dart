import 'package:flutter_recipe_app/data/models/user.dart';
import 'package:flutter_recipe_app/data/repositories/user_repository.dart';

class GetUserUseCase {
  final UserRepository _userRepository;
  final String userId;

  const GetUserUseCase({
    required this.userId,
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  Future<User> execute() async {
    return await _userRepository.getUser(userId);
  }


}