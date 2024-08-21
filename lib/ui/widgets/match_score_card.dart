import 'package:firebase_app/entities/football.dart';
import 'package:flutter/material.dart';

class MatchScoreCard extends StatelessWidget {
  const MatchScoreCard({
    super.key, required this.football,
  });

  final Football football;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xffd1c9d4),
      margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            teamInfo(football.team1Score.toString(), football.team1Name),
            const Text("vs",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
            teamInfo(football.team2Score.toString(), football.team2Name),          ],
        ),
      ),
    );
  }

  Column teamInfo(String score , String name) {
    return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                score,
                style:const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              Text(name,
                  style:
                      const TextStyle(fontSize: 17, fontWeight: FontWeight.w400)),
            ],
          );
  }
}
