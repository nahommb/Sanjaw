import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sanjaw/features/live/data/repository/livestream_socket.dart';

/// Socket provider
final liveMatchSocketProvider = Provider<LiveMatchSocket>((ref) {
  final socket = LiveMatchSocket();
  socket.connect();
  ref.onDispose(() => socket.disconnect());
  return socket;
});

/// Live events provider (home & away)
final liveEventsProvider = StreamProvider.autoDispose
    <Map<String, List<dynamic>>>((ref) {
  ref.keepAlive();

  final socket = ref.watch(liveMatchSocketProvider);
  final controller = StreamController<Map<String, List<dynamic>>>.broadcast();

  final homeEvents = <dynamic>[];
  final awayEvents = <dynamic>[];

  void handleLiveEvents(List<dynamic> data) {
    homeEvents
      ..clear()
      ..addAll(data.where((e) => e['team_type'] == 'home'));
    awayEvents
      ..clear()
      ..addAll(data.where((e) => e['team_type'] == 'away'));

    controller.add({'home': List.from(homeEvents), 'away': List.from(awayEvents)});
  }

  void handleNewLiveEvent(Map<String, dynamic> data) {
    print('🟢 New event received: $data');

    if (data['team_type'] == 'home') {
      homeEvents.insert(0, data);
    } else if (data['team_type'] == 'away') {
      awayEvents.insert(0, data);
    }

    controller.add({'home': List.from(homeEvents), 'away': List.from(awayEvents)});
  }

  // Prevent duplicate listeners when rebuilding
  socket.socket.off('live_events');
  socket.socket.off('new_live_event');

  socket.onLiveEvents(handleLiveEvents);
  socket.onNewLiveEvent(handleNewLiveEvent);

  // ✅ Optional: fetch initial events (if a match is already joined)
  if (socket.currentMatchId != null) {
    socket.getLiveEvents(socket.currentMatchId!);
  }

  ref.onDispose(() {
    socket.socket.off('live_events');
    socket.socket.off('new_live_event');
    controller.close();
  });

  return controller.stream;
});
