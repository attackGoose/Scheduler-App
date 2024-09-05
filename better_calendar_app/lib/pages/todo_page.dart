import 'package:better_calendar_app/providers/date_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//front end stuff for tmr
//add a bottom nav bar for this

//this will use the providers as a database and backend for the logic and for abstract programming
//to make my life easier

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final DateTime _focusDayTodo = CalDates.selectedDate ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //this line will be wrapped with a ton of other stuff to make it organized and nice nice
      appBar: AppBar(
        title: const Text("{Selected Day} Todos"),
      ),
      body: Column(
        children: [ //I'll style it later and edit the placement of the events so that its not jumbled
          Text(
            context.watch<TodoList>().getTodoList(_focusDayTodo) as String //list this out later
          ) 
        ],
      ),

    );
  }

}