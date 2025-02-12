import 'package:flutter_recipe_app/domain/repository/bookmark_repository.dart';

class MockBookmarkRepositoryImpl implements BookMarkRepository {
  final _ids = <int>{2, 4};

  @override
  Future<void> save(int id) async {
    _ids.add(id);
  }

  @override
  Future<void> unSave(int id) async {
    _ids.remove(id);
  }

  @override
  Future<void> toggle(int id) async {
    if (_ids.contains(id)) {
      unSave(id);
    } else {
      save(id);
    }
  }

  @override
  Future<List<int>> getBookmarkIds() async {
    return _ids.toList();
  }

  @override
  Future<void> clear() async {
    _ids.clear();
  }
}
