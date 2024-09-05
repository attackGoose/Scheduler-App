import 'package:better_calendar_app/providers/date_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//learn how to create different pages in an app tomorrow, aka front end stuff which is for tmr
//add a bottom nav bar for this

//this will use the providers as a database and backend for the logic and for abstract programming
//to make my life easier

//TODO: if two events have a time conflict, put a prompt asking if they would like to
//replace the previous event, or to simply leave it as is (with the time conflict)
class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  final DateTime _focusDay = CalDates.selectedDate;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("{Selected Day} Events"),
      ),
      body: Column(
        children: [ //I'll style it later and edit the placements of the events
          Text(
            context.watch<EventList>().getEventList(_focusDay) as String //list this out later
          ) 
        ],
      ),
    );
  }

  void currentTodoItem() { //shows you which todo item you're editing at the current moment

  } //actually i'll add this in the front end since i can just use a stateful widget and edit it in there
}