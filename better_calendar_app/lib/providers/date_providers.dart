import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalDates extends ChangeNotifier {
  //this class will have both a todolist and an event attribute, both class's providers are listed below
  //each day will have these two attributes (which is a given), but the values will be unique to each day
  //to save on space and efficiency, first all the previous days will not be viewable, but future days will
  //events on past days will also be deleted which is a given since they don't exist anymore

//if not done this way then i will need to have a class that represents the dates, todos and events in the day,
//and something to change the date for the future

//this starts off 


  late DateTime currDate;

  //add something to watch both of these values.
  //this class is the backend of the calendar,
  //which displays the values that are present here
  late TodoList todoList;
  EventList currDayEvents = EventList();

  void changeCurrentDay(int date) {
    currDate = date;
    notifyListeners();
  }
  
  List getTodoList() {
    return todoList.todoListItems;
  }
  List getEventList() {
    return currDayEvents.eventListItems;
  }

}

class TodoList extends ChangeNotifier {
  
  DateTime currDate = DateTime.now();
  List<String> todoListItems = [];
  todoListItems.insert(0, prevTodoList);

  void addToTodoList(String newTodoItem) {
    todoListItems.insert(0, newTodoItem);
    notifyListeners();
    //just adds an item to the end of that day's todo list, nothing too complicated
  }

  void completeToDo(int todoIndexNumber) { //gets rid of completed todos
    todoListItems.removeAt(todoIndexNumber);
    notifyListeners();
  }

}

class EventList extends ChangeNotifier {
  List<Map> eventListItems = [];
  //make sure that the order is title, Travel time, timeStart, end time, event details

  void addEventItem(Map event) {
    eventListItems.add(event);
    notifyListeners();
  }

  void eventNotify() {
    //this will basically send the user a notification once an event is happening.
    //i can check events every minute to make it a bit more efficient rather than every milisecond
    //https://www.courier.com/guides/flutter-notifications/
  }
}

