
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final nightmoodProvider =
    StateNotifierProvider<NightmoodNotifier, bool>((ref) {
  return NightmoodNotifier();
});

class NightmoodNotifier extends StateNotifier<bool> {
  NightmoodNotifier() : super(false); // default: day mode

  void toggleMood() {
    state = !state;
  }
}
