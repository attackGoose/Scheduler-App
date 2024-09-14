import 'package:better_calendar_app/providers/date_providers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

//learn how to create different pages in an app tomorrow, aka front end stuff which is for tmr
//add a bottom nav bar for this

//this will use the providers as a database and backend for the logic and for abstract programming
//to make my life easier

//TODO: if two events have a time conflict, put a prompt asking if they would like to
//replace the previous event, or to simply leave it as is (with the time conflict)

//NOTES: 
//todo, make UI design for this page, also look for ways to style this page 
//with the least amount of effort (effort's gonna go all in debugging) via object
//tomorrow's task is just to finish makingthe ui/ux and program it onto the app
//sunday's task is just to get the backend up and running 
//next week, deploy the app and start on the project that I want to do

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  DateTime focusDay = CalDates.focusDate; 
  DateFormat titleFormat = DateFormat("MM-DD-YYYY");

  //use formatting to exclude the last few things for the title (hour, and time)

//saving this as a list for now, events will be stored in chronological order
//and once clicked, it will show detail of said event
  @override
  Widget build(BuildContext context) {
    String focusDayTitleFormat = titleFormat.format(focusDay);

    return Scaffold(
      appBar: AppBar(
        title: Text("$focusDayTitleFormat Events"),
      ),
      body: Column(
        children: [ //I'll style it later and edit the placements of the events
          ListView(
            shrinkWrap: true,
            children: [
              //add smth here later to list out events
              
            ],
            // context.watch<EventList>().getEventList(focusDay) as String //list this out later
          ) 
        ],
      ),
    );
  }

  void currentTodoItem() { //shows you which todo item you're editing at the current moment

  } //actually i'll add this in the front end since i can just use a stateful widget and edit it in there
}