import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:winner_mini_application/model/core/models.dart';
import 'package:winner_mini_application/utils/colors.dart';
import 'package:winner_mini_application/utils/strings.dart';

class TournamentCard extends StatelessWidget {
  const TournamentCard({
    Key? key,
    required this.tournament,
  }) : super(key: key);

  final Tournament tournament;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6.0,
                  vertical: 2.0,
                ),
                decoration: const BoxDecoration(
                  color: kYellowEnrolled,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      4.0,
                    ),
                  ),
                ),
                child: const Text(
                  kActiveNow,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 4.0,
              ),
              Text(
                '${DateFormat("d MMM").format(
                  DateTime.fromMillisecondsSinceEpoch(
                    tournament.startDate,
                  ),
                )} - ${DateFormat("d MMM").format(
                  DateTime.fromMillisecondsSinceEpoch(
                    tournament.endDate,
                  ),
                )}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 10.0,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Container(
            width: MediaQuery.of(context).size.width / 2,
            decoration: const BoxDecoration(
              color: kInnerCardBackground,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  8.0,
                ),
              ),
            ),
            // Top icon with prize
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      tournament.meta.ui.cornerImage.url,
                      width: 60,
                      height: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            tournament.meta.ui.prize1.text.ro,
                            style: const TextStyle(
                              color: Color(
                                0xFF5298b1,
                              ),
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            tournament.meta.ui.prize2.text.ro,
                            style: const TextStyle(
                              color: Color(
                                0xFF5298b1,
                              ),
                              fontWeight: FontWeight.w300,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Text(
                  '${DateTime.fromMillisecondsSinceEpoch(tournament.startDate).day.toString()} - '
                  '${DateTime.fromMillisecondsSinceEpoch(tournament.endDate).day.toString()} '
                  '${DateFormat("MMMM").format(DateTime.fromMillisecondsSinceEpoch(tournament.endDate))}',
                  style: const TextStyle(
                    color: Color(
                      0xFF687584,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Image.network(
                            tournament.meta.ui.gamesImage.url,
                            width: 60,
                            height: 60,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Text(
                            '+${tournament.meta.games.length} jocuri',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 8.0,
                            ),
                          ),
                        )
                      ],
                    ),
                    Image.network(
                      tournament.meta.ui.topImage.url,
                      width: 60,
                      height: 60,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                tournament.enrolled == false
                    ? Column(
                        children: [
                          //Button
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 20,
                                  child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.pink,
                                      padding: EdgeInsets.zero,
                                      minimumSize: Size.zero,
                                    ),
                                    child: const Text(
                                      kNotYetEnrolled,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 25,
                                  child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.purple,
                                      padding: EdgeInsets.zero,
                                      minimumSize: Size.zero,
                                    ),
                                    child: const Text(
                                      kParticipate,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
