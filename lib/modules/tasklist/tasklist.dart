import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/data/appdata.dart';
import 'package:todoapp/models/providers/mainprovider.dart';
import 'package:todoapp/modules/tasklist/taskitem.dart';
import 'package:todoapp/shared/styles/colors.dart';
class TaskList extends StatelessWidget {
  // const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tasksprov = Provider.of<MainProvider>(context);
    void refresh() {
      return tasksprov.getTaskfromFirestore();
    }
    final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
     GlobalKey<RefreshIndicatorState>();
    // List tasks = AppData.getTaskfromFirestore();
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
          ),
          SizedBox(height: 20,),
          Expanded(
              child: RefreshIndicator(
                key: refreshIndicatorKey,
                onRefresh: () => tasksprov.getTaskfromFirestore(),
                child: ListView.builder(

                  itemBuilder: (context, index) {
                    return TaskItem(tasksprov.tasks[index]);
                  },
                  itemCount: tasksprov.tasks.length,),
              ))
        ],
      ),
    );
  }

}
