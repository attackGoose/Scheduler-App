import 'package:flutter/material.dart';

class TodoListProvider extends ChangeNotifier {
  List<String> todoListItem = [];

  void addToTodoList(String newTodoItem) {
    todoListItem.insert(0, newTodoItem);
    notifyListeners();
    //just adds an item to the end of that day's todo list, nothing too complicated
  }

  void completeToDo(int todoIndexNumber) { //gets rid of completed todos
    todoListItem.removeAt(todoIndexNumber);
    notifyListeners();
  }

  void carryOver() {//this function will basically carry over past incomplete todo to current/next day
    //on a second thought this function might be included in the calendar provider, which will basically
    //encompass these two
  }
}

class EventListProvider extends ChangeNotifier {
  List<Map> eventListItem = [];
  //make sure that the order is title, Travel time, timeStart, end time, event details

  void addEventItem(Map event) {
    eventListItem.add(event);
    notifyListeners();
  }

  void eventNotify() {
    //this will basically send the user a notification once an event is happening.
    //i can check events every minute to make it a bit more efficient rather than every milisecond
    //https://www.courier.com/guides/flutter-notifications/
  }
}

