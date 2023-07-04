import 'dart:convert';
import 'package:flutter_mvvm_structure/model/services/team.dart';
import 'package:http/http.dart' as http;

class GetTeam {
  List<Team> teams = [];

  Future getTeams() async {
    var response = await http.get(Uri.http('balldontlie.io', 'api/v1/teams'));
    var jsonData = jsonDecode(response.body);

    for (var eachTeam in jsonData['data']) {
      final team = Team(
        abbrevation: eachTeam['abbreviation'],
        city: eachTeam['city'],
      );
      teams.add(team);
    }
    print(teams.length);
  }
}
