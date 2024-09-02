import 'package:flutter/material.dart';

class CalDates extends ChangeNotifier {

  //this class stores the days
  static DateTime currDate = DateTime.now();

  static DateTime getCurrDate() {
    return currDate;
  }

  void updateCurrDate(DateTime day) { 
    //this method isgoing to also be used by the other classes to update the curr date
    currDate = day;
  } //use this method to switch between the days in the calendar

  //the actual front end app is going to use these methods to have the calender be nice nice

}

class TodoList extends ChangeNotifier {
  
  DateTime currDate = CalDates.currDate;
  Map<DateTime, List> todoListItems = {};

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
  Map<DateTime, Map<int, List>> events = {};
  //make sure that the order is title, Travel time, timeStart, end time, event details

  void addEventItem(int time, List event) {
    Map<int, List> entry = {time: event};
    events[currDate]!.addEntries(entry as Iterable<MapEntry<int, List>>);
    notifyListeners();
  }

  void removeEventItem(int time) {

  }

  // void eventNotify() {
  //   //this will basically send the user a notification once an event is happening.
  //   //i can check events every minute to make it a bit more efficient rather than every milisecond
  //   //https://www.courier.com/guides/flutter-notifications/
  //   // i'll add in this functionality once I have everything done with
  // }
}



