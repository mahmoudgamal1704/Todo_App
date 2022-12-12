import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/%20layout/addtaskbotom.dart';
import 'package:todoapp/models/providers/tabprovider.dart';
import 'package:todoapp/modules/setting/setting.dart';
import 'package:todoapp/modules/tasklist/tasklist.dart';
import 'package:todoapp/shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeLayout extends StatelessWidget {
  // const HomeLayout({Key? key}) : super(key: key);
  static const String RouteName = 'Home';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TapsProvider(),
      builder: (context, child) {
        var tapProvider = Provider.of<TapsProvider>(context);
        return Scaffold(
          extendBody: true,
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.title ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                AddTaskBottomSheet(context);
              },
              child: Icon(Icons.add),
              //border for float button
              shape:
                  StadiumBorder(side: BorderSide(color: Whitecolor, width: 3))),
          bottomNavigationBar: BottomAppBar(
            // color: Colors.transparent,
            // color: Color.fromRGBO(255, 0, 0, 1.0),
            notchMargin: 10,
            shape: CircularNotchedRectangle(),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              currentIndex: tapProvider.tapindex,
              onTap: (value) {
                tapProvider.ChangeIndex(value);
                //here we should use provider
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.list,
                      size: 30,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.settings,
                      size: 30,
                    ),
                    label: ''),
              ],
            ),
          ),
          body: tabs[tapProvider.tapindex],
        );
      },
    );
  }

  void AddTaskBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return AddTaskBottom();
      },
    );
  }

  List<Widget> tabs = [TaskList(), Settings()];
}
