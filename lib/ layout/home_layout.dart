import 'package:flutter/material.dart';
import 'package:todoapp/%20layout/addtaskbotom.dart';
import 'package:todoapp/modules/setting/setting.dart';
import 'package:todoapp/modules/tasklist/tasklist.dart';
import 'package:todoapp/shared/styles/colors.dart';

class HomeLayout extends StatelessWidget {
  // const HomeLayout({Key? key}) : super(key: key);
  static const String RouteName = 'Home';
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text('Route Tasks'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          AddTaskBottomSheet(context);
        }, child: Icon(Icons.add),
          //border for float button
      shape: StadiumBorder(
        side: BorderSide(
          color: Whitecolor,
          width: 3
        )
      )),
      bottomNavigationBar: BottomAppBar(
        // color: Colors.transparent,
        notchMargin: 10,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          currentIndex: currentindex,
          onTap: (value) {
            currentindex = value;
            //here we should use provider
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list, size: 30,), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings, size: 30,), label: ''),
          ],
        ),
      ),
    body: tabs[currentindex],
    );
  }
  
  void AddTaskBottomSheet(BuildContext context){
    showModalBottomSheet(context: context, builder:(context) {
      return AddTaskBottom();
    }, );
  }
  List<Widget> tabs=[TaskList(),Settings()];
}
