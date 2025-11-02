import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:sanjaw/features/home/data/models/match_day_model.dart';
import 'package:sanjaw/features/home/data/repositories/match_day_repository.dart';


final matchDayRepositoryProvider = Provider((ref) => MatchDayRepository());

final matchDayListProvider = StateNotifierProvider<MatchDayNotifier, AsyncValue<List<MatchDayModel>>>((ref) {
  final repository = ref.read(matchDayRepositoryProvider);
  return MatchDayNotifier(repository);
});


class MatchDayNotifier extends StateNotifier<AsyncValue<List<MatchDayModel>>> {
 
  final MatchDayRepository repository;

  MatchDayNotifier(this.repository) : super(const AsyncValue.loading()) {
    fetchMatchDays();
  }

  Future<void> fetchMatchDays() async {
    try {
      final matchDays = await repository.fatchMatch();
      state = AsyncValue.data(matchDays);
    } catch (e) {
      debugPrint('Error fetching match days: $e');
    }
  }

}