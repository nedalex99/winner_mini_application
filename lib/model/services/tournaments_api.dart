import 'dart:convert';

import 'package:winner_mini_application/model/core/models.dart';
import 'package:http/http.dart' as http;

class TournamentsApi {

  static Future<List<TournamentGroup>> getTournamentsGroup() async {
    final getTournaments = await http.get(
      Uri.parse(
          'https://test-micros1.play-online.com/missions/tournaments/list?tenant_id=2'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      },
    );
    final List responseBody = jsonDecode(getTournaments.body);
    return responseBody.map((e) => TournamentGroup.fromJson(e)).toList();
  }
}
