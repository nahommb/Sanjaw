
class LiveModel{
  final int id ;
  final String homeTeam;
  final String awayTeam;
  final String? liveId;
  // final String? homeScore;
  // final String? awayScore;
  
LiveModel({
    required this.id,
    required this.homeTeam,
    required this.awayTeam,
    this.liveId,
    // this.homeScore,
    // this.awayScore,
  });

factory LiveModel.fromJson(Map<String, dynamic> json) {
    return LiveModel(
      id: json['id'] as int,
      homeTeam: json['home_team'] as String,
      awayTeam: json['away_team'] as String,
      liveId:json['live_id'] as String?,
      // homeScore:json['home_score'] as String,
      // awayScore:json['away_score'] as String,

    );
  }

Map<String, dynamic> toJson() {
    return {
      'id': id,
      'homeTeam': homeTeam,
      'awayTeam': awayTeam,
      'liveId':liveId,
      // 'homeScore':homeScore,
      // 'awayScore':awayScore,
    };
  }
}