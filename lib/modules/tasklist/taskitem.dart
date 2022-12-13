import 'package:flutter/material.dart';
import 'package:todoapp/shared/styles/colors.dart';

class TaskItem extends StatelessWidget {
  // const TaskItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onBackground,
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Container(
            width: 5,
            height: 50,
            color: Primarycolor,
          ),
          SizedBox(width: 25,),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('title',style: Theme.of(context).textTheme.subtitle1,),
              Text('date',),
            ],
          )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
            decoration: BoxDecoration(
                color: Primarycolor,
                borderRadius: BorderRadius.circular(10)),
            child: Icon(
              Icons.done,
              color: Whitecolor,
              size: 35,
            ),
          )
        ],
      ),
    );
  }
}
