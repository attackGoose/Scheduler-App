// ignore: unused_import
import 'package:better_calendar_app/main.dart';
import 'package:better_calendar_app/pages/calendar.dart';
import 'package:better_calendar_app/pages/date_events.dart';
import 'package:flutter/material.dart';
import 'package:better_calendar_app/providers/date_providers.dart';
import 'package:provider/provider.dart';
//this is th starting screen. "Hello" at the top
//and "Home" on the appbar
// below are 3 buttons listed in vertical or
//slightly zigzag order or tilted order

//this should be used to navigate between the pages

//TODO: Find the null value in the file cus its the only thing keeping me from testing my code

//https://blog.logrocket.com/creating-multi-page-app-flutter/
class HomePage extends StatelessWidget {
  const HomePage({super.key}); //the class parameters are declared here, like class constructor

  @override
  Widget build(BuildContext context) {
    DateTime todayDate = DateTime.now();

    var totItemsInTodoList = TodoList.itemsInTodoList(todayDate);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Today's Schedule"),
      ),

      body: Row( //
        children: [
          //TODO: finish the list items otherwise they won't even show
          
          //first column, has 3 items, button for calendar, list for todo, and button for event
          Column(
          children: [
            Container(
            color: const Color.fromRGBO(255, 249, 233, 0.694),
            alignment: const Alignment(24, 74), //random numbers, change later
            child: TextButton(
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const CalendarPage();
                }
              ));
              },
              child: const Text("Calendar"),
              ),
            ),

            //todo list
            //something in the back end
            Container(
            color: const Color.fromRGBO(255, 249, 233, 0.694),
            //style it more later
            alignment: const Alignment(24, 74), //random numbers, change later
            child: ListView(
              children: [
                ListTile(
                  subtitle: Text("get first todo item")
                ), //i want the icon to be a dot for todo
                ListTile(
                  subtitle: Text("get second todo item")
                ), 
                // ListTile(
                //   //I might just make this exist if a more todos exist and just display
                //   //2 or 3 at a time
                //   //I think there has to be something in the list for this to not return a null
                //   title: Text(" items in today's todo list"),
                //   //try to add a variable amount of these
                //   //subtitle: Text(TodoList.finalDisplayStatement(todayDate)) //I don't think you can put a conditional statement in a list
                //   //subtitle: Text("test message")
                // ) 
                //I will impliment a system that makes the amount of todos manageable
                //with the amount of time available after events later
                  
              ],
            )
            ),

            //events button
            Container(
            color: const Color.fromRGBO(255, 249, 233, 0.694),
            alignment: const Alignment(24, 74), //random numbers, change later
            child: TextButton(
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) {
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
            alignment: const Alignment(24, 74), //random numbers, change later
            child: Text("Date: $todayDate"),
            ),
            
            //button to take you to the todo page to add or edit tasks
            Container(
            color: const Color.fromRGBO(255, 249, 233, 0.694),
            //style it more later
            alignment: const Alignment(24, 74), //random numbers, change later
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
            alignment: const Alignment(24, 74), //random numbers, change later
            child: ListView(
              children: const [
                ListTile(
                  subtitle: Text("get first event item")
                ), //i want the icon to be a star or dash for events
                ListTile(
                  subtitle: Text("get second event item")
                ) //gets the list of today's events (first 2 upcoming events)
                
              ],
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