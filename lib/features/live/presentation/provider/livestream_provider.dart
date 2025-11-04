import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:sanjaw/core/constants/base_urls.dart';
import 'package:sanjaw/features/live/data/model/live_model.dart';
import 'package:sanjaw/features/live/data/repository/livestream_repository.dart';
import 'package:socket_io_client/socket_io_client.dart' as Io;

final liveStreamRepositoryProvider = Provider((ref) => LivestreamRepository());

final livestreamProvider =
    StateNotifierProvider<LivestreamNotifier, AsyncValue<List<LiveModel>>>((ref) {
  final repository = ref.read(liveStreamRepositoryProvider);
  return LivestreamNotifier(repository);
});

class LivestreamNotifier extends StateNotifier<AsyncValue<List<LiveModel>>> {
  final LivestreamRepository repository;
  late Io.Socket socket;

  LivestreamNotifier(this.repository) : super(const AsyncValue.loading());


Future<void>fetchMatchs() async{
  try {
    final events = await repository.fetchMatch();
    state = AsyncValue.data(events);
  } catch (e, st) {
    state = AsyncValue.error(e, st);
  }
}

}
