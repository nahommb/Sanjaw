
class Previousmatchesmodel {

  final String homeTeam;
  final String awayTeam;
  final int homeScore;
  final int awayScore;
  final String? matchType;

 Previousmatchesmodel({
  required this.homeTeam,
  required this.awayTeam,
  required this.homeScore,
  required this.awayScore,
  this.matchType,
 });

 factory Previousmatchesmodel.fromJson(Map<String,dynamic> json){

  return Previousmatchesmodel(
      homeTeam: json['home_team'] as String,
      awayTeam: json['away_team'] as String,
      homeScore: json['home_score'] as int,
      awayScore: json['away_score'] as int,
      matchType: json['match_type'] as String?
  );
 }

 Map<dynamic,dynamic> toJson(){

  return{
    homeTeam:homeTeam,
    awayTeam:awayTeam,
    homeScore:homeScore,
    awayScore:awayScore,
    matchType:matchType,
  };
 }
}