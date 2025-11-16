import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';

final nightmoodProvider =
    StateNotifierProvider<NightmoodNotifier, bool>((ref) {
  return NightmoodNotifier();
});

class NightmoodNotifier extends StateNotifier<bool> {
  NightmoodNotifier() : super(false) {
    _loadInitial();
  }

  // Load saved night mode when app starts
  Future<void> _loadInitial() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getBool('isNight') ?? false;
  }

  // Toggle + save to SharedPreferences
  Future<void> toggleMood() async {
    state = !state; // instantly update UI

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isNight', state);
  }
}
