// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'CounterBody.dart';

class Party {
  Party({
    required this.name,
    required this.size,
    required this.phoneNumber,
    required this.timeQuoted,
    required this.timeAdded,
//these are future problems
    //required this.notified
  });
  String name;
  String size;
  String phoneNumber;
  int timeQuoted;
  DateTime timeAdded;
  //final bool notified;
}

typedef PartyEditCallback = Function(Party party);

class PartyItem extends StatelessWidget {
  PartyItem({required this.party, required this.partyEdit})
      : super(key: ObjectKey(party));

  final Party party;
  final PartyEditCallback partyEdit;
  final ValueNotifier<Duration> counter =
      ValueNotifier<Duration>(Duration(seconds: 0));

  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 10), (timer) {
      counter.value = DateTime.now().difference(party.timeAdded);
    });
    return Card(
        child: ListTile(
      onTap: () {
        partyEdit(party);
      },
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            party.size,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
      title: Text(party.name),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CounterBody(counterValueNotifier: counter),
          Text(' of ${party.timeQuoted}m')
        ],
      ),
    ));
  }
}
