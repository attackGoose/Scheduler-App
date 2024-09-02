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
        title: const CalendarTitleBar(),
      ),
      backgroundColor: const Color.fromARGB(255, 35, 81, 76),
      body: 
        TableCalendar(
          firstDay: DateTime.utc(2024, 9, 1),
          lastDay: DateTime.utc(2044, 9, 1),
          focusedDay: currDay,

        )
    );
  }



}

class PrevMonthButton extends StatelessWidget {
  const PrevMonthButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: child);
  }
}

class CalendarTitleBar extends StatelessWidget {
  const CalendarTitleBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackButton(child: const Text(""));
  }
}