import 'package:socket_io_client/socket_io_client.dart' as IO;

class LiveMatchSocket {
  late IO.Socket socket;
  String? currentMatchId;

  void connect() {
    socket = IO.io(
      'http://10.0.2.2:3000', // replace with your server
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .enableAutoConnect()
          .build(),
    );

    socket.onConnect((_) => print('✅ Connected to Socket.IO server'));
    socket.onDisconnect((_) => print('❌ Disconnected from server'));
  }

  void joinMatch(String matchId) {
    if (currentMatchId == matchId) return;
    socket.emit('join_match', matchId);
    currentMatchId = matchId;
    print('Joined match: $matchId');
  }

  void getLiveEvents(String matchId) {
    socket.emit('get_live_events', matchId);
  }

  void sendLiveEvent(Map<String, dynamic> eventData) {
    socket.emit('send_live_event', eventData);
  }

  void onLiveEvents(Function(List<dynamic>) callback) {
    socket.on('live_events', (data) {
      callback(data);
      print(data);
      });
    
  }

  void onNewLiveEvent(Function(Map<String, dynamic>) callback) {
    socket.on('new_live_event', (data) {
      callback(data);
      print(data);

    });
  }

  void disconnect() {
    socket.disconnect();
  }
}
