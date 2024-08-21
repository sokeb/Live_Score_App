import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../entities/football.dart';
import '../widgets/match_score_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<Football> matchList = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: StreamBuilder(
        stream: firebaseFirestore.collection("football").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {

          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }

          if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()),);
          }

          if(snapshot.hasData== false){
            return const  Center(child: Text("Empty List"));
          }
          matchList.clear();
          for (QueryDocumentSnapshot doc in snapshot.data?.docs?? []) {
            matchList.add(
              Football(
                  team1Name: doc.get('team1Name'),
                  team2Name: doc.get('team2Name'),
                  team1Score: doc.get('team1'),
                  team2Score: doc.get('team2')),
            );
          }

          return ListView.builder(
              itemCount: matchList.length,
              itemBuilder: (context, index) {
                return MatchScoreCard(
                  football: matchList[index],
                );
              });
        }
      ),
    );
  }
}
