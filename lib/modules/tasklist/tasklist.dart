import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:todoapp/shared/styles/colors.dart';
class TaskList extends StatelessWidget {
  // const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) => print(date),
            leftMargin: 20,
            monthColor: Theme.of(context).colorScheme.onSecondary,
            dayColor: Theme.of(context).colorScheme.onPrimary,
            activeDayColor: Whitecolor,
            activeBackgroundDayColor: Theme.of(context).colorScheme.primary,
            dotsColor: Whitecolor,
            selectableDayPredicate: (date) => true,
            locale: 'en',
          )

        ],
      ),
    );
  }
}
