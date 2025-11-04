import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sanjaw/core/config/app_colors.dart';
import 'package:sanjaw/features/live/data/model/live_model.dart';
import 'package:sanjaw/features/live/presentation/provider/livestream_provider.dart';
import 'package:sanjaw/features/live/presentation/provider/socket_provider.dart';


class LiveCommenetator extends ConsumerStatefulWidget {
  const LiveCommenetator({super.key});

  @override
  ConsumerState<LiveCommenetator> createState() => _LiveCommenetatorState();
}

class _LiveCommenetatorState extends ConsumerState<LiveCommenetator> {
  bool _joined = false;

  @override
  void initState() {
    super.initState();
    ref.read(livestreamProvider.notifier).fetchMatchs();
  }

  @override
  Widget build(BuildContext context) {
    final liveEventsAsync = ref.watch(liveEventsProvider);
    final availableLiveMatch = ref.watch(livestreamProvider);

    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;

    // ✅ Rejoin first match dynamically if needed
    ref.listen<AsyncValue<List<LiveModel>>>(livestreamProvider, (previous, next) {
      next.whenData((matches) {
        if (matches.isNotEmpty) {
          final matchId = matches[0].id.toString();
          final socket = ref.read(liveMatchSocketProvider);

          if (!_joined || socket.currentMatchId != matchId) {
            socket.joinMatch(matchId);
            socket.getLiveEvents(matchId);
            _joined = true;
          }
        }
      });
    });

    return availableLiveMatch.when(
      data: (matches) {
        if (matches.isEmpty) return const Center(child: Text('No live matches available'));

        final firstMatch = matches[0];
        final homeTeam = firstMatch.homeTeam;
        final awayTeam = firstMatch.awayTeam;

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text(
                'Streaming live from YouTube',
                style: TextStyle(fontSize: 14, color: AppColors.secondaryColor),
              ),
              const SizedBox(height: 6),
              const Text('Key Events', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),

              // Match title row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(homeTeam, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const Text('vs'),
                  Text(awayTeam, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
              const SizedBox(height: 10),

              Expanded(
                child: SingleChildScrollView(
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // LEFT: Home events
                        Container(
                          width: screenWidth * 0.4,
                          margin: const EdgeInsets.only(right: 10),
                          child: liveEventsAsync.when(
                            data: (events) {
                              final home = events['home'] ?? [];
                              if (home.isEmpty) return const Text('No live events yet');

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  for (final event in home.reversed) ...[
                                    Row(
                                      children: [
                                        const SizedBox(width: 5),
                                        Expanded(
                                          child: Text(
                                            '${event['event_type']} - ${event['team_name']}',
                                            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                  ],
                                ],
                              );
                            },
                            loading: () => const Center(child: CircularProgressIndicator()),
                            error: (err, _) => Text('Error: $err'),
                          ),
                        ),

                        // Divider
                        Container(
                          width: screenWidth * 0.005,
                          color: AppColors.primaryColor,
                          margin: const EdgeInsets.symmetric(vertical: 20),
                        ),

                        // RIGHT: Away events
                        Container(
                          width: screenWidth * 0.4,
                          margin: const EdgeInsets.only(left: 10),
                          child: liveEventsAsync.when(
                            data: (events) {
                              final away = events['away'] ?? [];
                              if (away.isEmpty) return const Text('No live events yet');

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  for (final event in away.reversed) ...[
                                    Row(
                                      children: [
                                        const SizedBox(width: 5),
                                        Expanded(
                                          child: Text(
                                            '${event['event_type']} - ${event['team_name']}',
                                            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                  ],
                                ],
                              );
                            },
                            loading: () => const Center(child: CircularProgressIndicator()),
                            error: (err, _) => Text('Error: $err'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Text('Error: $err'),
    );
  }
}
