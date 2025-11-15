
class Previousmatchesmodel {

  final String homeTeam;
  final String awayTeam;
  final String homeScore;
  final String awayScore;
  final String matchType;

 Previousmatchesmodel({
  required this.homeTeam,
  required this.awayTeam,
  required this.homeScore,
  required this.awayScore,
  required this.matchType,
 });

 factory Previousmatchesmodel.fromJson(Map<String,dynamic> json){

  return Previousmatchesmodel(
      homeTeam: json['home_team'] as String,
      awayTeam: json['away_team'] as String,
      homeScore: json['home_score'] as String,
      awayScore: json['away_score'] as String,
      matchType: json['match_type'] as String
  );
 }

 Map<String,dynamic> toJson(){

  return{
    homeTeam:homeTeam,
    awayTeam:awayTeam,
    homeScore:homeScore,
    awayScore:awayScore,
    matchType:matchType,
  };
 }
}