
class LiveModel{
  final int id ;
  final String homeTeam;
  final String awayTeam;
  final String? liveId;
  
LiveModel({
    required this.id,
    required this.homeTeam,
    required this.awayTeam,
    this.liveId,
  });

factory LiveModel.fromJson(Map<String, dynamic> json) {
    return LiveModel(
      id: json['id'] as int,
      homeTeam: json['home_team'] as String,
      awayTeam: json['away_team'] as String,
      liveId:json['live_id'] as String?
    );
  }

Map<String, dynamic> toJson() {
    return {
      'id': id,
      'homeTeam': homeTeam,
      'awayTeam': awayTeam,
      'liveId':liveId,
    };
  }
}