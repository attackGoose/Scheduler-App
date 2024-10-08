// ignore: unused_import
import 'package:better_calendar_app/main.dart';
import 'package:better_calendar_app/pages/calendar.dart';
import 'package:better_calendar_app/pages/date_events.dart';
import 'package:flutter/material.dart';
import 'package:better_calendar_app/providers/date_providers.dart';
// ignore: unused_import
import 'package:provider/provider.dart';
import 'dart:math';

//https://blog.logrocket.com/creating-multi-page-app-flutter/
class HomePage extends StatefulWidget {
  const HomePage({super.key}); //the class parameters are declared here, like class constructor

  @override
  State <HomePage> createState() => _HomePageState();
} //i'll need this to be a stateful widget to do some cool button stuff

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    DateTime todayDate = DateTime.now();
    TodoList todaysTodo = TodoList(date: todayDate);

    EventList todaysEvents = EventList(date: todayDate);
  //access the 
    //var totItemsInTodoList = TodoList.itemsInTodoList(todayDate);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Today's Schedule"),
      ),

      body: Row( //
        children: [          
          //first column, has 3 items, button for calendar, list for todo, and button for event
          Column(
          children: [
            Container(
            color: const Color.fromRGBO(255, 249, 233, 0.694),
            alignment: Alignment.topLeft, //random numbers, change later
            child: TextButton(
              onPressed: () {
                Ink(child: InkWell(
                  onTap: () => {
                    
                }),);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const CalendarPage();
                }
              ));},
              autofocus: true,
              style: const ButtonStyle(), //style it some later
              child: const Text("Calendar"),
              ),
            ),

            Container(
              padding: const EdgeInsets.all(10),
              color: const Color.fromRGBO(255, 249, 233, 0.694),
              //style it more later
              alignment: Alignment.centerLeft, //random numbers, change later
              //https://stackoverflow.com/questions/50252569/vertical-viewport-was-given-unbounded-height
              child: SizedBox(  //debating whether or not to get rid of this cus its too rigid on the size
                width: 90,
                height: 450,
                child:
                ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: 
                  todaysTodo.getTodoList(todaysTodo.getCurrDate())
                    .map(
                      (todoItem) => (todaysTodo.indexInTodoList(todaysTodo.getCurrDate(), todoItem) < 3 
                      && 
                      todaysTodo.indexInTodoList(todaysTodo.getCurrDate(), todoItem) > 0) ? ListTile( 
                        subtitle: Text(todoItem),
                      ) : ListTile(subtitle: Text("+ ${max(todaysTodo.itemsInTodoList(todaysTodo.getCurrDate()), 0) - 2} items in todo list"))
                    ).toList()
                    //I will impliment a system that makes the amount of todos manageable
                    //with the amount of time available after events later
                      //https://api.flutter.dev/flutter/material/ListTile-class.html i'll use this transition
                  ,
                )
              ),
            ),

            //events button
            Container(
            color: const Color.fromRGBO(255, 249, 233, 0.694),
            alignment: Alignment.bottomLeft, //random numbers, change later
            child: TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const EventsPage();
                }
              ));
              },
              child: const Text("Events"),
              ),
            ),
          ],
        ),

        //second column, has tday's date, todo button, and upcoming events
        Column(
          children: [
            //prints today's date and styles it
            Container(
            color: const Color.fromRGBO(255, 249, 233, 0.694),
            alignment: Alignment.topRight, //random numbers, change later
            child: Text("Date: $todayDate"),
            ),
            
            //button to take you to the todo page to add or edit tasks
            Container(
            color: const Color.fromRGBO(255, 249, 233, 0.694),
            //style it more later
            alignment: Alignment.centerRight, //random numbers, change later
            child: TextButton(
              onPressed: () {
                //switch the state of the app to calender
                //have this connect to the calendar page
                //change screen to calendar
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const CalendarPage();
                }));
              },
              child: const Text("Todos")),
            ),

            // text to display the first two upcoming events
            Container(
            color: const Color.fromRGBO(255, 249, 233, 0.694),
            alignment: Alignment.bottomRight, //random numbers, change later
            padding: const EdgeInsets.all(10.0), //change later
            //margin: , //add this later
            //decoration: BoxDecoration(),
            child: ListView(
              shrinkWrap: true,
              children: 
              todaysEvents.getEventList(todaysEvents.getCurrDate())
              //this might need to be redone because the display will be up to datetime.day
              //while events will be further into daytime.hour or even daytime.minute
                .map(
                  (eventItem) => (todaysEvents.getEventList(todaysEvents.currDate).indexOf(eventItem) < 3 
                  && //second check might not be needed but just incase something goes wrong
                  todaysEvents.indexInEventList(todaysEvents.currDate, eventItem) > 0) ? 
                  ListTile( 
                    subtitle: Text(eventItem), //this may need to be reformated since it might be a nested list
                  ) : (todaysEvents.getEventList(todaysEvents.getCurrDate()).isEmpty) ? 
                  const ListTile(subtitle: Text("No events for today currently, to add an event, go to the events page")) :
                  ListTile(subtitle: Text("+ ${max(todaysTodo.itemsInTodoList(todaysTodo.getCurrDate()), 0) - 2} more events for today"))
                ).toList()
            
              
            ),
            ),
          ]
        ),
        
        ],
      ),
      //i might add a bottom navigation bar in the future but for now, eh
    );
  }
  
}

//note to self, tomorrow, try to think from scratch what I want this to look like
//and try to think about pieceing all these parts together in a different way from the way I'm doing it now
//try to piece these things together in a different way than I'm doing right now.



// i have so many resources opened at this point i feel like my pc is going to crash
// 