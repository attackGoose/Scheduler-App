import 'package:better_calendar_app/providers/date_providers.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

//learn how to create different pages in an app tomorrow, aka front end stuff which is for tmr

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime currDay = CalDates.getCurrDate();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Organizational Calendar App"),
        titleSpacing: 00.0,
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
      body: 
        TableCalendar(
          firstDay: DateTime.utc(2024, 9, 1),
          lastDay: DateTime.utc(2044, 9, 1),
          focusedDay: currDay,

        )
    );
  }
}
