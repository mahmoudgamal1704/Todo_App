import 'package:flutter/material.dart';
import 'package:todoapp/shared/styles/colors.dart';

class AddTaskBottom extends StatelessWidget {
  // const AddTaskBottom({Key? key}) : super(key: key);
  var titleController = TextEditingController();
  var discrpController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add New Task',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 10,
          ),
          Form(
              child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                    label: Text('Title'),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Primarycolor)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Primarycolor))),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: discrpController,
                maxLines: 3,
                decoration: InputDecoration(
                    label: Text('Description'),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Primarycolor)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Primarycolor))),
              ),
            ],
          )),
          SizedBox(
            height: 20,
          ),
          Text(
            'Select Date',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              SelectDate(context);
            },
            child: Text(
              '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: () {}, child: Text('Add Task'))
        ],
      ),
    );
  }

  SelectDate(BuildContext context) async {
    DateTime? chossendate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chossendate == null) return;
    selectedDate = chossendate;
  }
}
