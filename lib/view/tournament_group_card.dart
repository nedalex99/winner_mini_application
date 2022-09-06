import 'package:flutter/material.dart';
import 'package:winner_mini_application/model/core/models.dart';
import 'package:winner_mini_application/utils/colors.dart';
import 'package:winner_mini_application/utils/images.dart';
import 'package:winner_mini_application/view/tournament_card.dart';

class TournamentGroupCard extends StatelessWidget {
  const TournamentGroupCard({
    Key? key,
    required this.tournamentGroup,
  }) : super(key: key);

  final TournamentGroup tournamentGroup;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 8.0,
      ),
      decoration: BoxDecoration(
        color: kCardBackground,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            12.0,
          ),
        ),
        border: Border.all(
          color: kBorderColor,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(
                12.0,
              ),
            ),
            child: Image.asset(
              kWinnerTopPageImage,
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => TournamentCard(
                tournament: tournamentGroup.tournaments[index],
              ),
              itemCount: tournamentGroup.tournaments.length,
            ),
          ),
        ],
      ),
    );
  }
}
