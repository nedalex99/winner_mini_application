import 'package:flutter/material.dart';
import 'package:winner_mini_application/model/core/models.dart';
import 'package:winner_mini_application/utils/colors.dart';
import 'package:winner_mini_application/view/tournament_group_card.dart';

class TournamentGroupWidget extends StatelessWidget {
  const TournamentGroupWidget({
    Key? key,
    required this.tournamentGroup,
  }) : super(key: key);

  final TournamentGroup tournamentGroup;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 4.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tournamentGroup.name,
            style: const TextStyle(
              fontSize: 16,
              color: kTitleColor,
            ),
          ),
          Expanded(
            child: TournamentGroupCard(
              tournamentGroup: tournamentGroup,
            ),
          ),
        ],
      ),
    );
  }
}
