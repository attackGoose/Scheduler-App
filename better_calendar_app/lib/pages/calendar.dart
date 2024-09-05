// ignore: unused_import
import 'package:better_calendar_app/main.dart';
import 'package:better_calendar_app/providers/date_providers.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

//learn how to create different pages in an app tomorrow, aka front end stuff which is for tmr
//add a bottom nav bar for this


class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _selectDay = CalDates.currDate;
  static DateTime _focusDay = CalDates.currDate;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  //provider: .read is just to get the value which I can then use, which is what I need
  // .watch is to listen to new values, to access the data

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Calendar Page"),
        titleSpacing: 0.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.6,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25)
          )
        ),
        elevation: 0.8,
        backgroundColor: const Color.fromRGBO(120, 181, 255, 0.8),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(255, 230, 160, 0.729)
        ),
        child: TableCalendar(
          firstDay: DateTime.utc(2024, 9, 1),
          lastDay: DateTime.utc(2044, 9, 1),
          focusedDay: DateTime.now(),
          selectedDayPredicate: (day) { //checks the selected day is the same as the current viewing date
            return isSameDay(_selectDay, day);
          },
          onDaySelected: (selectedDay, focusDay) {
            setState(() { //this basically tells the widget that a change has been made to it, 
                  //        and to reload the widget to impliment these changes
              _selectDay = selectedDay;
              _focusDay = focusDay;
              CalDates.updateFocusDate(focusDay);
            }
            );
          },
          calendarFormat: _calendarFormat,
          onFormatChanged: (format) { 
            //dynamically updates visible calendar format
            setState(() {
              _calendarFormat = format;
            });
          },
          //makes sure that the calendar's focus day doesn't reset to its initial state before month change
          onPageChanged: (focusDay) {
            //not using setState() because if the widget gets rebuilt (via page change) later on, it will use the proper focusDay
            _focusDay = focusDay;
          },
          //praying that this works
          eventLoader: (day) {
            return EventList.getEventsForSelectDay(_focusDay);
          },
          
        )

      )
    );
  }
}
//() => expression shortcut: basically does:
// () {
//   expression
// }

//Todos: add button functionality