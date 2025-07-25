import 'package:flutter_recipe_app/data/bookmark_repository/bookmark_repository.dart';

class MockBookmarkRepositoryImpl implements BookmarkRepository {
  final _bookmarks = ['1', '2', '5'];

  @override
  Future<List<String>> fetchBookmarks() async {
    return _bookmarks;
  }

  @override
  Future<void> removeBookmarks(String id) async {
    _bookmarks.removeWhere((e) => e == id);
  }
}