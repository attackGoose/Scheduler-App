import 'package:better_calendar_app/providers/date_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//front end stuff for tmr
//add a bottom nav bar for this

//this will use the providers as a database and backend for the logic and for abstract programming
//to make my life easier

//I'm going to use a listview widget here to make my life easier and just pull from the 
//firebase database that i'll store somewhere

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
          ListView(
            children: context.watch<TodoList>().getTodoList(_focusDayTodo)
            .map(
              (todoItem) => (context.watch<TodoList>().indexInTodoList(_focusDayTodo, todoItem) > 0) 
              ? ListTile(subtitle: Text(todoItem),) : 
              const ListTile(subtitle: Text("No more todos for today"),)
            ).toList()  //list this out later
          ) 
        ],
      ),

    );
  }

}