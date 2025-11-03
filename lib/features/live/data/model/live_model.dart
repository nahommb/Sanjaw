
class LiveModel{
  final String matchId ;
  final String homeTeam;
  final String awayTeam;
  final String homeScore;
  final String awayScore;
  
  LiveModel({
    required this.matchId,
    required this.homeTeam,
    required this.awayTeam,
    required this.homeScore,
    required this.awayScore,
  });

  factory LiveModel.fromJson(Map<String, dynamic> json) {
    return LiveModel(
      matchId: json['match_id'] as String,
      homeTeam: json['home_team'] as String,
      awayTeam: json['away_team'] as String,
      homeScore: json['home_score'] as String,
      awayScore: json['away_score'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'matchId': matchId,
      'homeTeam': homeTeam,
      'awayTeam': awayTeam,
      'homeScore': homeScore,
      'awayScore': awayScore,
    };
  }
}