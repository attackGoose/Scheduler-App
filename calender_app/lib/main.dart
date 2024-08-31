import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';
import 'package:provider/provider.dart';

void main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(const MyApp()); // some other parameters from beforesettingsController: settingsController));
}

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
  void getPreviousPage(Widget currentPage) { 

  }

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
    return Scaffold(
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

class 