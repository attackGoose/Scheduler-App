import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//I'm using a multiprovider here and connecting
//them as it it would make the code more readable
//and it would also make the backend a connected
//database in a way.

//for using providers: https://www.youtube.com/watch?v=FUDhozpnTUw

//using current backend structure because this allows for each page to be on different days, which can 
//be helpful for comparing items on different days. by default they will be on the same day but can be
//switched

//i should have a system for them to all be on the backend, since they're both referencing CalDates for the
//day key they're getting the info from, i can optionally link it probably

class CalDates extends ChangeNotifier {
  //this class stores the days 
  //each day will have a todo and a events list
  //Map<DateTime, List<dynamic>> calDateInfo = {};

  //this can change depending on focus day (selected in the calendar page)
  static DateTime currDate = DateTime.now();
  final dateFormatter = DateFormat('MM-dd-yyyy');
  late String printToday = dateFormatter.format(selectedDate);

  //for selecting a different day, one checks if its the same day, if it is, do smth, these values change denending on the selected day
  static DateTime focusDate = DateTime.now();
  static DateTime selectedDate = DateTime.now();

  CalDates({DateTime? focusDay, DateTime? selectedDay}) {
    focusDate = focusDay ?? DateTime.now();
    selectedDate = selectedDay ?? DateTime.now();
  }

  DateTime getCurrDate() {
    return currDate;
  }

  DateTime getSelectedDate() {
    return selectedDate;
  }

//not sure if this function is needed or not
  void updateFocusDate(DateTime day) {
    //this method isgoing to also be used by the other classes to update the curr date
    selectedDate = day;
    //this is a static variable so no need for the notifylistener() method
  } //use this method to switch between the days in the calendar
}

//TODO: restructure todo list backend (this), we only need the date/month/year and none of the other information that DateTime provides
//because then that will be stored as new information (since every second will be counted as a new key)
//and have a new list, which will blow up the program when I try to run it
//also i need an initial value in the list otherwise this will raise an error (unexpected null value)
//I think in the front end code, so figure out how to make it only use mm/dd/yyyy
//ideally I want to create different TodoList Objects for different days but this might not be possible
class TodoList extends CalDates {
  late DateTime currDate; //because each item will be a property of a CalDate, i don't think the map is required
  late List<int> dateKey;
  //going to switch to a json file later for better storage practices
  static Map<List<int>, List<String>> todoListItems =
      {}; //i need the mm/dd/yyyy only
  //the list is mm/dd/yyyy

  TodoList({required DateTime date}) {
    //this is to ensure that it doesn't raise an unexpected null error, this should be done for every new date
    currDate = date;
    List<int> dateKey = [currDate.month, currDate.day, currDate.year];
    todoListItems[dateKey] =
        []; //makes sure the entry isn't empty so it doesn't blow up my code
  }

  List<String> getTodoList(DateTime day) {
    List<int> dayKey = [day.month, day.day, day.year];
    return todoListItems[dayKey] ?? [];
  }

  void addToTodoList(String item) {
    //todoListItems[DateTime.now()] = todoListItems[DateTime.now()].add(item);
    (todoListItems[dateKey] == null) //checks if it exists
        ? todoListItems[dateKey] = []
        : todoListItems[dateKey];
    todoListItems.update(
      dateKey,
      (currTodos) {
        currTodos.add(item);
        return currTodos;
      },
    );
    notifyListeners();
    //just adds an item to the end of that day's todo list, nothing too complicated
  }

  void completeToDo(int todoIndexNumber) {
    //gets rid of completed todos
    if (todoIndexNumber > todoListItems[dateKey]!.length) {
      return;
    }
    todoListItems[dateKey]!.removeAt(todoIndexNumber);
    notifyListeners();
  }

  void addNewDay(DateTime day) {
    List<int> dayKey = [day.month, day.day, day.year];
    todoListItems[dayKey] = [];
  }

  void carryOverTodosFromPrev(DateTime prevDay) {
    List<int> prevDateKey = [prevDay.month, prevDay.day, prevDay.year];
    todoListItems[dateKey] =
        todoListItems[dateKey]! + todoListItems[prevDateKey]!;
    todoListItems.clear();
  }

  int itemsInTodoList(DateTime day) {
    List<int> dayKey = [day.month, day.day, day.year];
    return todoListItems[dayKey]?.length ?? 0;
    //if the thing is null or doesn't exist, then it returns 0
    //! used in this way basically means that this can not be null,
  }

  String finalDisplayStatement(DateTime day) {
    List<int> dayKey = [day.month, day.day, day.year];
    int lengthOfList = todoListItems[dayKey]!.length - 1; 
    //this is an index of the last item in the list
    // if this value is null i'm absolutely screwed so thanks to previous code redundancy, it will not be null

    if (itemsInTodoList(day) == 3) {
      return todoListItems[dayKey]![
          lengthOfList]; //bad thing about using a ! is that code will self destruct if there's a null value
    } else if (itemsInTodoList(day) < 3) {
      return "";
    } else {
      return "+ ${lengthOfList - 1} more items in todo list scheduled for today";
    }
    // return ((itemsInTodoList(day) == 3) ?
    //              todoListItems[day]![todoListItems[day]!.length] :
    //              "+ $additionalLengthOfList more items in todo list scheduled for today");
  }

  //for the todo page, each day will be limited to a certain amount of todos,
  //each todo will be during "working time" events
  //the priority todos (at the top of the ordered list) will be done first,
  //rest will be carried to tomorrow on the top of the todo list and get pushed
  //further down the list if needed to be carried to future dates
}

class EventList extends CalDates {
  DateTime currDate = CalDates.currDate;
  static Map<DateTime, List> events = {};

  //the datetime should also contain a time value somewhere
  //day: time: event details
  //make sure that the order is title, Travel time, timeStart, end time, event details

  List? getEventList(DateTime focusDay) {
    return events[focusDay];
  }

  void addEventItem(DateTime time, List event) async {
    //testing out the async keyword
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

  //TODO: add functions for schedule management, like time conflicts (if they want
  //to leave that alone or to resolve it), and additional information. I will impliment this
  //tomorrow as my schedule today/saturday is too full and I need a break
}
