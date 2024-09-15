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
  final TextEditingController _eventController = TextEditingController();

  //use formatting to exclude the last few things for the title (hour, and time)

//saving this as a list for now, events will be stored in chronological order
//and once clicked, it will show detail of said event
  @override
  Widget build(BuildContext context) {
    String focusDayFormatted = titleFormat.format(focusDay);
    EventList currentEvents = EventList(date: focusDay);
    return Scaffold(
      appBar: AppBar(
        title: Text("$focusDayFormatted Events"),
      ),
      body: Column(
        children: [ //I'll style it later and edit the placements of the events
          ListView(
            shrinkWrap: true,
            children: const [
              //add smth here later to list out events
              //also remember to take out the const, added it to make my ide stop
              //screaming at me
            ],
            // context.watch<EventList>().getEventList(focusDay) as String //list this out later
          ),
          FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context, 
                builder: (context) {
                  return AlertDialog(
                    scrollable: true,
                    title: const Text("Event Name"),
                    content: Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextField(
                        controller: _eventController, 
                        //TODO: add more controllers for different parameters 
                        //that way I can order them in the way that I want in the
                        //dynamic list that is storing this info temporarily

                      )
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            //add events to database and close the prompt
                            currentEvents.addEventItem(focusDay, [_eventController.text]); 
                            Navigator.of(context).pop();
                          }, 
                          child: const Text("add event"))
                      ],
                    );
                  }
                );
            },
            child: const Icon(Icons.add)
            
          ),
        ],
      ),
    );
  }

  void currentTodoItem() { //shows you which todo item you're editing at the current moment

  } //actually i'll add this in the front end since i can just use a stateful widget and edit it in there
}