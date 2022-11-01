import 'package:pronochain/model/league.dart';
import 'package:pronochain/model/team.dart';

class Match {
  int id;
  String date;
  int homeTeamId;
  int awayTeamId;
  int leagueId;
  int sportId;
  Team homeTeam;
  Team awayTeam;
  League league;

  Match(
      {required this.id,
      required this.date,
      required this.homeTeamId,
      required this.awayTeamId,
      required this.leagueId,
      required this.sportId,
      required this.homeTeam,
      required this.awayTeam,
      required this.league});

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
        id: json['id'],
        date: json['date'],
        homeTeamId: json['home_team_id'],
        awayTeamId: json['away_team_id'],
        leagueId: json['league_id'],
        sportId: json['sport_id'],
        homeTeam: Team.fromJson(json['homeTeam']),
        awayTeam: Team.fromJson(json['awayTeam']),
        league: League.fromJson(json['league']));
  }
}
