// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:capstone_v3/Widgets/timetracker.dart';
import 'popupButton.dart';
import 'package:capstone_v3/Objects/Party.dart';

class PartyCard extends StatefulWidget {
  final Party party;

  const PartyCard({Key? key, required this.party}) : super(key: key);

  @override
  State<PartyCard> createState() => PartyCardState();
}

class PartyCardState extends State<PartyCard> {
  final ValueNotifier<Duration> counter =
      ValueNotifier<Duration>(Duration(seconds: 0));
  String title = '';

  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      counter.value = DateTime.now().difference(widget.party.timeAdded);
    });
    return Card(
      child: ListTile(
        onTap: () {
          partyTappedDialog(widget.party);
        },
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.party.size,
              style: TextStyle(fontWeight: FontWeight.w500),
            )
          ],
        ),
        title: Text(widget.party.name),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimeTracker(counterValueNotifier: counter),
            Text(' of ${widget.party.timeQuoted}m')
          ],
        ),
      ),
    );
  }

  void partyTappedDialog(Party party) => showDialog(
      context: context,
      builder: (context) => FractionallySizedBox(
            widthFactor: .8,
            heightFactor: .52,
            child: AlertDialog(
              title: Text(party.name),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  popupButton(
                    btnText: 'Seat',
                    onPressed: (() => Navigator.pop(context)),
                  ),
                  popupButton(
                    btnText: 'Preassign',
                    onPressed: (() => Navigator.pop(context)),
                  ),
                  popupButton(
                    btnText: 'Remove',
                    onPressed: (() {
                      //  objectbox.partyBox.remove(party.id);
                      Navigator.pop(context);
                    }),
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                    onPressed: (() => Navigator.pop(context)),
                    child: Text('Cancel')),
              ],
            ),
          ));
}
