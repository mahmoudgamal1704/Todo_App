

import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/data/appdata.dart';
import 'package:todoapp/models/providers/listtaskprovider.dart';
import 'package:todoapp/models/providers/mainprovider.dart';
import 'package:todoapp/modules/tasklist/taskitem.dart';
import 'package:todoapp/shared/styles/colors.dart';

class TaskList extends StatelessWidget {
  // const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
     GlobalKey<RefreshIndicatorState>();
    return ChangeNotifierProvider(
      create: (BuildContext context) => ListTaskProvider(),
      builder: (context, child) {
        var tasksprov = Provider.of<MainProvider>(context);
        Future<void> refresh(){
          return tasksprov.getTaskfromFirestore(tasksprov.currentDate);
        }
        return Container(
          color: Theme.of(context).colorScheme.background,
          child: Column(
            children: [
              CalendarTimeline(
                initialDate:  tasksprov.calenderdate,
                firstDate: tasksprov.currentDate.subtract(Duration(days: 365)),
                lastDate: tasksprov.currentDate.add(Duration(days: 365)),
                onDateSelected: (date) {
                  tasksprov.calenderdate = date;
                  return tasksprov.getTaskfromFirestore(date);
                },
                leftMargin: 20,
                monthColor: Theme.of(context).colorScheme.onSecondary,
                dayColor: Theme.of(context).colorScheme.onSurface,
                activeDayColor: Whitecolor,
                activeBackgroundDayColor: Theme.of(context).colorScheme.primary,
                // dotsColor: Whitecolor,
                selectableDayPredicate: (date) => true,
                locale: 'en',
              ),
              SizedBox(height: 20,),
              Expanded(
                  child: RefreshIndicator(
                    key: refreshIndicatorKey,
                    onRefresh: () => refresh(),
                    child: ListView.builder(

                      itemBuilder: (context, index) {
                        return TaskItem(AppData.TasksList[index]);
                      },
                      itemCount: AppData.TasksList.length,),
                  ))
            ],
          ),
        );
      },
      // child: ,
    );
  }

}
