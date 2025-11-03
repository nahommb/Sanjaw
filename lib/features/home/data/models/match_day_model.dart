

class MatchDayModel {
 
 final DateTime? matchDate;
 final String homeTeam;
 final String awayTeam;
//  final String matchTime;  
 final String? eventType;
 final String? venue;
 final DateTime? createdAt;

  MatchDayModel({
    required this.matchDate,
    required this.homeTeam,
    required this.awayTeam,
    // required this.matchTime,
    required this.eventType,
    this.venue,
    this.createdAt,
  });

factory MatchDayModel.fromJson(Map<String, dynamic> json) {
  return MatchDayModel(
    matchDate: json['match_date'] != null ? DateTime.parse(json['match_date']) : null,
    homeTeam: json['home_team'] as String,
    awayTeam: json['away_team'] as String,
    // matchTime: json['match_time'] as String,
    eventType: json['event_type'] as String,
    venue: json['venue'] as String?,
    createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
  );
  }

Map<String, dynamic> toJson() {
  return {
    'matchDate': matchDate?.toIso8601String(),
    'homeTeam': homeTeam,
    'awayTeam': awayTeam,
    // 'matchTime': matchTime,
    'eventType': eventType,
    'venue': venue,
    'createdAt': createdAt?.toIso8601String(),
  }; 
  }
}