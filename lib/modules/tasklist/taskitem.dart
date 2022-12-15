import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/%20layout/edittaskbottom.dart';
import 'package:todoapp/models/providers/mainprovider.dart';
import 'package:todoapp/shared/items/showdialog.dart';
import 'package:todoapp/shared/network/local/firebase_utls.dart';
import 'package:todoapp/shared/styles/colors.dart';

import '../../models/data/task.dart';
import '../../models/providers/listtaskprovider.dart';

class TaskItem extends StatelessWidget {
  // const TaskItem({Key? key}) : super(key: key);

  Task task;

  TaskItem(this.task);

  @override
  Widget build(BuildContext context) {
    var tasksprov = Provider.of<MainProvider>(context);
    void EditTaskBottomSheet(BuildContext context) {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: EditTaskBottom(task),
          );
        },
      ).whenComplete(() {
        tasksprov.refreshlist();
      });
    }
    var taskprov = Provider.of<ListTaskProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        key: const ValueKey(0),
        enabled: !task.isDone,
        startActionPane: ActionPane(
          motion: BehindMotion(),
          extentRatio: .2,
          dragDismissible: false,
          closeThreshold: .1,
          children: [
            SlidableAction(
              // flex: 2,
              borderRadius: BorderRadius.circular(8),
              padding: EdgeInsets.all(9),
              onPressed: (context) {
                // taskprov.deleteTaskfromFirestore(task);
                ShowDialog.showMyDialog(context,taskprov.deleteTaskfromFirestore,task);
              },
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: BehindMotion(),
          extentRatio: .2,
          dragDismissible: false,
          closeThreshold: .1,
          children: [
            SlidableAction(
              // flex: 2,
              borderRadius: BorderRadius.circular(8),
              padding: EdgeInsets.all(9),
              onPressed: (context) {
                EditTaskBottomSheet(context);
              },
              backgroundColor: Greencolor,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'edit',
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onBackground,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Container(
                width: 5,
                height: 50,
                decoration: BoxDecoration(
                  color: Primarycolor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                width: 25,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${task.title}',
                    style: task.isDone ? Theme.of(context).textTheme.subtitle2:Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    '${DateFormat('hh:mm a').format(DateTime.fromMicrosecondsSinceEpoch(task.date))}',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              )),
              task.isDone ? Text('Done!',style: Theme.of(context).textTheme.subtitle2,):
              InkWell(
                onTap: () {
                  task.isDone=true;
                  taskprov.updateTask(task);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                  decoration: BoxDecoration(
                      color: Primarycolor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Icon(
                    Icons.done,
                    color: Whitecolor,
                    size: 35,
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
