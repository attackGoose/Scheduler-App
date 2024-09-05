import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//I'm using a multiprovider here and connecting
//them as it it would make the code more readable
//and it would also make the backend a connected
//database in a way.

//for using providers: https://www.youtube.com/watch?v=FUDhozpnTUw

class CalDates extends ChangeNotifier {

  //this class stores the days
  static DateTime selectedDate = DateTime.now();
  static DateTime currDate = DateTime.now();
  final dateFormatter = DateFormat('MM-dd-yyyy');
  late String printToday = dateFormatter.format(currDate);
  

  static void updateFocusDate(DateTime day) { 
    //this method isgoing to also be used by the other classes to update the curr date
    selectedDate = day; //this is a static variable so no need for the notifylistener() method
  } //use this method to switch between the days in the calendar

  //the actual front end app is going to use these methods to have the calender be nice nice

}

class TodoList extends ChangeNotifier {
  
  DateTime currDate = CalDates.currDate;

  static Map<DateTime, List<String>> todoListItems = {};

  Map getTodoList(DateTime day) {
    return todoListItems;
  }

  void addToTodoList(String item) {
    //todoListItems[DateTime.now()] = todoListItems[DateTime.now()].add(item);
    (todoListItems[DateTime.now()] == null) ? todoListItems[DateTime.now()] = [] : todoListItems[DateTime.now()];
    todoListItems.update(
      DateTime.now(),
      (currTodos) {
        currTodos.add(item);
        return currTodos;
      },
    );
    notifyListeners();
    //just adds an item to the end of that day's todo list, nothing too complicated
  }

  void completeToDo(int todoIndexNumber) { //gets rid of completed todos
    todoListItems[DateTime.now()]!.removeAt(todoIndexNumber);
    notifyListeners();
  }

  //this freaking thing threw up so many errors it took me an hour to fix all of them
  void carryOverTodosFromPrev(DateTime prevDay) {
    todoListItems[currDate] = todoListItems[currDate]! + todoListItems[prevDay]!;
    todoListItems.clear();
  }
}

class EventList extends ChangeNotifier {
  DateTime currDate = CalDates.currDate;
  static Map<DateTime, List> events = {};

  //the datetime should also contain a time value somewhere
  //day: time: event details
  //make sure that the order is title, Travel time, timeStart, end time, event details

  void addEventItem(DateTime time, List event) async { //testing out the async keyword
    //this will be replaced by a LinkedHashMap in the future to improve efficiency
      events[time]!.add(event);
      notifyListeners();
  }

  void removeEventItem(int time) { 
    events[currDate]![time]!.clear();
    notifyListeners();
  }

  //the null thing is really annoying, helpful but annying
  static List getEventsForSelectDay(DateTime day) {
      return events[day]!;
  }

  // void eventNotify() {
  //   //this will basically send the user a notification once an event is happening.
  //   //i can check events every minute to make it a bit more efficient rather than every milisecond
  //   //https://www.courier.com/guides/flutter-notifications/
  //   // i'll add in this functionality once I have everything done with
  // }
}



