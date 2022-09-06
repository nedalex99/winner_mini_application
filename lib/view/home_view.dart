import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:winner_mini_application/model/services/tournament_model.dart';
import 'package:winner_mini_application/utils/colors.dart';
import 'package:winner_mini_application/view/tournament_group_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ChangeNotifierProvider(
        create: (context) => TournamentModel(),
        child: SafeArea(
          child: Builder(
            builder: (context) {
              final model = Provider.of<TournamentModel>(context);
              if (model.homeState == HomeState.Loaded) {
                return TournamentGroupWidget(
                  tournamentGroup: model.tournamentGroupList[0],
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
