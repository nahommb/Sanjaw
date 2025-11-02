

class MatchDayModel {
 
 final DateTime matcheDate;
 final String homeTeam;
 final String awayTeam;
 final String matchTime;  
 final String? eventType;
 final String? venue;

  MatchDayModel({
    required this.matcheDate,
    required this.homeTeam,
    required this.awayTeam,
    required this.matchTime,
    required this.eventType,
    this.venue,
  });

factory MatchDayModel.fromJson(Map<String, dynamic> json) {
  return MatchDayModel(
    matcheDate: DateTime.parse(json['matche_date'] as String),
    homeTeam: json['home_team'] as String,
    awayTeam: json['away_team'] as String,
    matchTime: json['match_time'] as String,
    eventType: json['event_type'] as String,
    venue: json['venue'] as String?,
  );
  }

Map<String, dynamic> toJson() {
  return {
    'matcheData': matcheDate.toIso8601String(),
    'homeTeam': homeTeam,
    'awayTeam': awayTeam,
    'matchTime': matchTime,
    'eventType': eventType,
    'venue': venue,
  }; 
  }
}