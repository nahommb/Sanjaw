import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../../data/models/post_model.dart';
import '../../data/repositories/post_repository.dart';

final postRepositoryProvider = Provider((ref) => PostRepository());

final postListProvider = StateNotifierProvider<PostNotifier, AsyncValue<List<PostModel>>>((ref) {
  final repository = ref.read(postRepositoryProvider);
  return PostNotifier(repository);
});

class PostNotifier extends StateNotifier<AsyncValue<List<PostModel>>> {
  final PostRepository repository;
  int _page = 1;
  bool _hasMore = true;

  PostNotifier(this.repository) : super(const AsyncValue.loading()) {
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    if (!_hasMore) return;
    try {
      final posts = await repository.fetchPosts(page: _page);
      if (posts.isEmpty) {
        _hasMore = false;
      }
      final current = state.value ?? [];
      state = AsyncValue.data([...current, ...posts]);
      _page++;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
