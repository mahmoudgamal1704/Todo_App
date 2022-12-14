import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/data/task.dart';
import 'package:todoapp/models/providers/addtaskprovider.dart';
import 'package:todoapp/models/providers/listtaskprovider.dart';
import 'package:todoapp/models/providers/mainprovider.dart';
import 'package:todoapp/shared/styles/colors.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../shared/network/local/firebase_utls.dart';

class AddTaskBottom extends StatelessWidget {
  // const AddTaskBottom({Key? key}) : super(key: key);

  static final GlobalKey<FormState> frmKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddTaskProvider(),
      builder: (context, child) {
        var prov = Provider.of<AddTaskProvider>(context);
        // var taskprov = Provider.of<ListTaskProvider>(context);
        return Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppLocalizations.of(context)!.addtitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: 10,
              ),
              Form(
                  key: frmKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: prov.titleController,
                        validator: (value) {
                          if (value?.trim() == "" || value == null) {
                            return 'Please Enter your title';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            label: Text(AppLocalizations.of(context)!.taskname),
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
                        controller: prov.discrpController,
                        validator: (value) {
                          if (value?.trim() == "" || value == null) {
                            return 'Please Enter your title';
                          }
                          return null;
                        },
                        maxLines: 3,
                        decoration: InputDecoration(
                            label: Text(AppLocalizations.of(context)!.taskdesc),
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
                AppLocalizations.of(context)!.datetitle,
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
                  '${DateFormat.yMMMEd(AppLocalizations.of(context)!.datelang).format(prov.selectedDate)}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (frmKey.currentState!.validate()) {
                    Task task = Task(
                        title: prov.titleController.text,
                        description: prov.discrpController.text,
                        date: prov.selectedDate.microsecondsSinceEpoch);
                    addTaskToFireStore(task);
                    prov.refresh();
                    // taskprov.getTaskfromFirestore(taskprov.currentDate);
                  }
                },
                child: Text(AppLocalizations.of(context)!.addbutt,
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        ?.copyWith(fontSize: 20)),
              )
            ],
          ),
        );
      },
    );
  }
}
