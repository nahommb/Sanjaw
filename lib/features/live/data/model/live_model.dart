
class LiveModel{
  final String matchId ;
  final String eventType;
  final String teamName;
  
LiveModel({
    required this.matchId,
    required this.eventType,
    required this.teamName,
  });

factory LiveModel.fromJson(Map<String, dynamic> json) {
    return LiveModel(
      matchId: json['match_id'] as String,
      eventType: json['event_type'] as String,
      teamName: json['team_name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'matchId': matchId,
      'eventType': eventType,
      'teamName': teamName,
    };
  }
}