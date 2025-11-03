import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:sanjaw/core/constants/base_urls.dart';
import 'package:sanjaw/features/live/data/model/live_model.dart';
import 'package:sanjaw/features/live/data/repository/livestream_repository.dart';
import 'package:socket_io_client/socket_io_client.dart' as Io;

final liveSteramRepositoryProvider  = Provider((ref) => LivestreamRepository());

final livestreamProvider = StateNotifierProvider<LivestreamNotifier, AsyncValue<List<LiveModel>>>((ref) {
  final repository = ref.read(liveSteramRepositoryProvider);
  return LivestreamNotifier(repository);
});

class LivestreamNotifier extends StateNotifier<AsyncValue<List<LiveModel>>> {

  final LivestreamRepository repository;

  LivestreamNotifier(this.repository) : super(const AsyncValue.loading());

   late Io.Socket socket;
   
  Future<void> fetchMatchEvents(String matchId) async {

    try {

      socket = Io.io('${BaseUrls.serverUrl}', <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
      });
      socket.connect();
      socket.onConnect((_) {
        print('Connected to socket server');
        socket.emit('get_live_event', matchId);
      });

      socket.on('match_events', (data) async{
        print('New match event: $data');

        final events = await repository.fetchMatchEvents(matchId);

         state = AsyncValue.data(events);
        // You can parse the data and update the state accordingly
      });
      socket.on('new_live_events', (data) {
        print('New event received: $data');

        final event = LiveModel.fromJson(data);
        state = AsyncValue.data([...?state.value, event]);
        // Handle the new event data
      });
      
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}