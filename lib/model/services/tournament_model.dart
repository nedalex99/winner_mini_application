import 'package:flutter/cupertino.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:winner_mini_application/model/core/models.dart';
import 'package:winner_mini_application/model/services/tournaments_api.dart';

enum HomeState { Initial, Loading, Loaded, Error }

class TournamentModel extends ChangeNotifier {
  HomeState _homeState = HomeState.Initial;
  List<TournamentGroup> tournamentGroupList = [];

  late Socket socket;

  HomeState get homeState => _homeState;

  TournamentModel() {
    socket = io(
      'https://test-micros1.play-online.com',
      OptionBuilder()
          .setTransports(['websocket'])
          .setPath("/ws")
          .setQuery({'tenantId': 2, 'protocol': 'sio1'})
          .build(),
    );

    socket.on(
      "connect",
      (data) => print(
        "Connected",
      ),
    );
    socket.on(
      "connect_error",
      (data) => print(
        "Failed to connect $data",
      ),
    );

    socket.on(
      "tournament_end",
      (data) => {
        print("Tournament end $data"),
        tournamentGroupList[0]
            .tournaments
            .removeWhere((element) => data["id"] == element.id),
        notifyListeners(),
      },
    );

    socket.on(
      "tournament_created",
      (data) => {
        print("Tournament created $data"),
        tournamentGroupList[0].tournaments.add(
              Tournament.fromJson(
                data,
              ),
            ),
        notifyListeners()
      },
    );

    fetchTournaments();
  }

  Future<void> fetchTournaments() async {
    _homeState = HomeState.Loading;
    try {
      tournamentGroupList = await TournamentsApi.getTournamentsGroup();
      _homeState = HomeState.Loaded;
    } catch (e) {
      _homeState = HomeState.Error;
    }

    notifyListeners();
  }
}
