import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/providers/addtaskprovider.dart';
import 'package:todoapp/shared/styles/colors.dart';

class AddTaskBottom extends StatelessWidget {
  // const AddTaskBottom({Key? key}) : super(key: key);
  var titleController = TextEditingController();
  var discrpController = TextEditingController();

  // DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddTaskProvider(),
      builder: (context, child) {
        var prov = Provider.of<AddTaskProvider>(context);
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
                  prov.SelectDate(context);
                },
                child: Text(
                  '${prov.selectedDate.day}/${prov.selectedDate.month}/${prov.selectedDate.year}',
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
      },
    );
  }
}
