import 'package:flutter/material.dart';

//learn how to create different pages in an app tomorrow, aka front end stuff which is for tmr
//add a bottom nav bar for this

//this will use the providers as a database and backend for the logic and for abstract programming
//to make my life easier

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      
    );
  }

  void currentTodoItem() { //shows you which todo item you're editing at the current moment

  } //actually i'll add this in the front end since i can just use a stateful widget and edit it in there
}