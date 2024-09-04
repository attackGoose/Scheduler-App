// ignore: unused_import
import 'package:better_calendar_app/main.dart';
import 'package:flutter/material.dart';
import 'package:better_calendar_app/providers/date_providers.dart';
import 'package:provider/provider.dart';
//this is th starting screen. "Hello" at the top
//and "Home" on the appbar
// below are 3 buttons listed in vertical or
//slightly zigzag order or tilted order

//this should be used to navigate between the pages

//there's a nullvalue somewhere so i needa fix that

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

//TODO:i need to put something in the setState() functions to fix the error otherwise my page will not work

//https://blog.logrocket.com/creating-multi-page-app-flutter/
class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    var getToday = context.watch<CalDates>();
    var today = getToday.printToday;

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
            alignment: const Alignment(24, 74), //random numbers, change later
            child: TextButton(
              onPressed: () {setState() => { //switch the state of the app to calender
                //have this connect to the calendar page
                //change screen to calendar
              };
              },
              child: const Text("Calendar"),
              ),
            ),

            //todo list
            Container(
            color: const Color.fromRGBO(255, 249, 233, 0.694),
            //style it more later
            alignment: const Alignment(24, 74), //random numbers, change later
            child: ListView(
              children:  [
                const ListTile(
                  subtitle: Text("get first todo item")
                ), //i want the icon to be a dot for todo
                const ListTile(
                  subtitle: Text("get second todo item")
                ),
                (TodoList.todoListItems[CalDates.currDate]![3]) ? 
                const ListTile(
                  subtitle: Text("+ more events")
                ) : const ListTile(
                  subtitle: Text("No More Events For Today")
                )
                  
              ],
            )
            ),

            //events button
            Container(
            color: const Color.fromRGBO(255, 249, 233, 0.694),
            alignment: const Alignment(24, 74), //random numbers, change later
            child: TextButton(
              onPressed: () {setState() => { //switch the state of the app to calender
                //have this connect to the calendar page
                //change screen to calendar
              };
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
            child: Text("Date: $today"),
            ),
            
            //button to take you to the todo page to add or edit tasks
            Container(
            color: const Color.fromRGBO(255, 249, 233, 0.694),
            //style it more later
            alignment: const Alignment(24, 74), //random numbers, change later
            child: TextButton(
              onPressed: () {
                setState() => { //switch the state of the app to calender
                //have this connect to the calendar page
                //change screen to calendar
              };
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