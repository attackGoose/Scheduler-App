// ignore: unused_import
import 'package:better_calendar_app/pages/calendar.dart';
// ignore: unused_import
import 'package:better_calendar_app/pages/date_events.dart';
import 'package:better_calendar_app/pages/home_page.dart';
import 'package:better_calendar_app/providers/date_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
// ignore: unused_import
import 'package:table_calendar/table_calendar.dart';

//this is also the home page of the app

void main() { //this runs the app, and in the run app, we can choose what we want to run
  runApp(const MainApp());
}

//https://blog.logrocket.com/creating-multi-page-app-flutter/

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TodoList(date: context.watch<CalDates>().getSelectedDate()) //this allows the entire application to use this provider
        ),
        ChangeNotifierProvider(
          create: (context) => EventList()
        ),
        ChangeNotifierProvider(
          create: (context) => CalDates()
        )
      ],
      //have this connect to the home_page.dart page
      child: const MaterialApp(
        //theme: , //add this later
        //TODO: add pop methods in calendar, home_page, and todo_page to ensure that there aren't too many layers
        home: HomePage(),
        //error here: unexpected null value, main.dart:38:15. maybe this has to do with the providers
      )
    );
  }
}

//previous code: will use later as a reference for what to maybe add on later
/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override //this creates the first layer (base layer) of the app
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        //main calender widget
        ChangeNotifierProvider(
          create: (context) => AppState(),
          child: MaterialApp(
            title: 'Advanced Calender App',
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 170, 218, 240)),
            ),
            home: HomePage(), //made the base of the app
          ),
        ),

        //todo list widget
        ChangeNotifierProvider(
          create: (context) => AppState(),
          child: MaterialApp(
            title: 'Calender Day Todo List',
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 244, 186, 249))
            )
          )
        )

        //add one for the selection screen and one for the event screen
      ]
    );
  }

}
//each calender button will have an id (if possible), and each id corresponds to an item on a "dictionary" in python
//terms, and we pull up the id, it will have 2 choices, edit todo list, or edit events. 
//when each one is clicked, we would want the screen to show a notepad (maybe on the side/bottom if there is room,
//if not, then over the calender display). from here, all text that is entered would be saved.
//for events specifically, a time would be added (manditory) as well as a "travel time", and from this, we would 
//notify during the travel time for the event. Title, location, and travel time would be optional.
//text can be: "get ready for {title:event} {BuildContext context.watch<MyAppState>().exists or smth) ? "at" + location : " "}, 
//travel time will be approximately {travel time}"
class AppState extends ChangeNotifier {
  //the button is in the home page under scaffold

  void getSelectionButtons() {
    //do something here to get to the selection list for the user to select either todos or events

  }

  void getTodoListEditable() {
    //basically notepad for stuff they have to do

  }

  void getEventListEditable() {
    //adds to the event list

  }
}


class HomePage extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    //ui design, learning how to make a 
    return const Scaffold(
      body: Column(
        children: [ 
          //this part I might change later into its own widget because its going to be a major portion
          //so I'll leave it empty for now and work on it tomorrow some more
          
        ],
      )
      //add a extend for the body for the notepad? I want to close the calender screen and then change the
      //screen to a selection screen, and etc
      // there will be a back button as well
    )
  } 
}

*/